import 'package:flutter/material.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/core/widgets/app_loading_widget.dart';

enum AppButtonTheme { primary, secondary, outline }

enum AppButtonColor { basic, info, success, warning, error }

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
    this.theme = .primary,
    this.color = .info,
    this.height = 56,
    this.width,
    this.isLoading = false,
    this.isDisabled = false,
    this.debounceTime = 500,
  });

  final VoidCallback? onPressed;
  final String? text;
  final Widget? child;
  final Widget? loadingChild;
  final IconData? icon;
  final bool fitContent;
  final double height;
  final double? width;
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

  void _handleTap() {
    // 1. Completely ignore actions when explicitly disabled or loading
    if (widget.onPressed == null || widget.isDisabled || widget.isLoading) {
      return;
    }

    final now = DateTime.now();
    if (_lastClickTime == null ||
        now.difference(_lastClickTime!) >
            Duration(milliseconds: widget.debounceTime)) {
      _lastClickTime = now;
      widget.onPressed!();
    } else {
      DebuggerHelper.talker.log('Tap ignored: Debounced');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final style = _getButtonStyle(colorScheme);

    // Physically disable the Material button ONLY if the action callback is missing or explicitly disabled.
    // If it's just loading, we keep the callback active to preserve brand colors.
    final isPhysicallyDisabled = widget.onPressed == null || widget.isDisabled;

    return SizedBox(
      height: widget.height,
      width: widget.fitContent ? null : widget.width ?? .infinity,
      child: switch (widget.theme) {
        .primary => FilledButton(
          onPressed: isPhysicallyDisabled ? null : _handleTap,
          style: style,
          child: _buildContent(context),
        ),
        .secondary => FilledButton.tonal(
          onPressed: isPhysicallyDisabled ? null : _handleTap,
          style: style,
          child: _buildContent(context),
        ),
        .outline => OutlinedButton(
          onPressed: isPhysicallyDisabled ? null : _handleTap,
          style: style,
          child: _buildContent(context),
        ),
      },
    );
  }

  Widget _buildContent(BuildContext context) => AnimatedSwitcher(
    duration: const .new(milliseconds: 250), // Smooth transition speed
    switchInCurve: Curves.easeInOut,
    switchOutCurve: Curves.easeInOut,
    // Necessary so Flutter knows how to transition between layouts of slightly different sizes
    layoutBuilder: (currentChild, previousChildren) => Stack(
      alignment: .center,
      children: [...previousChildren, ?currentChild],
    ),
    // The key tells AnimatedSwitcher that the widgets are different, triggering the animation
    child: widget.isLoading
        ? SizedBox(
            key: const ValueKey('button_loading'),
            child:
                widget.loadingChild ??
                AppLoadingWidget(
                  color: widget.theme == .outline
                      ? _getBaseColor(context.colorScheme)
                      : _getForegroundColor(context.colorScheme),
                  size: .small,
                ),
          )
        : SizedBox(
            key: const ValueKey('button_content'),
            child:
                widget.child ??
                Row(
                  spacing: 8,
                  mainAxisSize: .min,
                  mainAxisAlignment: .center,
                  children: [
                    if (widget.icon != null) Icon(widget.icon, size: 20),
                    if (widget.text != null)
                      Text(widget.text!, style: AppTextStyles.bodyLargeBold),
                  ],
                ),
          ),
  );

  Color _getForegroundColor(AppColors colorScheme) => switch (widget.color) {
    .success => colorScheme.onSuccess,
    .warning => colorScheme.onWarning,
    .error => colorScheme.onError,
    .info => colorScheme.onPrimary,
    .basic => colorScheme.surface,
  };

  Color _getBaseColor(AppColors colorScheme) => switch (widget.color) {
    .success => colorScheme.success,
    .warning => colorScheme.warning,
    .error => colorScheme.error,
    .info => colorScheme.primary,
    .basic => colorScheme.onSurface,
  };

  ButtonStyle _getButtonStyle(AppColors colorScheme) {
    final baseColor = _getBaseColor(colorScheme);
    final foregroundColor = _getForegroundColor(colorScheme);
    final isButtonDisabled = widget.onPressed == null || widget.isDisabled;
    final disabledBackground = colorScheme.onSurface.withAlpha(30);
    final disabledForeground = colorScheme.onSurface.withAlpha(100);

    return switch (widget.theme) {
      .primary => FilledButton.styleFrom(
        backgroundColor: baseColor,
        foregroundColor: foregroundColor,
        disabledBackgroundColor: disabledBackground,
        disabledForegroundColor: disabledForeground,
        padding: widget.padding,
      ),
      .secondary => FilledButton.styleFrom(padding: widget.padding),
      .outline => OutlinedButton.styleFrom(
        foregroundColor: baseColor,
        side: .new(color: isButtonDisabled ? disabledBackground : baseColor),
        disabledForegroundColor: disabledForeground,
        padding: widget.padding,
      ),
    };
  }
}
