import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({super.key, this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return Center(
      child: label != null
          ? Column(
              spacing: 4,
              mainAxisSize: .min,
              mainAxisAlignment: .center,
              children: [
                LoadingAnimationWidget.discreteCircle(
                  color: colors.primary,
                  size: 32,
                ),
                Text(
                  label!,
                  style: AppTextStyles.bodyMediumRegular.copyWith(
                    color: colors.onSurface,
                  ),
                ),
              ],
            )
          : LoadingAnimationWidget.discreteCircle(
              color: colors.primary,
              size: 32,
            ),
    );
  }
}
