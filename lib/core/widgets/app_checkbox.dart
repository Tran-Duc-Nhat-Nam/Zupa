import 'package:flutter/material.dart';
import 'package:zupa/core/styles/colors.dart';

class AppCheckbox extends StatelessWidget {
  const AppCheckbox({
    super.key,
    this.value = false,
    this.onChanged,
    this.label,
  });

  final bool value;
  final ValueChanged<bool?>? onChanged;
  final Widget? label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);
    return Row(
      spacing: 8,
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(
            value: value,
            onChanged: (form) {
              onChanged?.call(form);
            },
            side: BorderSide(color: colorScheme.primaryContainer),
            fillColor: .resolveWith<Color>((Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return colorScheme.primary;
              }
              return colorScheme.surfaceContainerLow;
            }),
            shape: RoundedRectangleBorder(borderRadius: .circular(4)),
          ),
        ),
        ...[?label],
      ],
    );
  }
}
