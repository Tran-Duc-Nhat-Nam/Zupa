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
    final colorScheme = context.colorScheme;
    final (icon, color, textColor) = _getStyle(type, colorScheme);

    Flushbar(
      title: title,
      message: message,
      icon: Padding(
        padding: const .only(left: 16),
        child: Icon(icon, color: textColor, size: 28),
      ),
      dismissDirection: .HORIZONTAL,
      duration: const .new(seconds: 4),
      flushbarPosition: .TOP,
      margin: const .fromLTRB(16, 12, 16, 0),
      borderRadius: .circular(28),
      backgroundColor: color,
      titleColor: textColor,
      messageColor: textColor,
      titleText: Padding(
        padding: const .only(left: 8, right: 16),
        child: Text(
          title ?? '',
          style: AppTextStyles.titleMediumBold.copyWith(color: textColor),
        ),
      ),
      messageText: Padding(
        padding: const .only(left: 8, right: 16),
        child: Text(
          message,
          style: AppTextStyles.bodyMedium.copyWith(color: textColor),
        ),
      ),
      mainButton: title == null
          ? TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Icon(
                Symbols.close_rounded,
                color: colorScheme.onInverseSurface,
                size: 20,
              ),
            )
          : null,
      shouldIconPulse: false,
      animationDuration: const .new(milliseconds: 400),
    ).show(context);
  }

  static (IconData, Color, Color) _getStyle(
    AppMessageType type,
    AppColors scheme,
  ) => switch (type) {
    .success => (
      Symbols.check_circle_rounded,
      scheme.success,
      scheme.onSuccess,
    ),
    .error => (Symbols.error_rounded, scheme.error, scheme.onError),
    .warning => (
      Symbols.warning_amber_rounded,
      scheme.warning,
      scheme.onWarning,
    ),
    .info => (Symbols.info_rounded, scheme.primary, scheme.onPrimary),
  };
}
