import 'package:flutter/material.dart';

import '../helper/theme/theme_helper.dart';

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
      clipBehavior: clipBehavior ?? Clip.none,
      padding: padding ?? const EdgeInsets.all(16),
      height: height,
      width: width,
      decoration: decoration ??
          BoxDecoration(
            color: ThemeHelper.getColor(context).white,
            borderRadius: radius ?? BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0C0C0D0D),
                offset: Offset(0, 1),
                blurRadius: 4,
              ),
            ],
          ),
      constraints: constraints,
      child: child,
    );
  }
}
