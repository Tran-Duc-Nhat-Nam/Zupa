import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    this.text,
    this.child,
    this.fitContent = false,
    this.padding,
    this.icon,
    this.theme = AppButtonTheme.primary,
    this.color = AppButtonColor.info,
    this.height = 56,
    this.isForm = false,
    this.isLoading = false,
    this.debounceTime = 500, // Default debounce of 500ms
  });

  final VoidCallback? onPressed;
  final String? text;
  final Widget? child;
  final IconData? icon;
  final bool fitContent;
  final double height;
  final EdgeInsetsGeometry? padding;
  final AppButtonTheme theme;
  final AppButtonColor color;
  final bool isForm;
  final bool isLoading;
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
    if (widget.isForm) {
      return ReactiveFormConsumer(
        builder: (context, form, _) {
          return _buildButton(context, form.valid ? widget.onPressed : null);
        },
      );
    }

    return _buildButton(context, widget.onPressed);
  }

  Widget _buildButton(BuildContext context, VoidCallback? effectiveOnPressed) {
    final colorScheme = AppColors.of(context);
    final style = _getButtonStyle(colorScheme);

    return SizedBox(
      height: widget.height,
      width: widget.fitContent ? null : double.infinity,
      child: _getButtonType(
        // We wrap the callback with our debounce logic
        onPressed: (effectiveOnPressed == null || widget.isLoading)
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
      return const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }

    return widget.child ??
        Row(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.icon != null) ...[Icon(widget.icon, size: 20)],
            if (widget.text != null)
              Text(widget.text!, style: AppTextStyles.bodyLargeSemibold),
          ],
        );
  }

  ButtonStyle _getButtonStyle(dynamic colorScheme) {
    // Determine base color based on AppButtonColor enum
    final baseColor = switch (widget.color) {
      .success => colorScheme.success,
      .warning => colorScheme.warning,
      .error => colorScheme.error,
      .info => colorScheme.primary,
      .basic => colorScheme.onSurface,
    };

    // Return a modern ButtonStyle
    return switch (widget.theme) {
      .primary => FilledButton.styleFrom(
        backgroundColor: baseColor,
        padding: widget.padding,
      ),
      .secondary => FilledButton.styleFrom(
        // Material 3 uses Tonal for secondary
        padding: widget.padding,
      ),
      .outline => OutlinedButton.styleFrom(
        side: BorderSide(color: baseColor),
        foregroundColor: baseColor,
        padding: widget.padding,
      ),
    };
  }
}

enum AppButtonTheme { primary, secondary, outline }

enum AppButtonColor { basic, info, success, warning, error }
