import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.labelText,
    this.label,
    this.isPassword = false,
    this.isPasswordConfirm = false,
    this.onChanged,
    this.isExternalLabel = false,
    this.contentPadding,
    this.hintText,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.hasBorder = true,
    this.border,
    this.textAlign,
    this.borderRadius = 4,
    this.controller,
    this.initialValue,
    this.backgroundColor,
    this.errorText,
    this.keyboardType,
    this.textInputAction,
    this.onEditingComplete,
    this.focusNode,
    this.obscureText,
    this.isReadOnly = false,
  });

  // Generic properties
  final TextEditingController? controller;
  final String? initialValue;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final Widget? label;
  final Widget? prefix;
  final Widget? suffix;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isExternalLabel;
  final void Function(String)? onChanged;
  final bool isPassword;
  final bool isPasswordConfirm;
  final EdgeInsetsGeometry? contentPadding;
  final bool hasBorder;
  final InputBorder? border;
  final double borderRadius;
  final TextAlign? textAlign;
  final Color? backgroundColor;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;
  final bool? obscureText;
  final bool isReadOnly;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _isObscured;
  late TextEditingController _controller;

  @override
  void didUpdateWidget(AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue &&
        widget.initialValue != _controller.text) {
      _controller.text = widget.initialValue ?? '';
    }
  }

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isPassword || widget.isPasswordConfirm;
    _controller = widget.controller ?? .new(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    final colorsScheme = context.colorScheme;
    final bool isPasswordType = widget.isPassword || widget.isPasswordConfirm;

    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        if (widget.isExternalLabel && widget.labelText != null)
          Text(
            widget.labelText!,
            style: AppTextStyles.bodyMediumMedium.copyWith(
              color: colorsScheme.onSurface,
            ),
          ),
        TextField(
          controller: widget.controller ?? _controller,
          focusNode: widget.focusNode,
          enabled: !widget.isReadOnly,
          obscureText:
              widget.obscureText ?? (isPasswordType ? _isObscured : false),
          textAlign: widget.textAlign ?? .start,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction ?? .next,
          onEditingComplete:
              widget.onEditingComplete ??
              () => FocusScope.of(context).nextFocus(),
          onChanged: widget.onChanged,
          textAlignVertical: .center,
          style: AppTextStyles.bodyMedium.copyWith(
            color: colorsScheme.onSurface,
          ),
          decoration: .new(
            errorText: widget.errorText,
            prefixIcon: _buildPrefix(colorsScheme),
            prefixIconConstraints: const .new(maxHeight: 40, minWidth: 44),
            suffixIcon: _buildSuffix(colorsScheme, isPasswordType),
            suffixIconConstraints: const .new(maxHeight: 40, minWidth: 44),
            hintText: widget.hintText,
            hintStyle: AppTextStyles.bodyMedium.copyWith(
              color: colorsScheme.onSurfaceVariant,
            ),
            labelText: widget.isExternalLabel ? null : widget.labelText,
            label: widget.isExternalLabel ? null : widget.label,
            labelStyle: AppTextStyles.bodyMediumSemibold.copyWith(
              color: widget.isReadOnly
                  ? colorsScheme.onSurface
                  : colorsScheme.onSurfaceVariant,
            ),
            filled: false,
            fillColor:
                widget.backgroundColor ?? colorsScheme.surfaceContainerHigh,
            border: _getBorder(borderColor: colorsScheme.outline),
            enabledBorder: _getBorder(borderColor: colorsScheme.outline),
            disabledBorder: _getBorder(
              borderColor: colorsScheme.onSurface,
              alpha: 96,
            ),
            focusedBorder: _getBorder(borderColor: colorsScheme.primary),
            errorBorder: _getBorder(borderColor: colorsScheme.error),
            focusedErrorBorder: _getBorder(borderColor: colorsScheme.error),
            contentPadding: widget.contentPadding,
          ),
        ),
      ],
    );
  }

  Widget? _buildPrefix(dynamic colorsScheme) =>
      widget.prefix != null || widget.prefixIcon != null
      ? Padding(
          padding: const .only(left: 16, right: 8),
          child:
              widget.prefix ??
              Icon(
                widget.prefixIcon,
                color: colorsScheme.onSurfaceVariant,
                size: 20,
              ),
        )
      : null;

  Widget? _buildSuffix(dynamic colorsScheme, bool isPasswordType) =>
      isPasswordType
      ? IconButton(
          iconSize: 20,
          padding: const .symmetric(horizontal: 16),
          icon: Icon(
            _isObscured
                ? Symbols.visibility_off_rounded
                : Symbols.visibility_rounded,
            color: colorsScheme.onSurfaceVariant,
          ),
          onPressed: () => setState(() => _isObscured = !_isObscured),
        )
      : widget.suffix != null || widget.suffixIcon != null
      ? Padding(
          padding: const .only(left: 8, right: 16),
          child:
              widget.suffix ??
              Icon(
                widget.suffixIcon,
                color: colorsScheme.onSurfaceVariant,
                size: 20,
              ),
        )
      : null;

  InputBorder _getBorder({int alpha = 255, required Color borderColor}) =>
      widget.border ??
      OutlineInputBorder(
        borderRadius: .circular(widget.borderRadius),
        borderSide: widget.hasBorder
            ? .new(color: borderColor.withAlpha(alpha))
            : .none,
      );
}
