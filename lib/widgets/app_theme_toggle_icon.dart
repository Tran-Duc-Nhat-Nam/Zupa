import 'package:flutter/material.dart';

import '../helper/theme/theme_helper.dart';

class AppThemeToggleIcon extends StatelessWidget {
  final Animation<double> animation;
  final Color? color;

  const AppThemeToggleIcon({super.key, required this.animation, this.color});

  @override
  Widget build(BuildContext context) {
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
                Icons.wb_sunny,
                color: color ?? ThemeHelper.getColor(context).white,
              ),
            ),
            // Moon
            Opacity(
              opacity: animation.value,
              child: Icon(
                Icons.nightlight_round,
                color: color ?? ThemeHelper.getColor(context).white,
              ),
            ),
          ],
        );
      },
    );
  }
}
