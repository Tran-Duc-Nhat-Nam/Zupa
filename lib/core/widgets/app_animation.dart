import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zupa/features/animation/presentation/bloc/animation_cubit.dart';

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
  Widget build(BuildContext context) =>
      !animate || !context.watch<AnimationCubit>().state.isOn
      ? child
            .animate(key: key, delay: delay ?? 0.ms)
            .fadeIn(duration: 500.ms, curve: Curves.easeOutQuad)
            .slideY(
              begin: 0.05,
              end: 0,
              duration: 500.ms,
              curve: Curves.easeOutQuad,
            )
            .scale(
              begin: const .new(0.98, 0.98),
              end: const .new(1, 1),
              duration: 500.ms,
              curve: Curves.easeOutQuad,
            )
      : child;

  /// Staggered list animation helper
  static Widget staggeredList({
    required List<Widget> children,
    Duration interval = const .new(milliseconds: 50),
  }) => Column(
    mainAxisSize: .min,
    children: children
        .map(
          (child) => AppAnimation(
            delay: interval * children.indexOf(child),
            child: child,
          ),
        )
        .toList(),
  );
}

extension AppAnimationExtension on Widget {
  Widget withAppAnimation({Key? key, Duration? delay, bool animate = true}) =>
      AppAnimation(key: key, delay: delay, animate: animate, child: this);

  Widget animateIn({
    Key? key,
    int index = 0,
    Duration? delay,
    bool animate = true,
  }) => AppAnimation(
    key: key,
    delay: delay ?? .new(milliseconds: index * 50),
    animate: animate,
    child: this,
  );
}
