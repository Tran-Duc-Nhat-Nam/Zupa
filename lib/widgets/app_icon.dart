import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../helper/theme/theme_helper.dart';

class AppIcon extends StatelessWidget {
  const  AppIcon({
    super.key,
    required this.path,
    this.color,
    this.onTap,
    this.size,
    this.width,
    this.height,
  });

  final String path;
  final Color? color;
  final double? size;
  final double? width;
  final double? height;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    try {
      isLoading = Skeletonizer.of(context).enabled;
    } catch (e) {
      isLoading = false;
    }
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration:  BoxDecoration(shape: isLoading ? BoxShape.circle : BoxShape.rectangle),
      child: Skeleton.replace(
        width: width ?? size ?? 24,
        height: height ?? size ?? 24,
        child: InkWell(
          onTap: onTap,
          child: SvgPicture.asset(
            path,
            colorFilter: ColorFilter.mode(
              color ?? ThemeHelper.getColor(context).primary500,
              BlendMode.srcIn,
            ),
            width: width ?? size,
            height: height ?? size,
          ),
        ),
      ),
    );
  }
}
