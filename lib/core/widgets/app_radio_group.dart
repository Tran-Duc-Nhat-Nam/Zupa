import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AppRadioGroup<T> extends StatefulWidget {
  const AppRadioGroup({
    super.key,
    required this.formControl,
    required this.items,
    this.required = false,
    this.itemBuilder,
  });

  final FormControl<T> formControl;
  final List<T> items;
  final Widget Function(
    Widget radioButton,
    T item,
    bool isSelected,
    Function() select,
  )?
  itemBuilder;
  final bool required;

  @override
  State<AppRadioGroup<T>> createState() => _AppRadioGroupState<T>();
}

class _AppRadioGroupState<T> extends State<AppRadioGroup<T>> {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: .generate(widget.items.length, (index) {
        return ReactiveRadio<T>(value: widget.items[index]);
      }),
    );
  }
}
