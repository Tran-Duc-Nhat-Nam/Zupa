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
  });

  final String name;
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
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
      validators
          .addAll(widget.validators! as Iterable<FormFieldValidator<String>>);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
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
          controller: widget.controller,
          validator: FormBuilderValidators.compose(validators),
          obscureText: isPasswordVisible,
          textAlign: widget.textAlign ?? TextAlign.start,
          style: AppTextStyles.bodyMediumRegular.copyWith(
            color: ThemeHelper.getColor(context).grey500,
          ),
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            prefixIcon: widget.prefix != null || widget.prefixIconPath != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: widget.prefix ??
                        AppIcon(
                          path: widget.prefixIconPath!,
                          color: ThemeHelper.getColor(context).grey400,
                          size: 20,
                        ),
                  )
                : null,
            prefixIconConstraints:
                const BoxConstraints(maxHeight: 20, minWidth: 20),
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
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: ThemeHelper.getColor(context).error600),
                  )
                : const OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder: widget.hasBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: ThemeHelper.getColor(context).grey100),
                  )
                : const OutlineInputBorder(borderSide: BorderSide.none),
            focusedErrorBorder: widget.hasBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: ThemeHelper.getColor(context).error600),
                  )
                : const OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: widget.hasBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: ThemeHelper.getColor(context).grey200),
                  )
                : const OutlineInputBorder(borderSide: BorderSide.none),
            prefix: const Padding(
              padding: EdgeInsets.only(left: 16.0),
            ),
            suffixIconConstraints:
                const BoxConstraints(minHeight: 20, minWidth: 20),
            suffixIcon: widget.isPassword || widget.isPasswordConfirm
                ? IconButton(
                    iconSize: 20,
                    padding: const EdgeInsets.all(8),
                    constraints: const BoxConstraints(),
                    icon: Icon(
                      !isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: 20,
                    ),
                    style: const ButtonStyle(
                      tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap, // the '2023' part
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  )
                : null,
            isDense: true,
            contentPadding: widget.contentPadding ??
                const EdgeInsets.symmetric(
                  vertical: 12,
                ),
          ),
        ),
      ],
    );
  }
}
