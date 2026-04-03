import 'dart:io';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shake/shake.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:zupa/core/bloc/animation/animation_cubit.dart';
import 'package:zupa/core/bloc/connectivity/connectivity_cubit.dart';
import 'package:zupa/core/bloc/debugger/debugger_cubit.dart';
import 'package:zupa/core/bloc/localization/localization_cubit.dart';
import 'package:zupa/core/bloc/scanner/scanner_cubit.dart';
import 'package:zupa/core/bloc/security/security_cubit.dart';
import 'package:zupa/core/bloc/security/security_state.dart';
import 'package:zupa/core/bloc/theme/theme_cubit.dart';
import 'package:zupa/core/bloc/ui/ui_cubit.dart';
import 'package:zupa/core/bloc/version/version_cubit.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';
import 'package:zupa/core/helper/router/router_helper.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/theme.dart';
import 'package:zupa/core/widgets/error/app_error_screen.dart';
import 'package:zupa/core/widgets/popup/app_dialog.dart';
import 'package:zupa/core/widgets/popup/app_message.dart';
import 'package:zupa/core/widgets/popup/app_toast.dart';
import 'package:zupa/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:zupa/firebase_options.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  DebuggerHelper.talker.info(
    'Handling a background message: ${message.messageId}',
  );
}

