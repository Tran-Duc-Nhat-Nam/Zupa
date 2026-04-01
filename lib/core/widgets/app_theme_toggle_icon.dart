import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:zupa/core/styles/colors.dart';

class AppThemeToggleIcon extends StatelessWidget {
  final Animation<double> animation;
  final Color? color;

  const AppThemeToggleIcon({super.key, required this.animation, this.color});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.of(context);
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Stack(
          alignment: .center,
          children: [
            // Sun
            Opacity(
              opacity: 1 - animation.value,
              child: Icon(
                Symbols.sunny_rounded,
                color: color ?? colorScheme.surface,
              ),
            ),
            // Moon
            Opacity(
              opacity: animation.value,
              child: Icon(
                Symbols.nightlight_rounded,
                color: color ?? colorScheme.surface,
              ),
            ),
          ],
        );
      },
    );
  }
}
