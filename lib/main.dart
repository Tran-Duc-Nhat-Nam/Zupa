import 'dart:io';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_gemma/flutter_gemma.dart';
import 'package:flutter_gemma_litertlm/flutter_gemma_litertlm.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:shake/shake.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:zupa/features/animation/presentation/bloc/animation_cubit.dart';
import 'package:zupa/features/connectivity/presentation/bloc/connectivity_cubit.dart';
import 'package:zupa/features/debugger/presentation/bloc/debugger_cubit.dart';
import 'package:zupa/features/localization/presentation/bloc/localization_cubit.dart';
import 'package:zupa/features/scanner/presentation/bloc/scanner_cubit.dart';
import 'package:zupa/features/security/presentation/bloc/security_cubit.dart';
import 'package:zupa/features/theme/presentation/bloc/theme_cubit.dart';
import 'package:zupa/features/ui/presentation/bloc/ui_cubit.dart';
import 'package:zupa/features/version/presentation/bloc/version_cubit.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/env/env.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';
import 'package:zupa/core/helper/router/router_helper.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/helper/services/notification_service.dart';
import 'package:zupa/core/styles/theme.dart';
import 'package:zupa/core/widgets/error/app_error_screen.dart';
import 'package:zupa/core/widgets/popup/app_dialog.dart';
import 'package:zupa/core/widgets/popup/app_message.dart';
import 'package:zupa/core/widgets/popup/app_toast.dart';
import 'package:zupa/features/auth/presentation/bloc/auth/auth_cubit.dart';

Future<void> main() async {
  try {
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    await configureDependencies();

    final router = getIt<AppRouter>();

    // Initialize Chatbot
    FlutterGemma.initialize(
      huggingFaceToken: Env.huggingFaceToken,
      inferenceEngines: const [LiteRtLmEngine()],
    );

    await NotificationService.initialize(router);
    FlutterDisplayMode.setHighRefreshRate();

    // Global Error Boundary
    ErrorWidget.builder = (details) => AppErrorScreen(details: details);

    runApp(TranslationProvider(child: const MyApp()));
  } catch (e, stack) {
    DebuggerHelper.talker.handle(e, stack, 'Fatal App Initialization Error');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
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
      builder: (context, _) => MultiBlocListener(
        listeners: [
          _connectivityListener(),
          _authListener(router),
          _versionListener(),
          _securityListener(),
          _scannerListener(router),
          ?_debuggerListener(router),
        ],
        child: _buildUI(router),
      ),
    );
  }

  Widget _buildUI(AppRouter router) => BlocBuilder<ThemeCubit, ThemeState>(
    builder: (context, themeState) => BlocBuilder<UICubit, UIState>(
      builder: (context, uiState) =>
          BlocBuilder<AnimationCubit, AnimationState>(
            builder: (context, animationState) {
              if (themeState is ThemeLoaded &&
                  uiState is UILoaded &&
                  animationState is AnimationLoaded) {
                FlutterNativeSplash.remove();
                return DynamicColorBuilder(
                  builder: (lightDynamic, darkDynamic) => MaterialApp.router(
                    onGenerateTitle: (_) => t.home.appTitle,
                    theme: AppThemes.getTheme(
                      brightness: .light,
                      colorSource: themeState.settings.colorSource,
                      dynamicColorScheme: lightDynamic,
                      customSeedColor:
                          themeState.settings.seedColorValue != null
                          ? .new(themeState.settings.seedColorValue!)
                          : null,
                    ),
                    darkTheme: AppThemes.getTheme(
                      brightness: .dark,
                      colorSource: themeState.settings.colorSource,
                      dynamicColorScheme: darkDynamic,
                      customSeedColor:
                          themeState.settings.seedColorValue != null
                          ? .new(themeState.settings.seedColorValue!)
                          : null,
                    ),
                    themeMode: themeState.settings.themeMode,
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
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
    ),
  );

  BlocListener<DebuggerCubit, DebuggerState>? _debuggerListener(
    AppRouter router,
  ) => kDebugMode
      ? BlocListener<DebuggerCubit, DebuggerState>(
          listener: (context, state) {
            state.whenOrNull(
              loaded: (isDebuggerMode) {
                if (isDebuggerMode) {
                  detector = .autoStart(
                    onPhoneShake: (ShakeEvent event) async => router
                        .push(const DebugRoute())
                        .onError(
                          (error, stackTrace) => AppToast.showToast(
                            t.common.errors.unknown,
                            context: context.mounted ? context : null,
                          ),
                        ),
                  );
                }
              },
            );
          },
        )
      : null;

  BlocListener<ScannerCubit, ScannerState> _scannerListener(AppRouter router) =>
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
      );

  BlocListener<SecurityCubit, SecurityState> _securityListener() =>
      BlocListener<SecurityCubit, SecurityState>(
        listener: (context, state) {
          switch (state) {
            case Vulnerable(:final reason):
              DialogHelper.showSecurityDialog(
                context,
                reason: t['common.security.${reason.name}'],
                reasonDetail: t['common.security.${reason.name}Subtitle'],
                onQuit: () {
                  if (kDebugMode) {
                    DialogHelper.dismissAll();
                  } else {
                    SystemNavigator.pop();
                  }
                },
              );
            default:
              break;
          }
        },
      );

  BlocListener<VersionCubit, VersionState> _versionListener() =>
      BlocListener<VersionCubit, VersionState>(
        listener: (context, state) {
          state.whenOrNull(
            checking: (isShow) => isShow
                ? DialogHelper.showLoading(message: t.common.version.checking)
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
              DialogHelper.showDownloadProgress(
                context,
                progressStream: progress.map((p) => p / 100.0),
                subtitle: info.latestVersion != null
                    ? t.common.version.downloadingVersion(
                        version: info.latestVersion!,
                      )
                    : null,
              );
            },
            downloadFailed: (message, info) {
              if (!info.isForcedUpdate) {
                DialogHelper.dismissAll();
              }
              MessageHelper.showError(context, message: message);
            },
          );
        },
      );

  BlocListener<AuthCubit, AuthState> _authListener(AppRouter router) =>
      BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          switch (state) {
            case NoAuthenticated():
              router.replaceAll([const LoginRoute()]);
            default:
              break;
          }
        },
      );

  BlocListener<ConnectivityCubit, ConnectivityState> _connectivityListener() =>
      BlocListener<ConnectivityCubit, ConnectivityState>(
        listener: (_, state) {
          switch (state) {
            case Connected():
              AppToast.showToast(t.common.errors.internetConnected);
            case Disconnected():
              AppToast.showToast(t.common.errors.noInternet);
            default:
              break;
          }
        },
      );

  @override
  void dispose() {
    detector?.stopListening();
    super.dispose();
  }
}
