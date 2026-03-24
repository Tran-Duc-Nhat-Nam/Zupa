import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:zupa/core/styles/colors.dart';

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

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      clipBehavior: clipBehavior ?? Clip.none,
      padding: padding ?? const EdgeInsets.all(16),
      height: height,
      width: width,
      decoration:
          decoration ??
          BoxDecoration(
            color: AppColors.of(context).surfaceContainer,
            borderRadius: radius ?? BorderRadius.circular(28),
          ),
      constraints: constraints,
      child: child,
    );

    if (animate) {
      content = content
          .animate()
          .fadeIn(duration: 400.ms, curve: Curves.easeOut)
          .slideY(begin: 0.1, end: 0, duration: 400.ms, curve: Curves.easeOut);
    }

    return content;
  }
}
