import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/services/storage_service.dart';
import 'package:zupa/gen/strings.g.dart';

class LifecycleEventHandler extends WidgetsBindingObserver {
  final AsyncCallback? onResume;
  final AsyncCallback? onSuspend;
  final ValueChanged<Locale?>? onLocaleChange;

  LifecycleEventHandler({this.onResume, this.onSuspend, this.onLocaleChange});

  @override
  void didChangeLocales(List<Locale>? locales) {
    super.didChangeLocales(locales); // Call super first
    if (locales != null && locales.isNotEmpty) {
      onLocaleChange?.call(locales.first);
    }
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    log('AppLifecycleState: ${state.name}');

    if (state == AppLifecycleState.resumed) {
      await onResume?.call();
    } else {
      // Covers inactive, paused, detached, and hidden
      await onSuspend?.call();
    }
  }
}

abstract class AppState<T extends StatefulWidget> extends State<T> {
  late final LifecycleEventHandler _observer;
  final StorageService _storageService = getIt<StorageService>();

  @override
  void initState() {
    super.initState();
    _observer = LifecycleEventHandler(
      onResume: _handleResume,
      onLocaleChange: _handleLocaleChange,
    );
    WidgetsBinding.instance.addObserver(_observer);

    // Initial setup
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initService(context);
    });
  }

  Future<void> _handleResume() async {
    final auth = await _storageService.getAuth();

    if (!mounted) return; // Critical safety check

    if (auth != null) {
      initService(context);
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
    }
  }

  void _handleLocaleChange(Locale? locale) {
    if (locale == null) return;

    final newLocale = AppLocale.values.firstWhere(
      (e) => e.languageCode == locale.languageCode,
      orElse: () => AppLocale.en, // Provide a fallback
    );

    LocaleSettings.setLocale(newLocale);
    if (mounted) {
      setState(() => initService(context));
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_observer);
    super.dispose();
  }

  @protected
  Future<void> initService(BuildContext context) async {}
}