Future<void> main() async {
  try {
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

    await FlutterDisplayMode.setHighRefreshRate();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final messaging = FirebaseMessaging.instance;

    final settings = await messaging.requestPermission();

    DebuggerHelper.talker.info(
      'User granted permission: ${settings.authorizationStatus}',
    );

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // For apple platforms, make sure the APNS token is available before making any FCM plugin API calls
    final apnsToken = await messaging.getAPNSToken();
    if (apnsToken != null || !Platform.isIOS) {
      final fcmToken = await messaging.getToken();
      // TODO: If necessary send token to application server.
      DebuggerHelper.talker.info('FCM Token: $fcmToken');
    }

    messaging.onTokenRefresh
        .listen((fcmToken) {
          // TODO: If necessary send token to application server.
          DebuggerHelper.talker.info('FCM Token: $fcmToken');
        })
        .onError((err) {
          DebuggerHelper.talker.error(err);
        });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      DebuggerHelper.talker.info('Got a message whilst in the foreground!');
      DebuggerHelper.talker.info('Message data: ${message.data}');

      if (message.notification != null) {
        DebuggerHelper.talker.info(
          'Message also contained a notification: ${message.notification}',
        );
      }
    });

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
      .manual,
      overlays: [.bottom, .top],
    );
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    await configureDependencies();
    final router = getIt<AppRouter>();

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleNotificationNavigation(message, router);
    });

    // Check if the app was opened from a terminated state via a notification
    final RemoteMessage? initialMessage = await messaging.getInitialMessage();
    if (initialMessage != null) {
      // Wait for the app to be mounted before navigating
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // A small extra delay helps ensure AutoRoute is fully initialized
        Future.delayed(const Duration(milliseconds: 500), () {
          _handleNotificationNavigation(initialMessage, router);
        });
      });
    }

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
        BlocProvider(create: (_) => getIt<UICubit>()..loadInfo()),
        BlocProvider(create: (_) => getIt<AnimationCubit>()..loadInfo()),
        BlocProvider(create: (_) => getIt<ThemeCubit>()..loadTheme()),
        BlocProvider(create: (_) => getIt<AuthCubit>()..loadAuth()),
        BlocProvider(create: (_) => getIt<LocalizationCubit>()..loadLocale()),
        BlocProvider(
          create: (_) => getIt<ConnectivityCubit>()..monitorConnectivity(),
        ),
        if (kDebugMode)
          BlocProvider(create: (_) => getIt<DebuggerCubit>()..loadDebugger()),
        BlocProvider(create: (_) => getIt<VersionCubit>()..checkForUpdates()),
        BlocProvider(create: (_) => getIt<SecurityCubit>()..checkSecurity()),
        BlocProvider(create: (_) => getIt<ScannerCubit>()..init()),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  ShakeDetector? detector;

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();

    return BlocBuilder<AnimationCubit, AnimationState>(
      builder: (context, _) {
        return MultiBlocListener(
          listeners: [
            BlocListener<ThemeCubit, ThemeState>(
              listener: (context, state) {
                state.whenOrNull(
                  loaded: (settings) {
                    state.whenOrNull(
                      loaded: (_) => FlutterNativeSplash.remove(),
                    );
                  },
                );
              },
            ),
            BlocListener<ConnectivityCubit, ConnectivityState>(
              listener: (context, state) {
                state.whenOrNull(
                  connected: () => AppToast.showToast(
                    t.common.errors.internetConnected,
                    context: context,
                  ),
                  disconnected: () => AppToast.showToast(
                    t.common.errors.noInternet,
                    context: context,
                  ),
                );
              },
            ),
            BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                state.whenOrNull(
                  noAuthenticated: () =>
                      router.replaceAll([const LoginRoute()]),
                );
              },
            ),
            BlocListener<VersionCubit, VersionState>(
              listener: (context, state) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  state.whenOrNull(
                    checking: (isShow) => isShow
                        ? DialogHelper.showLoading(
                            message: t.common.version.checking,
                          )
                        : null,
                    upToDate: (_) => DialogHelper.dismissLoading(),
                    standby: () => DialogHelper.dismissLoading(),
                    updateAvailable: (info) {
                      DialogHelper.dismissLoading();
                      DialogHelper.showUpdateDialog(
                        context,
                        isMandatory: info.isForcedUpdate,
                        version: info.latestVersion ?? '',
                        onUpdate: () => Platform.isAndroid
                            ? context.read<VersionCubit>().executeUpdate(info)
                            : info.update,
                      );
                    },
                    maintaining: () {
                      DialogHelper.dismissLoading();
                      DialogHelper.showMaintenanceDialog(context);
                    },
                    downloading: (progress, info) {
                      DialogHelper.dismissLoading();
                      DialogHelper.showDownloadDialog(
                        context,
                        progressStream: progress,
                        version: info.latestVersion,
                      );
                    },
                    installing: () => DialogHelper.dismissAll(),
                    downloadFailed: (message, info) {
                      if (!info.isForcedUpdate) {
                        DialogHelper.dismissAll();
                      }
                      MessageHelper.showError(context, message: message);
                    },
                  );
                });
              },
            ),
            BlocListener<SecurityCubit, SecurityState>(
              listener: (context, state) {
                state.whenOrNull(
                  vulnerable: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      DialogHelper.showSecurityDialog(
                        context,
                        onQuit: () {
                          if (kDebugMode) {
                            DialogHelper.dismissAll();
                          } else {
                            SystemNavigator.pop();
                          }
                        },
                      );
                    });
                  },
                );
              },
            ),
            BlocListener<ScannerCubit, ScannerState>(
              listener: (context, state) {
                state.whenOrNull(
                  scanSuccess: (parkingData) =>
                      router.topRoute.name != CheckInRoute.name
                      ? router.push(CheckInRoute())
                      : AppToast.showToast(
                          t.common.errors.alreadyInCameraScreen,
                          context: context,
                        ),
                );
              },
            ),
            BlocListener<DebuggerCubit, DebuggerState>(
              listener: (context, state) {
                state.whenOrNull(
                  loaded: (isDebuggerMode) {
                    if (isDebuggerMode) {
                      detector = .autoStart(
                        onPhoneShake: (ShakeEvent event) async {
                          AppToast.showToast(
                            t.common.errors.unknown,
                            context: context.mounted ? context : null,
                          );
                          router
                              .push(const DebugRoute())
                              .onError(
                                (error, stackTrace) => AppToast.showToast(
                                  t.common.errors.unknown,
                                  context: context.mounted ? context : null,
                                ),
                              );
                        },
                      );
                    }
                  },
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
                        brightness: .light,
                        colorSource: settings.colorSource,
                        dynamicColorScheme: lightDynamic,
                        customSeedColor: settings.seedColorValue != null
                            ? Color(settings.seedColorValue!)
                            : null,
                      ),
                      darkTheme: AppThemes.getTheme(
                        brightness: .dark,
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
                          FlutterSmartDialog.observer,
                        ],
                      ),
                      localizationsDelegates:
                          GlobalMaterialLocalizations.delegates,
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
      },
    );
  }

  @override
  void dispose() {
    detector?.stopListening();
    super.dispose();
  }
}

void _handleNotificationNavigation(RemoteMessage message, AppRouter router) {
  final String? routePath = message.data['route'];

  if (routePath != null) {
    router.pushPath(routePath).onError((error, stackTrace) {
      if (error != null) {
        router.push(
          AppErrorRoute(
            details: .new(exception: error, stack: stackTrace),
          ),
        );
      }
      return;
    });
  }
}
