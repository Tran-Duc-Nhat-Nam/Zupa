import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zupa/core/bloc/animation/animation_cubit.dart';
import 'package:zupa/core/bloc/version/version_cubit.dart';
import 'package:zupa/core/env/env.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_list_tile.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/popup/app_dialog.dart';
import 'package:zupa/core/widgets/popup/app_message.dart';
import 'package:zupa/core/widgets/popup/app_toast.dart';
import 'package:zupa/core/widgets/state/app_state.dart';

@RoutePage()
class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({super.key});

  @override
  AppState<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends AppState<AboutAppScreen> {
  PackageInfo? _packageInfo;

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  Future<void> _launchUrl(String url, BuildContext context) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      if (context.mounted) {
        MessageHelper.showError(context, message: t.settings.couldNotLaunch(url: url));
      } else {
        AppToast.showToast(t.settings.couldNotLaunch(url: url));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);

    return AppScreen(
      title: t.settings.aboutApp,
      child: Padding(
        padding: const .symmetric(vertical: 16, horizontal: 24),
        child: Column(
          spacing: 16,
          children: [
            // App Logo and Info
            Center(
              child: Column(
                spacing: 8,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    padding: const .all(16),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                      borderRadius: .circular(28),
                    ),
                    clipBehavior: .antiAlias,
                    child: Image.asset(
                      'assets/images/park.png',
                      fit: .contain,
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Zupa',
                    style: AppTextStyles.headlineSmallBold.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                  if (_packageInfo != null) ...[
                    Text(
                      t.settings.appVersion(version: _packageInfo!.version),
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Links and Actions
            BlocListener<VersionCubit, VersionState>(
              listener: (context, state) {
                state.maybeWhen(
                  upToDate: (info) => DialogHelper.showModal(
                    context,
                    titleText: t.common.version.upToDate,
                    subtitleText: t.common.version.noUpdateAvailable,
                    type: AppDialogType.success,
                    okText: t.common.actions.close,
                  ),
                  orElse: () {},
                );
              },
              child: BlocBuilder<VersionCubit, VersionState>(
                builder: (context, versionState) {
                  return BlocBuilder<AnimationCubit, AnimationState>(
                    builder: (context, animState) {
                      final isChecking = versionState is Checking;
                      final isAnimationOn = animState.maybeWhen(
                        loaded: (isOn) => isOn,
                        orElse: () => true,
                      );

                      final info = versionState.maybeMap(
                        upToDate: (s) => s.info,
                        updateAvailable: (s) => s.info,
                        downloading: (s) => s.info,
                        downloadFailed: (s) => s.info,
                        orElse: () => null,
                      );

                      return AppList(
                        items: [
                          AppListItem(
                            leadingIcon: Symbols.link_rounded,
                            leadingColor: colorScheme.primary,
                            text: t.settings.github,
                            trailingIcon: Symbols.open_in_new_rounded,
                            onTap: () => _launchUrl(Env.github, context),
                          ),
                          AppListItem(
                            leadingIcon: Symbols.update_rounded,
                            leadingColor: colorScheme.primary,
                            text: t.settings.checkForUpdate,
                            trailing: isChecking
                                ? SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      value: isAnimationOn ? null : 0.7,
                                    ),
                                  )
                                : null,
                            trailingIcon: isChecking
                                ? null
                                : Symbols.chevron_right_rounded,
                            onTap: isChecking
                                ? null
                                : () {
                                    context
                                        .read<VersionCubit>()
                                        .checkForUpdates(
                                          force: true,
                                        );
                                  },
                          ),
                          AppListItem(
                            leadingIcon: Symbols.history_rounded,
                            leadingColor: colorScheme.primary,
                            text: t.settings.showChangelog,
                            trailingIcon: Symbols.chevron_right_rounded,
                            onTap: () {
                              if (info != null && _packageInfo != null) {
                                context.pushRoute(
                                  ChangelogRoute(
                                    changelog:
                                        info.message ??
                                        t.common.version.noChangelog,
                                  ),
                                );
                              } else {
                                context.read<VersionCubit>().checkForUpdates(
                                  force: true,
                                );
                                AppToast.showToast(t.common.info.noInfo, context: context);
                              }
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
