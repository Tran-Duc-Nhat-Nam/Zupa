
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:zupa/core/widgets/app_icon.dart';

import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/styles/text_styles.dart';
import 'package:zupa/gen/strings.g.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.name,
    this.labelText,
    this.label,
    this.required = false,
    this.isPassword = false,
    this.isPasswordConfirm = false,
    this.onChanged,
    this.validators,
    this.isExternalLabel = false,
    this.contentPadding,
    this.hintText,
    this.prefix,
    this.suffix,
    this.prefixIconPath,
    this.suffixIconPath,
    this.hasBorder = true,
    this.border,
    this.textAlign,
    this.borderRadius = 12,
    this.controller,
    this.initialValue,
  });

  final String name;
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final Widget? label;
  final Widget? prefix;
  final Widget? suffix;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final bool isExternalLabel;
  final bool required;
  final List<FormFieldValidator<String>>? validators;
  final void Function(String?)? onChanged;
  final bool isPassword;
  final EdgeInsetsGeometry? contentPadding;
  final bool isPasswordConfirm;
  final bool hasBorder;
  final InputBorder? border;
  final double borderRadius;
  final TextAlign? textAlign;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  List<FormFieldValidator<String>> validators = [];
  late bool isPasswordVisible;

  @override
  void initState() {
    isPasswordVisible = widget.isPassword || widget.isPasswordConfirm;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorsScheme = ThemeHelper.getColor(context);

    validators = [];
    if (widget.required) {
      validators.add(
        FormBuilderValidators.required(
          errorText: Translations.of(context).errorMessage.required,
        ),
      );
    }
    if (widget.validators != null) {
      validators.addAll(
        widget.validators! as Iterable<FormFieldValidator<String>>,
      );
    }

    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        if (widget.isExternalLabel)
          Text(
            widget.labelText ?? '',
            style: AppTextStyles.bodyMediumMedium.copyWith(
              color: colorsScheme.grey650,
            ),
          ),
        FormBuilderTextField(
          name: widget.name,
          controller: widget.initialValue != null ? null : widget.controller,
          validator: FormBuilderValidators.compose(validators),
          obscureText: isPasswordVisible,
          initialValue: widget.initialValue,
          textAlign: widget.textAlign ?? .start,
          style: AppTextStyles.bodyMediumRegular.copyWith(
            color: colorsScheme.grey500,
          ),
          textInputAction: .next,
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          onChanged: widget.onChanged,
          textAlignVertical: .center,
          decoration: .new(
            prefixIcon: widget.prefix != null || widget.prefixIconPath != null
                ? Padding(
                    padding: const .only(left: 12, right: 6),
                    child:
                        widget.prefix ??
                        AppIcon(
                          path: widget.prefixIconPath!,
                          color: colorsScheme.grey400,
                          size: 20,
                        ),
                  )
                : null,
            prefixIconConstraints: const .new(maxHeight: 20, minWidth: 20),
            suffixIcon: widget.isPassword || widget.isPasswordConfirm
                ? IconButton(
                    iconSize: 20,
                    padding: const .all(8),
                    constraints: const .new(),
                    icon: Icon(
                      !isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: 20,
                    ),
                    style: const .new(tapTargetSize: .shrinkWrap),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  )
                : widget.suffix != null || widget.suffixIconPath != null
                ? Padding(
                    padding: const .only(left: 6, right: 12),
                    child:
                        widget.suffix ??
                        AppIcon(
                          path: widget.suffixIconPath!,
                          color: colorsScheme.grey400,
                          size: 20,
                        ),
                  )
                : null,
            suffixIconConstraints: const .new(maxHeight: 20, minWidth: 20),
            hintText: widget.hintText,
            hintStyle: AppTextStyles.bodyMediumRegular.copyWith(
              color: colorsScheme.grey500,
            ),
            labelText: widget.isExternalLabel
                ? null
                : widget.label != null
                ? null
                : widget.labelText,
            label: widget.isExternalLabel ? null : widget.label,
            labelStyle: AppTextStyles.bodyMediumMedium.copyWith(
              color: colorsScheme.grey650,
            ),
            filled: true,
            fillColor: colorsScheme.white,
            errorBorder:
                widget.border ??
                (widget.hasBorder
                    ? OutlineInputBorder(
                        borderRadius: .circular(widget.borderRadius),
                        borderSide: .new(color: colorsScheme.error600),
                      )
                    : const OutlineInputBorder(borderSide: .none)),
            enabledBorder:
                widget.border ??
                (widget.hasBorder
                    ? OutlineInputBorder(
                        borderRadius: .circular(widget.borderRadius),
                        borderSide: .new(color: colorsScheme.grey100),
                      )
                    : const OutlineInputBorder(borderSide: .none)),
            focusedErrorBorder:
                widget.border ??
                (widget.hasBorder
                    ? OutlineInputBorder(
                        borderRadius: .circular(widget.borderRadius),
                        borderSide: .new(color: colorsScheme.error600),
                      )
                    : const OutlineInputBorder(borderSide: .none)),
            focusedBorder:
                widget.border ??
                (widget.hasBorder
                    ? OutlineInputBorder(
                        borderRadius: .circular(widget.borderRadius),
                        borderSide: .new(color: colorsScheme.grey200),
                      )
                    : const OutlineInputBorder(borderSide: .none)),
            contentPadding: widget.contentPadding ?? const .all(12),
          ),
        ),
      ],
    );
  }
}
