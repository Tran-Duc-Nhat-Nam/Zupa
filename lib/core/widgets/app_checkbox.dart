import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
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
    return Row(
      spacing: 8,
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: ReactiveCheckbox(
            formControlName: name,
            onChanged: (form) {
              onChanged?.call(form.value ?? false);
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
    );
  }
}
