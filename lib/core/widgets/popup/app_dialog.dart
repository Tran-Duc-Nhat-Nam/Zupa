import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/gen/strings.g.dart';

abstract class DialogHelper {
  static void showAuthDialog(BuildContext context) {
    showModal(
      context,
      subtitleText: t.subtitle_sessionEnded,
      titleText: t.title_sessionEnded,
      type: .warning,
      onOk: () {
        context.router.replaceAll([const LoginRoute()]);
      },
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
    final colorScheme = theme.colorScheme;
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
    final colorScheme = Theme.of(context).colorScheme;

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

  _DialogStyle _getStyles(AppDialogType type, ColorScheme scheme) {
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
