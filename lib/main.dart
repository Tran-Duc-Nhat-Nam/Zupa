import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:upgrader/upgrader.dart';

import 'bloc/auth/auth_cubit.dart';
import 'bloc/debugger/debugger_cubit.dart';
import 'bloc/theme/theme_cubit.dart';
import 'helper/debugger/debugger_helper.dart';
import 'helper/router/router_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  RouterHelper.initRouter();
  DebuggerHelper.initDebugger();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const <Locale>[Locale('en', 'US'), Locale('vi', 'VN')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(
            create: (BuildContext context) => ThemeCubit()..loadTheme(context),
          ),
          BlocProvider<DebuggerCubit>(
            create: (BuildContext context) => DebuggerCubit()..loadDebugger(),
          ),
          BlocProvider<AuthCubit>(
            create: (BuildContext context) => AuthCubit()..loadAuth(),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (BuildContext context, ThemeState state) => state.when(
            initial: (ThemeData theme) {
              return MaterialApp.router(
                onGenerateTitle: (BuildContext context) =>
                    context.tr('appTitle'),
                theme: theme,
                darkTheme: theme,
                color: Theme.of(context).colorScheme.primary,
                debugShowCheckedModeBanner: false,
                routerConfig: RouterHelper.router,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                builder: (BuildContext materialContext, Widget? child) {
                  return FToastBuilder()(
                    materialContext,
                    UpgradeAlert(child: child),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
