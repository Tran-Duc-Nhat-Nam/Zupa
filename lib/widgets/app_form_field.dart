import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AppFormField<T> extends StatelessWidget {
  const AppFormField({
    super.key,
    required this.name,
    this.required = false,
    this.isPassword = false,
    this.isPasswordConfirm = false,
    this.customValidators,
    required this.builder,
  });

  final String name;
  final bool required;
  final List<FormFieldValidator<T>>? customValidators;
  final Widget Function(FormFieldState<T> field) builder;
  final bool isPassword;
  final bool isPasswordConfirm;
  final List<FormFieldValidator<T>> _validators = const [];

  @override
  Widget build(BuildContext context) {
    if (required) {
      _validators.add(
        FormBuilderValidators.required(
          errorText: context.tr('errorMessage.required'),
        ),
      );
    }
    if (customValidators != null) {
      _validators
          .addAll(customValidators! as Iterable<FormFieldValidator<T>>);
    }
    return FormBuilderField<T>(
      name: name,
      validator: FormBuilderValidators.compose(_validators),
      builder: builder,
    );
  }
}
