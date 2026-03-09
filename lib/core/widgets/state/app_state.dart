import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/helper/version/version_helper.dart';
import 'package:zupa/core/services/storage_service.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';

class LifecycleEventHandler extends WidgetsBindingObserver {
  final AsyncCallback? onResume;
  final AsyncCallback? onSuspend;
  final ValueChanged<Locale?>? onLocaleChange;
  AppLifecycleState? _lastState;

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
    if (state == _lastState) return; // Ignore if state didn't actually change
    _lastState = state;

    DebuggerHelper.talker.log('App Lifecycle State: ${state.name}');

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
  bool _isResuming = false;
  DateTime? _lastVersionCheck;
  static const _checkThreshold = Duration(minutes: 1);

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
    if (_isResuming) {
      DebuggerHelper.talker.log(
        'Resume already in progress, skipping duplicate trigger.',
      );
      return;
    }

    try {
      _isResuming = true;

      final auth = await _storageService.getAuth();

      if (!mounted) return; // Critical safety check

      if (auth != null) {
        initService(context);
      } else {
        context.router.replaceAll([const LoginRoute()]);
      }

      final now = DateTime.now();

      if (_lastVersionCheck == null ||
          now.difference(_lastVersionCheck!) > _checkThreshold) {
        DebuggerHelper.talker.log('Performing version check...');
        final isSuccessful = await VersionHelper.checkUpdate(context);

        if (!isSuccessful) return;
        _lastVersionCheck = DateTime.now();
      } else {
        DebuggerHelper.talker.log(
          'Skipping version check (Last check was ${now.difference(_lastVersionCheck!).inMinutes}m ago)',
        );
      }
    } on Exception catch (e) {
      DebuggerHelper.talker.log('Error during resume: $e');
    } finally {
      _isResuming = false;
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
