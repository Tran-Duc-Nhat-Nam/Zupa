import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AppRadioGroup<T> extends StatelessWidget {
  const AppRadioGroup({
    super.key,
    required this.formControl,
    required this.items,
    this.isVertical = false,
    this.showRadio = true, // Toggle visibility of the radio circle
    this.itemBuilder,
    this.spacing = 0,
  });

  final FormControl<T>? formControl;
  final List<T> items;
  final bool isVertical;
  final bool showRadio;
  final double spacing;

  /// Custom builder to define how each item looks.
  /// [radioButton] is the standard ReactiveRadio widget.
  final Widget Function(
    BuildContext context,
    T item,
    bool isSelected,
    VoidCallback onSelect,
    Widget? radioButton,
  )?
  itemBuilder;

  @override
  Widget build(BuildContext context) {
    // Listen to changes in the form control to rebuild custom labels
    return ReactiveValueListenableBuilder<T>(
      formControl: formControl,
      builder: (context, control, child) {
        final children = items.map((item) {
          final isSelected = control.value == item;

          // The underlying radio widget
          final radioButton = ReactiveRadio<T>(
            formControl: formControl,
            value: item,
          );

          // If a custom builder is provided, use it
          if (itemBuilder != null) {
            return itemBuilder!(
              context,
              item,
              isSelected,
              () => control.value = item,
              showRadio ? radioButton : null,
            );
          }

          return InkWell(
            onTap: () => control.value = item,
            child: Row(
              mainAxisSize: .min,
              children: [if (showRadio) radioButton, Text(item.toString())],
            ),
          );
        }).toList();

        return isVertical
            ? Column(
                crossAxisAlignment: .start,
                mainAxisSize: .min,
                spacing: spacing,
                children: children,
              )
            : Row(spacing: spacing, children: children);
      },
    );
  }
}
