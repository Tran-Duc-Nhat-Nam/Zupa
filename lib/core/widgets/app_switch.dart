import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';

class AppSwitch extends StatefulWidget {
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
  final void Function(bool value, void Function(bool confirmedValue) toggle)? onToggle;

  @override
  State<AppSwitch> createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch> {
  @override
  Widget build(BuildContext context) {
    // Check loading state safely
    final bool isLoading = Skeletonizer.of(context).enabled;

    return ReactiveFormField<bool, bool>(
      formControl: widget.formControl,
      builder: (field) {
        final currentValue = field.value ?? false;

        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: isLoading ? .circular(15) : BorderRadius.zero,
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
                  indicatorColor: Colors.white,
                  backgroundColor: value
                      ? ThemeHelper.getColor(context).primary500
                      : ThemeHelper.getColor(context).grey500,
                  borderRadius: BorderRadius.circular(15), // Half of height for pill shape
                  borderColor: Colors.transparent,
                ),

                // Logic to handle the toggle
                onChanged: (newValue) {
                  if (widget.onToggle != null) {
                    // Pass the new value and a callback to update the form field manually
                    widget.onToggle!(newValue, (confirmedValue) {
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