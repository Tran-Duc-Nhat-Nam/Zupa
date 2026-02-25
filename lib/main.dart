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
          final themeMode = state.maybeWhen(
            loaded: (mode) => switch (mode) {
              .light => ThemeMode.light,
              .dark => ThemeMode.dark,
              _ => ThemeMode.system,
            },
            orElse: () => ThemeMode.system,
          );

          return MaterialApp.router(
            onGenerateTitle: (_) => t.appTitle,
            theme: AppThemes.lightTheme(const .new()),
            darkTheme: AppThemes.darkTheme(const .new()),
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
      ),
    );
  }
}
