import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';

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
      backType: SmartBackType.block, // Prevent closing during download
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
        type: type,
      ),
      backType: dismissible ? SmartBackType.normal : SmartBackType.block,
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
  final String? cancelText; // If null, renders single button
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  const AppDialog({
    super.key,
    required this.type,
    required this.title,
    required this.description,
    this.confirmText = 'OK',
    this.cancelText,
    this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = AppColors.of(context);
    final styles = _getStyles(type, colorScheme);

    return Container(
      // MD3 Dialog Width constraints
      constraints: const BoxConstraints(maxWidth: 320, minWidth: 280),
      margin: const .symmetric(horizontal: 24),
      padding: const .fromLTRB(24, 24, 24, 24),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHigh,
        borderRadius: .circular(28),
      ),
      child: Column(
        mainAxisSize: .min,
        children: [
          // 1. Dynamic Icon
          Icon(styles.icon, size: 32, color: styles.color),
          const SizedBox(height: 16),

          // 2. Headline
          Text(
            title,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: .w600,
            ),
            textAlign: .center,
          ),
          const SizedBox(height: 16),

          // 3. Supporting Text
          Text(
            description,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: .center,
          ),
          const SizedBox(height: 24),

          // 4. Action Buttons
          if (cancelText != null)
            _buildDoubleButtons(context, styles.color)
          else
            _buildSingleButton(context, styles.color),
        ],
      ),
    );
  }

  // --- Helpers for Button Layout ---

  Widget _buildSingleButton(BuildContext context, Color primaryColor) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          onConfirm?.call();
          SmartDialog.dismiss();
        },
        style: TextButton.styleFrom(
          padding: const .symmetric(vertical: 12),
          foregroundColor: primaryColor, // Use the status color for action
          textStyle: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
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
              textStyle: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(fontWeight: .w600),
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
              textStyle: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(fontWeight: .bold),
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
          icon: Icons.check_circle_rounded,
          // Green is standard for success, but you can use primary if preferred
          color: Colors.green,
        );
      case .error:
        return _DialogStyle(icon: Icons.error_rounded, color: scheme.error);
      case .warning:
        return _DialogStyle(
          icon: Icons.warning_amber_rounded,
          color: Colors
              .amber[800]!, // Darker amber for better contrast on light themes
        );
      case .info:
        return _DialogStyle(icon: Icons.info_rounded, color: scheme.primary);
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
    final theme = Theme.of(context);
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Symbols.cloud_download_rounded,
                size: 32,
                color: colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text(
                t.common.version.downloading,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: .w600,
                ),
                textAlign: .center,
              ),
              const SizedBox(height: 16),

              // Progress Bar
              ClipRRect(
                borderRadius: .circular(8),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 8,
                  backgroundColor: colorScheme.surfaceContainerHighest,
                  color: colorScheme.primary,
                ),
              ),

              const SizedBox(height: 12),

              // Percentage Text
              Text(
                '$displayPercent%',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: .bold,
                ),
              ),

              const SizedBox(height: 8),
              Text(
                t.common.version.downloadingVersion(version: version ?? ''),
                style: theme.textTheme.bodySmall?.copyWith(
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
