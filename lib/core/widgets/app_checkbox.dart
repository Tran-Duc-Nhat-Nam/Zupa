import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zupa/core/styles/colors.dart';

class AppCheckbox extends StatelessWidget {
  const AppCheckbox({
    super.key,
    this.value,
    required this.formControl,
    this.onChanged,
    this.label,
  });

  final FormControl<bool> formControl;
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
            formControl: formControl,
            onChanged: (form) {
              onChanged?.call(form.value ?? false);
            },
            side: BorderSide(color: AppColors.of(context).primaryContainer),
            fillColor: .resolveWith<Color>((
                Set<WidgetState> states,
                ) {
              if (states.contains(WidgetState.selected)) {
                return AppColors.of(context).primary;
              }
              return AppColors.of(context).surfaceContainerLow;
            }),
            shape: RoundedRectangleBorder(borderRadius: .circular(4)),
          ),
        ),
        if (label != null) ...[label!],
      ],
    );
  }
}
