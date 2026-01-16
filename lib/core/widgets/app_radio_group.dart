import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AppRadioGroup<T> extends StatefulWidget {
  const AppRadioGroup({
    super.key,
    required this.name,
    required this.items,
    this.required = false,
    this.customValidators,
    this.itemBuilder,
  });

  final String name;
  final List<T> items;
  final Widget Function(
    Widget radioButton,
    T item,
    bool isSelected,
    Function() select,
  )?
  itemBuilder;
  final bool required;
  final List<FormFieldValidator<String>>? customValidators;

  @override
  State<AppRadioGroup<T>> createState() => _AppRadioGroupState<T>();
}

class _AppRadioGroupState<T> extends State<AppRadioGroup<T>> {
  T? selectedValue;
  @override
  Widget build(BuildContext context) {
    final List<FormFieldValidator<T?>> validators = [];
    if (widget.required) {
      validators.add(
        FormBuilderValidators.required(
          errorText: context.tr('errorMessage.required'),
        ),
      );
    }
    if (widget.customValidators != null) {
      validators.addAll(
        widget.customValidators! as Iterable<FormFieldValidator<T?>>,
      );
    }
    return FormBuilderField<T>(
      builder: (field) => RadioGroup<T?>(
        onChanged: (value) => field.didChange(value),
        groupValue: field.value,
        child: Row(
          spacing: 16,
          children: .generate(widget.items.length, (index) {
            if (widget.itemBuilder != null) {
              return widget.itemBuilder!(
                Radio<T>(value: widget.items[index]),
                widget.items[index],
                field.value == widget.items[index],
                () => field.didChange(widget.items[index]),
              );
            }
            return Radio<T>(value: widget.items[index]);
          }),
        ),
      ),
      name: widget.name,
      validator: FormBuilderValidators.compose(validators),
    );
  }
}
