import 'package:flutter/material.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    this.text,
    this.child,
    this.loadingChild,
    this.fitContent = false,
    this.padding,
    this.icon,
    this.theme = AppButtonTheme.primary,
    this.color = AppButtonColor.info,
    this.height = 56,
    this.isLoading = false,
    this.isDisabled = false,
    this.debounceTime = 500, // Default debounce of 500ms
  });

  final VoidCallback? onPressed;
  final String? text;
  final Widget? child;
  final Widget? loadingChild;
  final IconData? icon;
  final bool fitContent;
  final double height;
  final EdgeInsetsGeometry? padding;
  final AppButtonTheme theme;
  final AppButtonColor color;
  final bool isLoading;
  final bool isDisabled;
  final int debounceTime;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  DateTime? _lastClickTime;

  void _handleTap(VoidCallback? originalOnPressed) {
    if (originalOnPressed == null) return;

    final now = DateTime.now();

    // Check if enough time has passed since the last tap
    if (_lastClickTime == null ||
        now.difference(_lastClickTime!) >
            Duration(milliseconds: widget.debounceTime)) {
      _lastClickTime = now;
      originalOnPressed();
    } else {
      DebuggerHelper.talker.log('Tap ignored: Debounced');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildButton(context, widget.onPressed);
  }

  Widget _buildButton(BuildContext context, VoidCallback? effectiveOnPressed) {
    final colorScheme = AppColors.of(context);
    final style = _getButtonStyle(colorScheme);

    return SizedBox(
      height: widget.height,
      width: widget.fitContent ? null : double.infinity,
      child: _getButtonType(
        // The button is physically disabled if effectiveOnPressed is null or isLoading is true
        onPressed:
            (effectiveOnPressed == null ||
                widget.isLoading ||
                widget.isDisabled)
            ? null
            : () => _handleTap(effectiveOnPressed),
        style: style,
        content: _buildContent(context),
      ),
    );
  }

  // Choose the Button Type based on theme
  Widget _getButtonType({
    required VoidCallback? onPressed,
    required ButtonStyle style,
    required Widget content,
  }) {
    return switch (widget.theme) {
      .primary => FilledButton(
        onPressed: onPressed,
        style: style,
        child: content,
      ),
      .secondary => FilledButton.tonal(
        onPressed: onPressed,
        style: style,
        child: content,
      ),
      .outline => OutlinedButton(
        onPressed: onPressed,
        style: style,
        child: content,
      ),
    };
  }

  Widget _buildContent(BuildContext context) {
    if (widget.isLoading) {
      return widget.loadingChild ??
          const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          );
    }

    return widget.child ??
        Row(
          spacing: 8,
          mainAxisSize: .min,
          mainAxisAlignment: .center,
          children: [
            if (widget.icon != null) ...[Icon(widget.icon, size: 20)],
            if (widget.text != null)
              Text(widget.text!, style: AppTextStyles.bodyLargeBold),
          ],
        );
  }

  ButtonStyle _getButtonStyle(AppColors colorScheme) {
    final baseColor = switch (widget.color) {
      .success => colorScheme.success,
      .warning => colorScheme.warning,
      .error => colorScheme.error,
      .info => colorScheme.primary,
      .basic => colorScheme.onSurface,
    };

    final foregroundColor = switch (widget.color) {
      .success => colorScheme.onSuccess,
      .warning => colorScheme.onWarning,
      .error => colorScheme.onError,
      .info => colorScheme.onPrimary,
      .basic => colorScheme.surface,
    };

    final isButtonDisabled =
        widget.onPressed == null || widget.isLoading || widget.isDisabled;

    return switch (widget.theme) {
      AppButtonTheme.primary => FilledButton.styleFrom(
        backgroundColor: baseColor,
        foregroundColor: foregroundColor,
        disabledBackgroundColor: colorScheme.onSurface.withAlpha(35),
        disabledForegroundColor: colorScheme.onSurface.withAlpha(100),
        padding: widget.padding,
      ),
      AppButtonTheme.secondary => FilledButton.styleFrom(
        padding: widget.padding,
      ),
      AppButtonTheme.outline => OutlinedButton.styleFrom(
        foregroundColor: baseColor,
        side: BorderSide(
          color: isButtonDisabled
              ? colorScheme.onSurface.withAlpha(35)
              : baseColor,
        ),
        disabledForegroundColor: colorScheme.onSurface.withAlpha(100),
        padding: widget.padding,
      ),
    };
  }
}

enum AppButtonTheme { primary, secondary, outline }

enum AppButtonColor { basic, info, success, warning, error }
