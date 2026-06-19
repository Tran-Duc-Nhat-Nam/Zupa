import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/widgets/app_loading_widget.dart';
import 'package:zupa/core/widgets/popup/app_photo_view.dart';

class AppAvatarWidget extends StatelessWidget {
  final String imageUrl;
  final double size;
  final double borderRadius;
  final Widget? placeholder;

  const AppAvatarWidget({
    super.key,
    required this.imageUrl,
    this.size = 50.0,
    this.borderRadius = 6.0,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    final themeColors = context.colorScheme;

    return InkWell(
      onTap: () => AppPhotoView.showNetworkPhotoView(context, imageUrl),
      borderRadius: .circular(
        borderRadius,
      ), // Matches the ripple effect to the image shape
      child: ExtendedImage.network(
        imageUrl,
        fit: .cover,
        width: size,
        height: size,
        borderRadius: .circular(borderRadius),
        shape: .rectangle,
        loadStateChanged: (state) {
          return switch (state.extendedImageLoadState) {
            .loading => Center(
              child: AppLoadingWidget(color: themeColors.primary, size: .small),
            ),
            .completed => state.completedWidget,
            .failed =>
              placeholder ??
                  Icon(
                    Symbols.error_rounded,
                    color: themeColors.error,
                    size: size * 0.7,
                  ),
          };
        },
      ),
    );
  }
}
