import 'dart:io';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_gemma/flutter_gemma.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shake/shake.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:zupa/core/bloc/animation/animation_cubit.dart'
    as animation_cubit;
import 'package:zupa/core/bloc/connectivity/connectivity_cubit.dart';
import 'package:zupa/core/bloc/debugger/debugger_cubit.dart';
import 'package:zupa/core/bloc/localization/localization_cubit.dart';
import 'package:zupa/core/bloc/scanner/scanner_cubit.dart';
import 'package:zupa/core/bloc/security/security_cubit.dart';
import 'package:zupa/core/bloc/security/security_state.dart';
import 'package:zupa/core/bloc/theme/theme_cubit.dart' as theme_cubit;
import 'package:zupa/core/bloc/ui/ui_cubit.dart' as ui_cubit;
import 'package:zupa/core/bloc/version/version_cubit.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/env/env.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';
import 'package:zupa/core/helper/router/router_helper.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/services/notification_service.dart';
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
    FlutterGemma.initialize(huggingFaceToken: Env.huggingFaceToken);

    await NotificationService.initialize(router);
    await FlutterDisplayMode.setHighRefreshRate();

    // Global Error Boundary
    ErrorWidget.builder = (details) => AppErrorScreen(details: details);

    await GoogleFonts.pendingFonts([
      GoogleFonts.outfit(fontWeight: .w400),
      GoogleFonts.outfit(fontWeight: .w400),
      GoogleFonts.outfit(fontWeight: .w400),
      GoogleFonts.robotoFlex(fontWeight: .w400),
      GoogleFonts.robotoFlex(fontWeight: .w500),
      GoogleFonts.robotoFlex(fontWeight: .w600),
      GoogleFonts.robotoFlex(fontWeight: .w700),
    ]);

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
        BlocProvider(create: (_) => getIt<ui_cubit.UICubit>()..loadInfo()),
        BlocProvider(
          create: (_) => getIt<animation_cubit.AnimationCubit>()..loadInfo(),
        ),
        BlocProvider(
          create: (_) => getIt<theme_cubit.ThemeCubit>()..loadTheme(),
        ),
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

    return BlocBuilder<
      animation_cubit.AnimationCubit,
      animation_cubit.AnimationState
    >(
      builder: (context, _) {
        return MultiBlocListener(
          listeners: [
            _connectivityListener(),
            _authListener(router),
            _versionListener(),
            _securityListener(),
            _scannerListener(router),
            ?_debuggerListener(router),
          ],
          child: _buildUI(router),
        );
      },
    );
  }

  Widget _buildUI(AppRouter router) =>
      BlocBuilder<theme_cubit.ThemeCubit, theme_cubit.ThemeState>(
        builder: (context, themeState) =>
            BlocBuilder<ui_cubit.UICubit, ui_cubit.UIState>(
              builder: (context, uiState) =>
                  BlocBuilder<
                    animation_cubit.AnimationCubit,
                    animation_cubit.AnimationState
                  >(
                    builder: (context, animationState) {
                      if (themeState is theme_cubit.Loaded &&
                          uiState is ui_cubit.Loaded &&
                          animationState is animation_cubit.Loaded) {
                        FlutterNativeSplash.remove();
                        return DynamicColorBuilder(
                          builder: (lightDynamic, darkDynamic) {
                            return MaterialApp.router(
                              onGenerateTitle: (_) => t.home.appTitle,
                              theme: AppThemes.getTheme(
                                brightness: .light,
                                colorSource: themeState.maybeWhen(
                                  loaded: (settings) => settings.colorSource,
                                  orElse: () => .brand,
                                ),
                                dynamicColorScheme: lightDynamic,
                                customSeedColor: themeState.maybeWhen(
                                  loaded: (settings) =>
                                      settings.seedColorValue != null
                                      ? Color(settings.seedColorValue!)
                                      : null,
                                  orElse: () => null,
                                ),
                              ),
                              darkTheme: AppThemes.getTheme(
                                brightness: .dark,
                                colorSource: themeState.maybeWhen(
                                  loaded: (settings) => settings.colorSource,
                                  orElse: () => .brand,
                                ),
                                dynamicColorScheme: darkDynamic,
                                customSeedColor: themeState.maybeWhen(
                                  loaded: (settings) =>
                                      settings.seedColorValue != null
                                      ? Color(settings.seedColorValue!)
                                      : null,
                                  orElse: () => null,
                                ),
                              ),
                              themeMode: themeState.maybeWhen(
                                loaded: (settings) => settings.themeMode,
                                orElse: () => .system,
                              ),
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
                              locale: TranslationProvider.of(
                                context,
                              ).flutterLocale,
                              builder: FlutterSmartDialog.init(),
                            );
                          },
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
            ),
      );

  BlocListener<DebuggerCubit, DebuggerState>? _debuggerListener(
    AppRouter router,
  ) {
    return kDebugMode
        ? BlocListener<DebuggerCubit, DebuggerState>(
            listener: (context, state) {
              state.whenOrNull(
                loaded: (isDebuggerMode) {
                  if (isDebuggerMode) {
                    detector = .autoStart(
                      onPhoneShake: (ShakeEvent event) async {
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
          )
        : null;
  }

  BlocListener<ScannerCubit, ScannerState> _scannerListener(AppRouter router) {
    return BlocListener<ScannerCubit, ScannerState>(
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
  }

  BlocListener<SecurityCubit, SecurityState> _securityListener() {
    return BlocListener<SecurityCubit, SecurityState>(
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
    );
  }

  BlocListener<VersionCubit, VersionState> _versionListener() {
    return BlocListener<VersionCubit, VersionState>(
      listener: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
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
        });
      },
    );
  }

  BlocListener<AuthCubit, AuthState> _authListener(AppRouter router) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          noAuthenticated: () => router.replaceAll([const LoginRoute()]),
        );
      },
    );
  }

  BlocListener<ConnectivityCubit, ConnectivityState> _connectivityListener() =>
      BlocListener<ConnectivityCubit, ConnectivityState>(
        listener: (context, state) => state.whenOrNull(
          connected: () => AppToast.showToast(
            t.common.errors.internetConnected,
            context: context,
          ),
          disconnected: () =>
              AppToast.showToast(t.common.errors.noInternet, context: context),
        ),
      );

  @override
  void dispose() {
    detector?.stopListening();
    super.dispose();
  }
}
