import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:jiffy/jiffy.dart';
import 'common/constants/routes.dart';

import 'bloc/theme/theme_cubit.dart';
import 'widgets/popup/app_message.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('vi', 'VN')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: BlocProvider<ThemeCubit>(
        create: (context) => ThemeCubit()..loadTheme(context),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) => state.when(
            initial: (theme) {
              Jiffy.setLocale('${context.locale.languageCode}_${context.locale.countryCode}');
              InternetConnection().onStatusChange.listen((
                  InternetStatus status,
                  ) {
                switch (status) {
                  case InternetStatus.connected:
                    AppMessage.showSuccessMessage(context.tr('internetConnected'));
                  case InternetStatus.disconnected:
                    AppMessage.showWarningMessage(context.tr('noInternet'));
                }
              });
              return MaterialApp.router(
                onGenerateTitle: (context) => context.tr('appTitle'),
                theme: theme,
                darkTheme: theme,
                color: Theme.of(context).colorScheme.primary,
                debugShowCheckedModeBanner: false,
                routerConfig: router,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                builder: (context, child) =>
                    FToastBuilder()(context, child ?? const Text('child')),
              );
            },
          ),
        ),
      ),
    );
  }
}
