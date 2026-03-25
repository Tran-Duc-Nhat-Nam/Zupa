import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/styles/colors.dart';

class AppSwitch extends StatelessWidget {
  const AppSwitch({
    super.key,
    required this.formControl,
    this.onToggle,
    this.initialValue = false,
  });

  final FormControl<bool> formControl;
  final bool initialValue;

  /// Callback to intercept the toggle.
  /// [value] is the *new* requested state.
  /// [toggle] is a function you must call to confirm the state change.
  final void Function(bool value, void Function(bool confirmedValue) toggle)?
  onToggle;

  @override
  Widget build(BuildContext context) {
    // Check loading state safely
    final isLoading = Skeletonizer.of(context).enabled;
    final colorScheme = AppColors.of(context);

    return ReactiveFormField<bool, bool>(
      formControl: formControl,
      builder: (field) {
        final currentValue = field.value ?? false;

        return Container(
          clipBehavior: .antiAlias,
          decoration: BoxDecoration(
            borderRadius: isLoading ? .circular(16) : .zero,
          ),
          child: Skeleton.replace(
            width: 50,
            height: 30,
            child: SizedBox(
              width: 50, // Fixed width to match previous dimensions
              child: AnimatedToggleSwitch<bool>.rolling(
                current: currentValue,
                values: const [false, true],
                height: 30,
                // Dynamic styling based on the state (True/False)
                styleBuilder: (value) => ToggleStyle(
                  indicatorColor: colorScheme.surface,
                  backgroundColor: value
                      ? colorScheme.primary
                      : colorScheme.outline,
                  borderRadius: .circular(16), // Half of height for pill shape
                  borderColor: Colors.transparent,
                ),

                // Logic to handle the toggle
                onChanged: (newValue) {
                  if (onToggle != null) {
                    // Pass the new value and a callback to update the form field manually
                    onToggle!(newValue, (confirmedValue) {
                      field.didChange(confirmedValue);
                    });
                  } else {
                    // Standard update
                    field.didChange(newValue);
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
