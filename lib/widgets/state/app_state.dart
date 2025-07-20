import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

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
    log('Set locale to ${locales?.first}', name: 'App state');
    localeChangeCallBack!(locales?.first);
    super.didChangeLocales(locales);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    debugPrint('State changed ${state.name}');
    switch (state) {
      case AppLifecycleState.resumed:
        if (resumeCallBack != null) {
          await resumeCallBack!();
        }
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        if (suspendingCallBack != null) {
          await suspendingCallBack!();
        }
    }
  }
}

abstract class AppState<T extends StatefulWidget> extends State<T> {
  late LifecycleEventHandler observer;
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  Map<String, dynamic> getFormValues() {
    formKey.currentState?.saveAndValidate();
    if (formKey.currentState?.validate() == true) {
      return formKey.currentState!.value;
    }
    return {};
  }
  @override
  void initState() {
    observer = LifecycleEventHandler(
      resumeCallBack: () async {
        setState(
          () {
            // TODO: Check authentication here
            initService(context);
          },
        );
      },
      localeChangeCallBack: (locale) {
        setState(
          () {
            // TODO: Check authentication here
            log('Set locale to ${locale ?? Localizations.localeOf(context)}',
                name: 'App state');
            context.setLocale(locale ?? Localizations.localeOf(context));
            initService(context);
          },
        );
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
