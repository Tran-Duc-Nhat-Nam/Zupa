import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';

enum AppMessageType { success, error, warning, info }

/// Helper class for showing top-down notifications (Snackbars) in the app.
/// Follows Material Design 3 guidelines for floating snackbars.
class MessageHelper {
  MessageHelper._();

  /// Show a success message.
  static void showSuccess(
    BuildContext context, {
    required String message,
    String? title,
  }) {
    _show(
      context,
      message: message,
      title: title ?? t.common.success,
      type: .success,
    );
  }

  /// Show an error message.
  static void showError(
    BuildContext context, {
    required String message,
    String? title,
  }) {
    _show(
      context,
      message: message,
      title: title ?? t.common.errors.error,
      type: .error,
    );
  }

  /// Show a warning message.
  static void showWarning(
    BuildContext context, {
    required String message,
    String? title,
  }) {
    _show(
      context,
      message: message,
      title: title ?? t.common.warning,
      type: .warning,
    );
  }

  /// Show an information message.
  static void showInfo(
    BuildContext context, {
    required String message,
    String? title,
  }) {
    _show(
      context,
      message: message,
      title: title ?? t.common.info.info,
      type: .info,
    );
  }

  static void _show(
    BuildContext context, {
    required String message,
    String? title,
    required AppMessageType type,
  }) {
    final colorScheme = AppColors.of(context);
    final (icon, color) = _getStyle(type, colorScheme);

    Flushbar(
      title: title,
      message: message,
      icon: Padding(
        padding: const .only(left: 16),
        child: Icon(icon, color: color, size: 28),
      ),
      duration: const Duration(seconds: 4),
      flushbarPosition: .TOP,
      margin: const .fromLTRB(16, 12, 16, 0),
      borderRadius: .circular(28),
      backgroundColor: colorScheme.primaryContainer,
      titleColor: colorScheme.onPrimaryContainer,
      messageColor: colorScheme.onPrimaryContainer,
      titleText: Padding(
        padding: const .only(left: 8, right: 16),
        child: Text(
          title ?? '',
          style: AppTextStyles.titleMediumBold.copyWith(color: color),
        ),
      ),
      messageText: Padding(
        padding: const .only(left: 8, right: 16),
        child: Text(
          message,
          style: AppTextStyles.bodyMedium.copyWith(
            color: colorScheme.onPrimaryContainer,
          ),
        ),
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.black.withAlpha(55),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
      // MD3 standard: high emphasis with tonal background usually,
      // but inverse surface is standard for snackbars to ensure visibility.
      mainButton: title == null
          ? TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Icon(
                Symbols.close_rounded,
                color: colorScheme.onInverseSurface.withAlpha(175),
                size: 20,
              ),
            )
          : null,
      shouldIconPulse: false,
      animationDuration: const Duration(milliseconds: 400),
    ).show(context);
  }

  static (IconData, Color) _getStyle(AppMessageType type, AppColors scheme) {
    return switch (type) {
      .success => (Symbols.check_circle_rounded, scheme.success),
      .error => (Symbols.error_rounded, scheme.error),
      .warning => (Symbols.warning_amber_rounded, scheme.warning),
      .info => (Symbols.info_rounded, scheme.primary),
    };
  }
}
