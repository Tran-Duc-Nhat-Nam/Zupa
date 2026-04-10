import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';

import 'package:zupa/core/bloc/animation/animation_cubit.dart';
import 'package:zupa/core/di/injection.dart';

abstract class DialogHelper {
  /// Show a loading dialog with an optional [message].
  static void showLoading({String? message}) {
    SmartDialog.showLoading(
      msg: message ?? '',
      builder: (context) => LoadingDialog(message: message),
      animationTime: getIt<AnimationCubit>().state.maybeWhen(
        loaded: (isOn) => isOn ? null : .zero,
        orElse: () => null,
      ),
    );
  }

  /// Dismiss the active loading dialog.
  static void dismissLoading() {
    SmartDialog.dismiss(status: .loading);
  }

  /// Show a predefined authentication ended dialog.
  static void showAuthDialog(BuildContext context) {
    showModal(
      context,
      tag: 'auth_session_ended',
      subtitleText: t.auth.session.ended.subtitle,
      titleText: t.auth.session.ended.title,
      type: .warning,
      onOk: () {
        context.router.replaceAll([const LoginRoute()]);
      },
    );
  }

  /// Show a predefined update available dialog.
  static void showUpdateDialog(
    BuildContext context, {
    required String version,
    required bool isMandatory,
    required VoidCallback onUpdate,
  }) {
    showModal(
      context,
      tag: 'app_update',
      titleText: t.common.version.updateAvailable,
      subtitleText: t.common.version.updateDescription(version: version),
      okText: t.common.version.updateNow,
      cancelText: isMandatory ? null : t.common.version.later,
      dismissible: !isMandatory,
      onOk: onUpdate,
    );
  }

  /// Show a predefined maintenance dialog.
  static void showMaintenanceDialog(BuildContext context) {
    showModal(
      context,
      tag: 'app_maintenance',
      titleText: t.common.version.maintenance,
      subtitleText: t.common.version.maintenanceDescription,
      okText: t.common.version.retry,
      type: .warning,
      onOk: () {
        SmartDialog.dismiss();
      },
    );
  }

  /// Show a predefined security/root detection dialog.
  static void showSecurityDialog(
    BuildContext context, {
    required VoidCallback onQuit,
  }) {
    final bool isIOS = Theme.of(context).platform == .iOS;
    showModal(
      context,
      tag: 'app_security',
      titleText: t.common.security.rootDetected,
      subtitleText: t.common.security.rootSubtitle,
      okText: isIOS ? '' : t.common.security.quit,
      showOk: !isIOS,
      dismissible: false,
      type: .error,
      onOk: onQuit,
    );
  }

  /// Show a download progress dialog with a [progressStream].
  static void showDownloadProgress(
    BuildContext context, {
    required Stream<double> progressStream,
    String? title,
    String? subtitle,
    IconData? icon,
    String tag = 'download_progress',
    VoidCallback? onDismiss,
  }) {
    SmartDialog.show(
      tag: tag,
      builder: (context) => DownloadProgressDialog(
        progressStream: progressStream,
        title: title,
        subtitle: subtitle,
        icon: icon,
      ),
      backType: .block,
      clickMaskDismiss: false,
      onDismiss: onDismiss,
      animationTime: getIt<AnimationCubit>().state.maybeWhen(
        loaded: (isOn) => isOn ? null : .zero,
        orElse: () => null,
      ),
    );
  }

  /// Compatibility layer for existing int-based download dialogs
  @Deprecated('Use showDownloadProgress instead')
  static void showDownloadDialog(
    BuildContext context, {
    required Stream<int> progressStream,
    String? version,
  }) {
    showDownloadProgress(
      context,
      progressStream: progressStream.map((p) => p / 100.0),
      subtitle: version != null ? t.common.version.downloadingVersion(version: version) : null,
    );
  }

  /// Show a generic MD3 modal dialog using [AppDialog].
  static void showModal(
    BuildContext context, {
    String? titleText,
    String? subtitleText,
    String? okText,
    String? cancelText,
    String? tag,
    bool bindPage = false,
    AppDialogType type = .info,
    bool dismissible = true,
    bool showOk = true,
    VoidCallback? onOk,
    VoidCallback? onCancel,
  }) {
    SmartDialog.show(
      tag: tag,
      bindPage: bindPage,
      builder: (context) => AppDialog(
        description: subtitleText ?? '',
        title: titleText ?? '',
        onConfirm: onOk,
        onCancel: onCancel,
        confirmText: okText ?? t.common.actions.ok,
        cancelText: cancelText,
        showConfirm: showOk,
        type: type,
      ),
      backType: dismissible ? .normal : .block,
      clickMaskDismiss: dismissible,
      keepSingle: true,
      animationTime: getIt<AnimationCubit>().state.maybeWhen(
        loaded: (isOn) => isOn ? null : .zero,
        orElse: () => null,
      ),
    );
  }

