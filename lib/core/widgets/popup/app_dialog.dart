import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';

abstract class DialogHelper {
  static void showAuthDialog(BuildContext context) {
    showModal(
      context,
      subtitleText: t.auth.session.ended.subtitle,
      titleText: t.auth.session.ended.title,
      type: .warning,
      onOk: () {
        context.router.replaceAll([const LoginRoute()]);
      },
    );
  }

  static void showUpdateDialog(
    BuildContext context, {
    required String version,
    required bool isMandatory,
    required VoidCallback onUpdate,
  }) {
    showModal(
      context,
      titleText: t.common.version.updateAvailable,
      subtitleText: t.common.version.updateDescription(version: version),
      okText: t.common.version.updateNow,
      cancelText: isMandatory
          ? null
          : t.common.version.later, // Hide cancel if forced
      dismissible: !isMandatory,
      onOk: onUpdate,
    );
  }

  static void showMaintenanceDialog(BuildContext context) {
    showModal(
      context,
      titleText: t.common.version.maintenance,
      subtitleText: t.common.version.maintenanceDescription,
      okText: t.common.version.retry,
      type: .warning,
      onOk: () {
        // Typically you'd trigger a page reload or re-check here
        SmartDialog.dismiss();
      },
    );
  }

  static void showSecurityDialog(
    BuildContext context, {
    required VoidCallback onQuit,
  }) {
    final bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    showModal(
      context,
      titleText: t.common.security.rootDetected,
      subtitleText: t.common.security.rootSubtitle,
      okText: isIOS ? '' : t.common.security.quit,
      showOk: !isIOS,
      type: .error,
      dismissible: false,
      onOk: onQuit,
    );
  }


  static void showDownloadDialog(
    BuildContext context, {
    required Stream<int> progressStream,
    String? version,
  }) {
    SmartDialog.show(
      builder: (context) => DownloadProgressDialog(
        progressStream: progressStream,
        version: version,
      ),
      backType: .block, // Prevent closing during download
      clickMaskDismiss: false,
    );
  }

  static void showModal(
    BuildContext context, {
    Widget? child,
    String? titleText,
    String? subtitleText,
    String? okText,
    String? cancelText,
    AppDialogType type = .info,
    bool dismissible = false,
    bool showOk = true,
    void Function()? onOk,
    void Function()? onCancel,
  }) {
    SmartDialog.show(
      builder: (context) => AppDialog(
        description: subtitleText ?? '',
        title: titleText ?? '',
        onConfirm: onOk,
        onCancel: onCancel,
        confirmText: okText ?? 'OK',
        cancelText: cancelText,
        showConfirm: showOk,
        type: type,
      ),
      backType: dismissible ? .normal : .block,
      clickMaskDismiss: dismissible,
    );
  }

  static void closeAllModal() {
    SmartDialog.dismiss();
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
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);
    final styles = _getStyles(type, colorScheme);

    return Container(
      constraints: const BoxConstraints(maxWidth: 320, minWidth: 280),
      margin: const .symmetric(horizontal: 24),
      padding: const .all(24),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHigh,
        borderRadius: .circular(28),
      ),
      child: Column(
        mainAxisSize: .min,
        children: [
          Icon(styles.icon, size: 32, color: styles.color),
          const SizedBox(height: 16),
          Text(
            title,
            style: AppTextStyles.bodyLargeSemibold.copyWith(
              color: colorScheme.onSurface,
            ),
            textAlign: .center,
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: AppTextStyles.bodyMediumRegular.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: .center,
          ),

          const SizedBox(height: 24),
          if (cancelText != null)
            _buildDoubleButtons(context, styles.color)
          else if (showConfirm)
            _buildSingleButton(context, styles.color),
        ],
      ),
    );
  }

  // --- Helpers for Button Layout ---

  Widget _buildSingleButton(BuildContext context, Color primaryColor) {
    return SizedBox(
      width: .infinity,
      child: TextButton(
        onPressed: () {
          onConfirm?.call();
          SmartDialog.dismiss();
        },
        style: TextButton.styleFrom(
          padding: const .symmetric(vertical: 12),
          foregroundColor: primaryColor, // Use the status color for action
          textStyle: AppTextStyles.bodyLargeBold,
        ),
        child: Text(confirmText),
      ),
    );
  }

  Widget _buildDoubleButtons(BuildContext context, Color primaryColor) {
    final colorScheme = AppColors.of(context);

    return Row(
      children: [
        // Cancel (Low Emphasis)
        Expanded(
          child: TextButton(
            onPressed: () {
              onCancel?.call();
              SmartDialog.dismiss();
            },
            style: TextButton.styleFrom(
              padding: const .symmetric(vertical: 12),
              foregroundColor: colorScheme.onSurfaceVariant,
              textStyle: AppTextStyles.bodyLargeBold,
            ),
            child: Text(cancelText!),
          ),
        ),
        const SizedBox(width: 8),
        // Confirm (High Emphasis - colored by Type)
        Expanded(
          child: TextButton(
            onPressed: () {
              onConfirm?.call();
              SmartDialog.dismiss();
            },
            style: TextButton.styleFrom(
              padding: const .symmetric(vertical: 12),
              foregroundColor: primaryColor,
              textStyle: AppTextStyles.bodyLargeBold,
            ),
            child: Text(confirmText),
          ),
        ),
      ],
    );
  }

  // --- Style Logic ---

  _DialogStyle _getStyles(AppDialogType type, AppColors scheme) {
    switch (type) {
      case .success:
        return _DialogStyle(
          icon: Symbols.check_circle_rounded,
          color: scheme.success,
        );
      case .error:
        return _DialogStyle(icon: Symbols.error_rounded, color: scheme.error);
      case .warning:
        return _DialogStyle(
          icon: Symbols.warning_amber_rounded,
          color: scheme.warning,
        );
      case .info:
        return _DialogStyle(icon: Symbols.info_rounded, color: scheme.primary);
    }
  }
}

class _DialogStyle {
  final IconData icon;
  final Color color;

  _DialogStyle({required this.icon, required this.color});
}

class DownloadProgressDialog extends StatelessWidget {
  final Stream<int> progressStream;
  final String? version;

  const DownloadProgressDialog({
    super.key,
    required this.progressStream,
    this.version,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);

    return Container(
      constraints: const BoxConstraints(maxWidth: 320, minWidth: 280),
      margin: const .symmetric(horizontal: 24),
      padding: const .all(24),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHigh,
        borderRadius: .circular(28),
      ),
      child: StreamBuilder<int>(
        stream: progressStream,
        builder: (context, snapshot) {
          // Normalize value to 0.0 - 1.0 for the ProgressIndicator
          final double progress = (snapshot.data ?? 0) / 100.0;
          final int displayPercent = snapshot.data ?? 0;

          return Column(
            mainAxisSize: .min,
            children: [
              Icon(
                Symbols.cloud_download_rounded,
                size: 32,
                color: colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text(
                t.common.version.downloading,
                style: AppTextStyles.heading6.copyWith(
                  color: colorScheme.onSurface,
                ),
                textAlign: .center,
              ),
              const SizedBox(height: 16),

              // Progress Bar
              LinearPercentIndicator(
                percent: progress,
                lineHeight: 8,
                barRadius: const .circular(8),
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

              const SizedBox(height: 8),
              Text(
                t.common.version.downloadingVersion(version: version ?? ''),
                style: AppTextStyles.bodySmallRegular.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: .center,
              ),
            ],
          );
        },
      ),
    );
  }
}
