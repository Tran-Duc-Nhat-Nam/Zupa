import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

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
    return Row(
      spacing: 16,
      children: .generate(widget.items.length, (index) {
        return ReactiveRadio<T>(
          value: widget.items[index]
        );
      }),
    );
  }
}
