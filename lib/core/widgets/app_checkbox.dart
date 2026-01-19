import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppCheckbox extends StatelessWidget {
  const AppCheckbox({
    super.key,
    this.value,
    required this.name,
    this.onChanged,
    this.label,
  });

  final String name;
  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final Widget? label;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<bool>(
      name: name,
      builder: (field) => Row(
        spacing: 8,
        children: [
          SizedBox(
            height: 24,
            width: 24,
            child: Checkbox(
              value: value ?? field.value ?? false,
              onChanged: (value) {
                field.didChange(value);
                onChanged?.call(value);
              },
              side: BorderSide(color: Theme.of(context).colorScheme.tertiary),
              fillColor: .resolveWith<Color>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.selected)) {
                  return Theme.of(context).colorScheme.primary;
                }
                return Theme.of(context).colorScheme.surfaceContainer;
              }),
              shape: RoundedRectangleBorder(borderRadius: .circular(4)),
            ),
          ),
          if (label != null) ...[label!],
        ],
      ),
    );
  }
}
