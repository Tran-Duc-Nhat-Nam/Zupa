import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppAnimation extends StatelessWidget {
  final Widget child;
  final Duration? delay;
  final bool animate;

  const AppAnimation({
    super.key,
    required this.child,
    this.delay,
    this.animate = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!animate) return child;

    return child
        .animate(delay: delay ?? 0.ms)
        .fadeIn(duration: 500.ms, curve: Curves.easeOutQuad)
        .slideY(begin: 0.05, end: 0, duration: 500.ms, curve: Curves.easeOutQuad)
        .scale(
          begin: const Offset(0.98, 0.98),
          end: const Offset(1, 1),
          duration: 500.ms,
          curve: Curves.easeOutQuad,
        );
  }

  /// Staggered list animation helper
  static Widget staggeredList({
    required List<Widget> children,
    Duration interval = const Duration(milliseconds: 50),
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: children
          .map((child) => AppAnimation(
                delay: interval * children.indexOf(child),
                child: child,
              ))
          .toList(),
    );
  }
}

extension AppAnimationExtension on Widget {
  Widget withAppAnimation({Duration? delay, bool animate = true}) {
    return AppAnimation(
      delay: delay,
      animate: animate,
      child: this,
    );
  }

  Widget animateIn({int index = 0, Duration? delay, bool animate = true}) {
    return AppAnimation(
      delay: delay ?? Duration(milliseconds: index * 50),
      animate: animate,
      child: this,
    );
  }
}
