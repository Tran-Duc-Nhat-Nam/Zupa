import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:upgrader/upgrader.dart';
import 'package:zupa/core/bloc/connectivity/connectivity_cubit.dart';
import 'package:zupa/core/bloc/localization/localization_cubit.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/styles/theme.dart';
import 'package:zupa/core/widgets/popup/app_toast.dart';

import 'package:zupa/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:zupa/core/bloc/debugger/debugger_cubit.dart';
import 'package:zupa/core/bloc/theme/theme_cubit.dart';
import 'package:zupa/core/models/form/theme/theme_settings_form.dart';
import 'package:zupa/core/helper/router/router_helper.dart';

import 'package:zupa/core/di/injection.dart';
import 'package:zupa/gen/strings.g.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    // Parallelize independent initializations
    await Future.wait([configureDependencies()]);

    runApp(
      // Move TranslationProvider to the very top
      TranslationProvider(child: const MyApp()),
    );
  } catch (e, stack) {
    // Log fatal initialization errors
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
        if (kDebugMode)
          BlocProvider(create: (_) => getIt<DebuggerCubit>()..loadDebugger()),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();

    return MultiBlocListener(
      listeners: [
        BlocListener<ConnectivityCubit, ConnectivityState>(
          // Listen for connectivity changes globally
          listener: (context, state) {
            state.whenOrNull(
              connected: () => AppToast.showToast(t.internetConnected),
              disconnected: () => AppToast.showToast(t.noInternet),
            );
          },
        ),
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            state.whenOrNull(
              noAuthenticated: () {
                router.replaceAll([const LoginRoute()]);
              },
            );
          },
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        // Only rebuild when theme mode actually changes
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          final settings = state.maybeWhen(
            loaded: (settings) => settings,
            orElse: () => ThemeSettings(themeMode: AppThemeMode.system),
          );

          final themeMode = switch (settings.themeMode) {
            AppThemeMode.light => ThemeMode.light,
            AppThemeMode.dark => ThemeMode.dark,
            AppThemeMode.system => ThemeMode.system,
          };

          return DynamicColorBuilder(
            builder: (lightDynamic, darkDynamic) {
              final lightTheme = AppThemes.getTheme(
                brightness: Brightness.light,
                colorSource: settings.colorSource,
                dynamicColorScheme: lightDynamic?.harmonized(),
                customSeedColor: settings.seedColorValue != null
                    ? Color(settings.seedColorValue!)
                    : null,
              );
              final darkTheme = AppThemes.getTheme(
                brightness: Brightness.dark,
                colorSource: settings.colorSource,
                dynamicColorScheme: darkDynamic?.harmonized(),
                customSeedColor: settings.seedColorValue != null
                    ? Color(settings.seedColorValue!)
                    : null,
              );

              return MaterialApp.router(
                onGenerateTitle: (_) => t.appTitle,
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: themeMode,
                debugShowCheckedModeBanner: false,
                routerConfig: router.config(
                  navigatorObservers: () => [
                    TalkerRouteObserver(DebuggerHelper.talker),
                  ],
                ),
                localizationsDelegates: GlobalMaterialLocalizations.delegates,
                supportedLocales: AppLocaleUtils.supportedLocales,
                locale: TranslationProvider.of(context).flutterLocale,
                // Use the builder to inject global overlays like SmartDialog and UpgradeAlert
                builder: (context, child) {
                  child = FlutterSmartDialog.init()(context, child);
                  return UpgradeAlert(child: child);
                },
              );
            },
          );
        },
      ),
    );
  }
}
