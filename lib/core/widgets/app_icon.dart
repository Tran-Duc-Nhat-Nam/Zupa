import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vector_graphics/vector_graphics.dart';

import 'package:zupa/core/helper/theme/theme_helper.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
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
      clipBehavior: .antiAlias,
      decoration: BoxDecoration(
        shape: isLoading ? BoxShape.circle : BoxShape.rectangle,
      ),
      child: Skeleton.replace(
        width: width ?? size ?? 24,
        height: height ?? size ?? 24,
        child: InkWell(
          onTap: onTap,
          child: VectorGraphic(
            loader: AssetBytesLoader(path),
            colorFilter: .mode(
              color ?? ThemeHelper.getColor(context).primary500,
              .srcIn,
            ),
            width: width ?? size,
            height: height ?? size,
          ),
        ),
      ),
    );
  }
}
