import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zupa/core/bloc/version/version_cubit.dart';
import 'package:zupa/core/env/env.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_card.dart';
import 'package:zupa/core/widgets/app_list_tile.dart';
import 'package:zupa/core/widgets/app_screen.dart';
import 'package:zupa/core/widgets/popup/app_toast.dart';
import 'package:zupa/core/widgets/popup/app_dialog.dart';
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

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      if (mounted) {
        AppToast.showNotify(t.settings.couldNotLaunch(url: url), type: .error);
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
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                      borderRadius: .circular(28),
                    ),
                    clipBehavior: .antiAlias,
                    child: Image.asset(
                      'assets/images/tsp-logo.png',
                      fit: .contain,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Zupa',
                    style: AppTextStyles.heading4.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                  if (_packageInfo != null) ...[
                    Text(
                      t.settings.appVersion(version: _packageInfo!.version),
                      style: AppTextStyles.bodyMediumRegular.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Links and Actions
            AppCard(
              clipBehavior: .antiAlias,
              padding: .zero,
              child: Column(
                spacing: 4,
                children: [
                  AppListTile(
                    leadingIcon: Symbols.link_rounded,
                    leadingColor: colorScheme.primary,
                    text: t.settings.github,
                    trailingIcon: Symbols.open_in_new_rounded,
                    padding: const .all(16),
                    onTap: () => _launchUrl(Env.github),
                  ),
                  BlocConsumer<VersionCubit, VersionState>(
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
                    builder: (context, state) {
                      final isChecking = state is Checking;
                      return AppListTile(
                        leadingIcon: Symbols.update_rounded,
                        leadingColor: colorScheme.primary,
                        text: t.settings.checkForUpdate,
                        trailing: isChecking
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : null,
                        trailingIcon: isChecking
                            ? null
                            : Symbols.chevron_right_rounded,
                        padding: const EdgeInsets.all(16),
                        onTap: isChecking
                            ? null
                            : () {
                                context.read<VersionCubit>().checkForUpdates(
                                      force: true,
                                    );
                              },
                      );
                    },
                  ),
                  BlocBuilder<VersionCubit, VersionState>(
                    builder: (context, state) {
                      final info = state.maybeMap(
                        upToDate: (s) => s.info,
                        updateAvailable: (s) => s.info,
                        downloading: (s) => s.info,
                        downloadFailed: (s) => s.info,
                        orElse: () => null,
                      );

                      return AppListTile(
                        leadingIcon: Symbols.history_rounded,
                        leadingColor: colorScheme.primary,
                        text: t.settings.showChangelog,
                        trailingIcon: Symbols.chevron_right_rounded,
                        padding: const EdgeInsets.all(16),
                        onTap: () {
                          if (info != null && _packageInfo != null) {
                            DialogHelper.showChangelogDialog(
                              context,
                              version:
                                  info.latestVersion ?? _packageInfo!.version,
                              changelog:
                                  info.message ?? t.common.version.noChangelog,
                            );
                          } else {
                            context.read<VersionCubit>().checkForUpdates(
                              force: true,
                            );
                            AppToast.showNotify(t.common.info.noInfo);
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
