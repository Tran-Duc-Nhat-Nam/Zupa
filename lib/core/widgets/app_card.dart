import 'package:flutter/material.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/widgets/app_animation.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    this.padding,
    this.radius,
    this.child,
    this.height,
    this.decoration,
    this.width,
    this.constraints,
    this.clipBehavior,
    this.animate = true,
    this.delay,
  });

  final Widget? child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? radius;
  final BoxConstraints? constraints;
  final BoxDecoration? decoration;
  final Clip? clipBehavior;
  final bool animate;
  final Duration? delay;

  @override
  Widget build(BuildContext context) {
    final content = Container(
      clipBehavior: clipBehavior ?? .none,
      padding: padding ?? const .all(16),
      height: height,
      width: width,
      decoration:
          decoration ??
          BoxDecoration(
            color: AppColors.of(context).surfaceContainer,
            borderRadius: radius ?? .circular(28),
          ),
      constraints: constraints,
      child: child,
    );

    return content.withAppAnimation(animate: animate, delay: delay);
  }
}
