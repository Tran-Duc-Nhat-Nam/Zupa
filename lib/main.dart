import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:upgrader/upgrader.dart';
import 'package:zupa/core/bloc/localization/localization_cubit.dart';
import 'package:zupa/core/services/network_service.dart';
import 'package:zupa/core/services/storage_service.dart';
import 'package:zupa/core/styles/theme.dart';

import 'package:zupa/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:zupa/core/bloc/debugger/debugger_cubit.dart';
import 'package:zupa/core/bloc/theme/theme_cubit.dart';
import 'package:zupa/core/helper/router/router_helper.dart';

import 'package:zupa/core/di/injection.dart';
import 'package:zupa/features/auth/domain/repository/authentication_repository.dart';
import 'package:zupa/gen/strings.g.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await LocaleSettings.setLocaleRaw(
    (await getIt<StorageService>().getLocalization()).name,
  );
  getIt<NetworkService>().onUnauthorized = () => getIt<AuthenticationRepository>().logOut();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return TranslationProvider(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(
            create: (BuildContext context) => getIt<ThemeCubit>()..loadTheme(),
          ),
          BlocProvider<DebuggerCubit>(
            lazy: false,
            create: (BuildContext context) =>
                getIt<DebuggerCubit>()..loadDebugger(),
          ),
          BlocProvider<AuthCubit>(
            create: (BuildContext context) => getIt<AuthCubit>()..loadAuth(),
          ),
          BlocProvider<LocalizationCubit>(
            lazy: false,
            create: (BuildContext context) =>
                getIt<LocalizationCubit>()..loadLocale(),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (BuildContext context, ThemeState state) => state.maybeWhen(
            loaded: (mode) {
              ThemeMode themeMode;
              switch (mode) {
                case .light: // Assuming you have an enum
                  themeMode = ThemeMode.light;
                case .dark:
                  themeMode = ThemeMode.dark;
                default:
                  themeMode = ThemeMode.system;
              }
              return MaterialApp.router(
                onGenerateTitle: (BuildContext context) =>
                    Translations.of(context).appTitle,
                theme: appTheme,
                darkTheme: appDarkTheme,
                themeMode: themeMode,
                debugShowCheckedModeBanner: false,
                routerConfig: RouterHelper.router,
                localizationsDelegates: GlobalMaterialLocalizations.delegates,
                supportedLocales: AppLocaleUtils.supportedLocales,
                locale: TranslationProvider.of(context).flutterLocale,
                builder: (BuildContext materialContext, Widget? child) {
                  return FToastBuilder()(
                    materialContext,
                    UpgradeAlert(child: child),
                  );
                },
              );
            },
            orElse: () => const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
