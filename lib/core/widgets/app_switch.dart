import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zupa/core/styles/colors.dart';

class AppSwitch extends StatelessWidget {
  const AppSwitch({super.key, this.onToggle, this.value = false});

  final bool value;

  /// Callback to intercept the toggle.
  /// [value] is the *new* requested state.
  final void Function(bool value)? onToggle;

  @override
  Widget build(BuildContext context) {
    // Check loading state safely
    final isLoading = Skeletonizer.of(context).enabled;
    final colorScheme = AppColors.of(context);

    return Container(
      clipBehavior: .antiAlias,
      decoration: BoxDecoration(
        borderRadius: isLoading ? .circular(16) : .zero,
      ),
      child: Skeleton.replace(
        width: 52,
        height: 32,
        child: SizedBox(
          width: 52,
          child: AnimatedToggleSwitch<bool>.dual(
            first: false,
            second: true,
            current: value,
            height: 32,
            indicatorSize: const Size(24, 24),
            spacing: 0,
            styleBuilder: (value) => ToggleStyle(
              indicatorColor: colorScheme.surface,
              backgroundColor: value
                  ? colorScheme.primary
                  : colorScheme.outlineVariant,
              borderRadius: .circular(16),
              borderColor: Colors.transparent,
            ),
            onChanged: (newValue) {
              onToggle?.call(newValue);
            },
          ),
        ),
      ),
    );
  }
}
