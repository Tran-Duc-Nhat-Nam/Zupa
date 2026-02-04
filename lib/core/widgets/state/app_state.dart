import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/services/storage_service.dart';
import 'package:zupa/gen/strings.g.dart';

class LifecycleEventHandler extends WidgetsBindingObserver {
  final void Function(Locale? locale)? localeChangeCallBack;
  final AsyncCallback? resumeCallBack;
  final AsyncCallback? suspendingCallBack;

  LifecycleEventHandler({
    this.localeChangeCallBack,
    this.resumeCallBack,
    this.suspendingCallBack,
  });

  @override
  void didChangeLocales(List<Locale>? locales) {
    localeChangeCallBack?.call(locales?.first);
    super.didChangeLocales(locales);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    log('State changed ${state.name}');
    switch (state) {
      case .resumed:
        await resumeCallBack?.call();
      case .inactive:
      case .paused:
      case .detached:
      case .hidden:
        await suspendingCallBack?.call();
    }
  }
}

abstract class AppState<T extends StatefulWidget> extends State<T> {
  late LifecycleEventHandler observer;
  final StorageService _storageService = getIt<StorageService>();
  @override
  void initState() {
    observer = LifecycleEventHandler(
      resumeCallBack: () async {
        if ((await _storageService.getAuth()) != null) {
          log('Is Auth');
          if (mounted) initService(context);
        } else {
          if (mounted) {
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil('/login', (route) => false);
          }
        }
      },
      localeChangeCallBack: (locale) {
        if (locale != null) {
          setState(() {
            LocaleSettings.setLocale(
              AppLocale.values.firstWhere(
                (element) => element.languageCode == locale.languageCode,
              ),
            );
            initService(context);
          });
        }
      },
    );
    WidgetsBinding.instance.addObserver(observer);
    super.initState();
    initService(context);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(observer);
    super.dispose();
  }

  Future<void> initService(BuildContext context) async {}
}
