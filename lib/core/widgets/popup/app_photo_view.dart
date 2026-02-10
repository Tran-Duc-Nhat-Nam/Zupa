import 'package:auto_route/auto_route.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

abstract class AppPhotoView {
  static Future<dynamic> showPhotoView(
    BuildContext context,
    ImageProvider imageProvider,
  ) async {
    return showDialog(
      context: context,
      builder: (context) => GestureDetector(
        onTap: () => context.pop(),
        child: ExtendedImageGesturePageView.builder(
          itemBuilder: (context, index) => Center(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const .all(24),
                child: ExtendedImage(
                  image: imageProvider,
                  fit: BoxFit.contain,
                  mode: ExtendedImageMode.gesture,
                  shape: .rectangle,
                  borderRadius: .circular(12),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Future<dynamic> showNetworkPhotoView(
    BuildContext context,
    String url,
  ) async {
    return showDialog(
      context: context,
      builder: (context) => GestureDetector(
        onTap: () => context.pop(),
        child: ExtendedImageGesturePageView.builder(
          itemBuilder: (context, index) => Center(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const .all(24),
                child: ExtendedImage.network(
                  url,
                  fit: BoxFit.contain,
                  mode: ExtendedImageMode.gesture,
                  shape: .rectangle,
                  borderRadius: .circular(12),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