  /// Show a custom widget as a modal dialog.
  static void showCustomModal({
    required Widget child,
    bool dismissible = true,
    VoidCallback? onDismiss,
  }) {
    SmartDialog.show(
      builder: (context) => child,
      backType: dismissible ? .normal : .block,
      clickMaskDismiss: dismissible,
      onDismiss: onDismiss,
      animationTime: getIt<AnimationCubit>().state.maybeWhen(
        loaded: (isOn) => isOn ? null : .zero,
        orElse: () => null,
      ),
    );
  }

  /// Dismiss all active dialogs.
  static void dismissAll() {
    SmartDialog.dismiss(status: SmartStatus.allDialog);
  }
}

enum AppDialogType { success, error, warning, info }

class AppDialog extends StatelessWidget {
  final AppDialogType type;
  final String title;
  final String description;
  final String confirmText;
  final String? cancelText;
  final bool showConfirm;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final Widget? content;

  const AppDialog({
    super.key,
    required this.type,
    required this.title,
    required this.description,
    this.confirmText = 'OK',
    this.cancelText,
    this.showConfirm = true,
    this.onConfirm,
    this.onCancel,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);
    final styles = _getStyles(type, colorScheme);

    return Align(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 320, minWidth: 280),
        margin: const .symmetric(horizontal: 24, vertical: 24),
        padding: const .all(24),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHigh,
          borderRadius: .circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(25),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: .min,
            children: [
              // Icon
              Icon(styles.icon, size: 32, color: styles.color),
              const SizedBox(height: 16),

              // Title
              Text(
                title,
                style: AppTextStyles.titleLargeBold.copyWith(
                  color: colorScheme.onSurface,
                ),
                textAlign: .center,
              ),

              const SizedBox(height: 16),

              // Description / Content
              if (content != null)
                content!
              else
                Text(
                  description,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  textAlign: .center,
                ),

              const SizedBox(height: 24),

              // Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (cancelText != null)
                    TextButton(
                      onPressed: () {
                        onCancel?.call();
                        SmartDialog.dismiss();
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: colorScheme.onSurfaceVariant,
                        textStyle: AppTextStyles.bodyMediumSemibold,
                      ),
                      child: Text(cancelText!),
                    ),
                  if (cancelText != null) const SizedBox(width: 8),
                  if (showConfirm)
                    TextButton(
                      onPressed: () {
                        onConfirm?.call();
                        SmartDialog.dismiss();
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: styles.color,
                        textStyle: AppTextStyles.bodyMediumSemibold,
                      ),
                      child: Text(confirmText),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Style Logic ---

  _DialogStyle _getStyles(AppDialogType type, AppColors scheme) {
    return switch (type) {
      .success => _DialogStyle(
        icon: Symbols.check_circle_rounded,
        color: scheme.success,
      ),
      .error => _DialogStyle(icon: Symbols.error_rounded, color: scheme.error),
      .warning => _DialogStyle(
        icon: Symbols.warning_amber_rounded,
        color: scheme.warning,
      ),
      .info => _DialogStyle(icon: Symbols.info_rounded, color: scheme.primary),
    };
  }
}

class _DialogStyle {
  final IconData icon;
  final Color color;

  _DialogStyle({required this.icon, required this.color});
}

class DownloadProgressDialog extends StatelessWidget {
  final Stream<double> progressStream;
  final String? title;
  final String? subtitle;
  final IconData? icon;

  const DownloadProgressDialog({
    super.key,
    required this.progressStream,
    this.title,
    this.subtitle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);

    return Align(
      child: Container(
        constraints: const BoxConstraints(minWidth: 280, minHeight: 180),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Material(
          color: Colors.transparent,
          child: StreamBuilder<double>(
            stream: progressStream,
            builder: (context, snapshot) {
              final double progress = (snapshot.data ?? 0.0);
              final int displayPercent = (progress * 100).toInt();

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon ?? Symbols.cloud_download_rounded,
                    size: 32,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    title ?? t.common.version.downloading,
                    style: AppTextStyles.titleMediumBold.copyWith(
                      color: colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),

                  // Progress Bar
                  LinearPercentIndicator(
                    percent: progress.clamp(0.0, 1.0),
                    lineHeight: 8,
                    padding: EdgeInsets.zero,
                    barRadius: const Radius.circular(8),
                    backgroundColor: colorScheme.surfaceContainerHighest,
                    linearGradient: LinearGradient(
                      colors: [colorScheme.primary, colorScheme.secondary],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Percentage Text
                  Text(
                    '$displayPercent%',
                    style: AppTextStyles.bodyLargeSemibold.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),

                  if (subtitle != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      subtitle!,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class LoadingDialog extends StatelessWidget {
  final String? message;

  const LoadingDialog({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);

    return Align(
      child: Container(
        constraints: const BoxConstraints(minWidth: 120, minHeight: 120),
        padding: const .all(24),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHigh,
          borderRadius: .circular(28),
        ),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: .min,
            children: [
              LoadingAnimationWidget.discreteCircle(
                color: colorScheme.primary,
                secondRingColor: colorScheme.secondary,
                thirdRingColor: colorScheme.tertiary,
                size: 36,
              ),
              if (message != null && message!.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(
                  message!,
                  style: AppTextStyles.bodyMediumMedium.copyWith(
                    color: colorScheme.onSurface,
                  ),
                  textAlign: .center,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
