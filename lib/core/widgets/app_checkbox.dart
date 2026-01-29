import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';

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
              side: BorderSide(color: ThemeHelper.getColor(context).primary200),
              fillColor: .resolveWith<Color>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.selected)) {
                  return ThemeHelper.getColor(context).primary400;
                }
                return ThemeHelper.getColor(context).primary50;
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
