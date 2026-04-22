import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.formControl,
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
    this.hasBorder = false,
    this.border,
    this.textAlign,
    this.borderRadius = 28,
    this.controller,
    this.initialValue,
    this.backgroundColor,
  });

  final FormControl<dynamic>? formControl;
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final Widget? label;
  final Widget? prefix;
  final Widget? suffix;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isExternalLabel;
  final void Function(FormControl)? onChanged;
  final bool isPassword;
  final EdgeInsetsGeometry? contentPadding;
  final bool isPasswordConfirm;
  final bool hasBorder;
  final InputBorder? border;
  final double borderRadius;
  final TextAlign? textAlign;
  final Color? backgroundColor;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool isPasswordVisible;

  @override
  void initState() {
    isPasswordVisible = widget.isPassword || widget.isPasswordConfirm;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorsScheme = AppColors.of(context);

    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        if (widget.isExternalLabel)
          Text(
            widget.labelText ?? '',
            style: AppTextStyles.bodyMediumMedium.copyWith(
              color: colorsScheme.onSurface,
            ),
          ),
        ReactiveTextField(
          formControl: widget.formControl,
          controller: widget.initialValue != null ? null : widget.controller,
          obscureText: isPasswordVisible,
          textAlign: widget.textAlign ?? .start,
          style: AppTextStyles.bodyMedium.copyWith(
            color: colorsScheme.onSurface,
          ),
          validationMessages: {
            ValidationMessage.mustMatch: (error) =>
                t.common.errors.passwordMustMatch,
            ValidationMessage.required: (error) => t.common.errors.required,
          },
          textInputAction: .next,
          onEditingComplete: (_) => FocusScope.of(context).nextFocus(),
          onChanged: widget.onChanged,
          textAlignVertical: .center,
          decoration: InputDecoration(
            prefixIcon: widget.prefix != null || widget.prefixIcon != null
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
                : null,
            prefixIconConstraints: const BoxConstraints(
              maxHeight: 20,
              minWidth: 20,
            ),
            suffixIcon: widget.isPassword || widget.isPasswordConfirm
                ? IconButton(
                    iconSize: 20,
                    padding: const .symmetric(horizontal: 16),
                    constraints: const BoxConstraints(),
                    icon: Icon(
                      !isPasswordVisible
                          ? Symbols.visibility_rounded
                          : Symbols.visibility_off_rounded,
                      size: 20,
                      color: colorsScheme.onSurfaceVariant,
                    ),
                    style: const ButtonStyle(tapTargetSize: .shrinkWrap),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  )
                : widget.suffix != null || widget.suffixIcon != null
                ? Padding(
                    padding: const .only(left: 6, right: 12),
                    child:
                        widget.suffix ??
                        Icon(
                          widget.suffixIcon,
                          color: colorsScheme.onSurfaceVariant,
                          size: 20,
                        ),
                  )
                : null,
            suffixIconConstraints: const BoxConstraints(
              maxHeight: 20,
              minWidth: 20,
            ),
            hintText: widget.hintText,
            hintStyle: AppTextStyles.bodyMedium.copyWith(
              color: colorsScheme.onSurfaceVariant,
            ),
            labelText: widget.isExternalLabel
                ? null
                : widget.label != null
                ? null
                : widget.labelText,
            label: widget.isExternalLabel ? null : widget.label,
            labelStyle: AppTextStyles.bodyMediumSemibold.copyWith(
              color: colorsScheme.onSurfaceVariant,
            ),
            filled: true,
            fillColor:
                widget.backgroundColor ?? colorsScheme.surfaceContainerHigh,
            errorBorder:
                widget.border ??
                OutlineInputBorder(
                  borderRadius: .circular(widget.borderRadius),
                  borderSide: widget.hasBorder
                      ? .new(color: colorsScheme.error)
                      : .none,
                ),
            enabledBorder:
                widget.border ??
                OutlineInputBorder(
                  borderRadius: .circular(widget.borderRadius),
                  borderSide: widget.hasBorder
                      ? .new(color: colorsScheme.outline)
                      : .none,
                ),
            focusedErrorBorder:
                widget.border ??
                OutlineInputBorder(
                  borderRadius: .circular(widget.borderRadius),
                  borderSide: widget.hasBorder
                      ? .new(color: colorsScheme.error)
                      : .none,
                ),
            focusedBorder:
                widget.border ??
                OutlineInputBorder(
                  borderRadius: .circular(widget.borderRadius),
                  borderSide: widget.hasBorder
                      ? .new(color: colorsScheme.primary)
                      : .none,
                ),
            contentPadding: widget.contentPadding ?? const .all(16),
          ),
        ),
      ],
    );
  }
}
