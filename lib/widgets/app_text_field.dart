import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'app_icon.dart';

import '../helper/theme/theme_helper.dart';
import '../common/styles/text_styles.dart';

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
    this.textAlign,
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
    validators = [];
    if (widget.required) {
      validators.add(
        FormBuilderValidators.required(
          errorText: context.tr('errorMessage.required'),
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
              color: ThemeHelper.getColor(context).grey650,
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
            color: ThemeHelper.getColor(context).grey500,
          ),
          textInputAction: .next,
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          onChanged: widget.onChanged,
          decoration: .new(
            prefixIcon: widget.prefix != null || widget.prefixIconPath != null
                ? Padding(
                    padding: const .only(left: 12),
                    child:
                        widget.prefix ??
                        AppIcon(
                          path: widget.prefixIconPath!,
                          color: ThemeHelper.getColor(context).grey400,
                          size: 20,
                        ),
                  )
                : null,
            prefixIconConstraints: const .new(maxHeight: 20, minWidth: 20),
            suffix: widget.suffix != null || widget.suffixIconPath != null
                ? widget.suffix ??
                      AppIcon(
                        path: widget.suffixIconPath!,
                        color: ThemeHelper.getColor(context).grey400,
                      )
                : null,
            hintText: widget.hintText,
            hintStyle: AppTextStyles.bodyMediumRegular.copyWith(
              color: ThemeHelper.getColor(context).grey500,
            ),
            labelText: widget.isExternalLabel
                ? null
                : widget.label != null
                ? null
                : widget.labelText,
            label: widget.isExternalLabel ? null : widget.label,
            labelStyle: AppTextStyles.bodyMediumMedium.copyWith(
              color: ThemeHelper.getColor(context).grey650,
            ),
            filled: true,
            fillColor: ThemeHelper.getColor(context).white,
            errorBorder: widget.hasBorder
                ? OutlineInputBorder(
                    borderRadius: .circular(8),
                    borderSide: .new(
                      color: ThemeHelper.getColor(context).error600,
                    ),
                  )
                : const OutlineInputBorder(borderSide: .none),
            enabledBorder: widget.hasBorder
                ? OutlineInputBorder(
                    borderRadius: .circular(8),
                    borderSide: .new(
                      color: ThemeHelper.getColor(context).grey100,
                    ),
                  )
                : const OutlineInputBorder(borderSide: .none),
            focusedErrorBorder: widget.hasBorder
                ? OutlineInputBorder(
                    borderRadius: .circular(8),
                    borderSide: .new(
                      color: ThemeHelper.getColor(context).error600,
                    ),
                  )
                : const OutlineInputBorder(borderSide: .none),
            focusedBorder: widget.hasBorder
                ? OutlineInputBorder(
                    borderRadius: .circular(8),
                    borderSide: .new(
                      color: ThemeHelper.getColor(context).grey200,
                    ),
                  )
                : const OutlineInputBorder(borderSide: .none),
            prefix: const Padding(padding: .only(left: 16.0)),
            suffixIconConstraints: const .new(minHeight: 20, minWidth: 20),
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
                    style: const .new(
                      tapTargetSize: .shrinkWrap, // the '2023' part
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  )
                : null,
            isDense: true,
            contentPadding:
                widget.contentPadding ?? const .symmetric(vertical: 12),
          ),
        ),
      ],
    );
  }
}
