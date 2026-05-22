import 'package:flutter/material.dart';

class AppRadioGroup<T> extends StatelessWidget {
  const AppRadioGroup({
    super.key,
    required this.items,
    this.value,
    this.isVertical = false,
    this.showRadio = true, // Toggle visibility of the radio circle
    this.itemBuilder,
    this.spacing = 0,
    this.onChanged,
  });

  final List<T> items;
  final T? value;
  final bool isVertical;
  final bool showRadio;
  final double spacing;
  final void Function(T?)? onChanged;

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
    final children = items.map((item) {
      // The underlying radio widget
      final radioButton = Radio<T>(value: item);

      // If a custom builder is provided, use it
      if (itemBuilder != null) {
        return itemBuilder!(
          context,
          item,
          value == item,
          () => onChanged?.call(item),
          showRadio ? radioButton : null,
        );
      }

      return InkWell(
        onTap: () => onChanged?.call(item),
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
  }
}
