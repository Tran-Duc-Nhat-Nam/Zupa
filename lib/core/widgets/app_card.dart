import 'package:flutter/material.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';

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
  });

  final Widget? child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? radius;
  final BoxConstraints? constraints;
  final BoxDecoration? decoration;
  final Clip? clipBehavior;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: clipBehavior ?? .none,
      padding: padding ?? const .all(16),
      height: height,
      width: width,
      decoration:
          decoration ??
          BoxDecoration(
            color: ThemeHelper.getColor(context).primary100.withAlpha(125),
            borderRadius: radius ?? .circular(28),
          ),
      constraints: constraints,
      child: child,
    );
  }
}
