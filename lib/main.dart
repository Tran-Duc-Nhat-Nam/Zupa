import 'dart:io';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:zupa/core/bloc/connectivity/connectivity_cubit.dart';
import 'package:zupa/core/bloc/localization/localization_cubit.dart';
import 'package:zupa/core/bloc/version/version_cubit.dart';
import 'package:zupa/core/bloc/security/security_cubit.dart';
import 'package:zupa/core/bloc/security/security_state.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/styles/theme.dart';
import 'package:zupa/core/widgets/popup/app_dialog.dart';
import 'package:zupa/core/widgets/popup/app_toast.dart';
import 'package:zupa/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:zupa/core/bloc/debugger/debugger_cubit.dart';
import 'package:zupa/core/bloc/theme/theme_cubit.dart';
import 'package:zupa/core/helper/router/router_helper.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:zupa/core/widgets/error/app_error_screen.dart';

Future<void> main() async {
  try {
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    
    // Global Error Boundary
    ErrorWidget.builder = (FlutterErrorDetails details) {
      DebuggerHelper.talker.handle(
        details.exception,
        details.stack,
        'Flutter UI Crash: ${details.exceptionAsString()}',
      );
      return AppErrorScreen(details: details);
    };

    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
    );
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    await configureDependencies();

    runApp(TranslationProvider(child: const MyApp()));
  } catch (e, stack) {
    DebuggerHelper.talker.handle(e, stack, 'Fatal App Initialization Error');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ThemeCubit>()..loadTheme()),
        BlocProvider(create: (_) => getIt<AuthCubit>()..loadAuth()),
        BlocProvider(create: (_) => getIt<LocalizationCubit>()..loadLocale()),
        BlocProvider(
          create: (_) => getIt<ConnectivityCubit>()..monitorConnectivity(),
        ),
        BlocProvider(create: (_) => getIt<VersionCubit>()..checkForUpdates()),
        BlocProvider(create: (_) => getIt<SecurityCubit>()..checkSecurity()),
        if (kDebugMode)
          BlocProvider(create: (_) => getIt<DebuggerCubit>()..loadDebugger()),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  // Changed to StatefulWidget to trigger version check once
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();

    return MultiBlocListener(
      listeners: [
        BlocListener<ThemeCubit, ThemeState>(
          listener: (context, state) {
            state.whenOrNull(
              loaded: (settings) {
                state.whenOrNull(loaded: (_) => FlutterNativeSplash.remove());
              },
            );
          },
        ),
        BlocListener<ConnectivityCubit, ConnectivityState>(
          listener: (context, state) {
            state.whenOrNull(
              connected: () =>
                  AppToast.showToast(t.common.errors.internetConnected),
              disconnected: () =>
                  AppToast.showToast(t.common.errors.noInternet),
            );
          },
        ),
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            state.whenOrNull(
              noAuthenticated: () => router.replaceAll([const LoginRoute()]),
            );
          },
        ),
        BlocListener<VersionCubit, VersionState>(
          listener: (context, state) {
            state.whenOrNull(
              updateAvailable: (info) => DialogHelper.showUpdateDialog(
                context,
                isMandatory: info.isForcedUpdate,
                version: info.latestVersion ?? '',
                onUpdate: () => Platform.isAndroid
                    ? context.read<VersionCubit>().executeUpdate(info)
                    : info.update,
              ),
              maintaining: () => DialogHelper.showMaintenanceDialog(context),
              downloading: (progress, info) => DialogHelper.showDownloadDialog(
                context,
                progressStream: progress,
                version: info.latestVersion,
              ),
              installing: () => DialogHelper.closeAllModal(),
              downloadFailed: (message, _) {
                DialogHelper.closeAllModal();
                AppToast.showNotify(message, type: .error);
              },
            );
          },
        ),
        BlocListener<SecurityCubit, SecurityState>(
          listener: (context, state) {
            state.whenOrNull(
              vulnerable: () => DialogHelper.showSecurityDialog(
                context,
                onQuit: () {
                  if (kDebugMode) {
                    DialogHelper.closeAllModal();
                  } else {
                    SystemNavigator.pop();
                  }
                },
              ),
            );
          },
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (settings) => DynamicColorBuilder(
              builder: (lightDynamic, darkDynamic) {
                return MaterialApp.router(
                  onGenerateTitle: (_) => t.home.appTitle,
                  theme: AppThemes.getTheme(
                    brightness: Brightness.light,
                    colorSource: settings.colorSource,
                    dynamicColorScheme: lightDynamic,
                    customSeedColor: settings.seedColorValue != null
                        ? Color(settings.seedColorValue!)
                        : null,
                  ),
                  darkTheme: AppThemes.getTheme(
                    brightness: Brightness.dark,
                    colorSource: settings.colorSource,
                    dynamicColorScheme: darkDynamic,
                    customSeedColor: settings.seedColorValue != null
                        ? Color(settings.seedColorValue!)
                        : null,
                  ),
                  themeMode: settings.themeMode,
                  debugShowCheckedModeBanner: false,
                  routerConfig: router.config(
                    navigatorObservers: () => [
                      TalkerRouteObserver(DebuggerHelper.talker),
                    ],
                  ),
                  localizationsDelegates: GlobalMaterialLocalizations.delegates,
                  supportedLocales: AppLocaleUtils.supportedLocales,
                  locale: TranslationProvider.of(context).flutterLocale,
                  builder: FlutterSmartDialog.init(),
                );
              },
            ),
            orElse: () => const SizedBox(),
          );
        },
      ),
    );
  }
}
