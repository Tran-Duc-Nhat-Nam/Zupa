import 'package:flutter/material.dart';
import 'package:material3_expressive_loading_indicator/material3_expressive_loading_indicator.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({
    super.key,
    this.label,
    this.size = .medium,
    this.color,
  });

  final String? label;
  final AppLoadingWidgetSize size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    return Center(
      child: Column(
        spacing: 8,
        mainAxisSize: .min,
        mainAxisAlignment: .center,
        children: [
          ExpressiveLoadingIndicator(
            color: color,
            constraints: .new(
              minHeight: size.size,
              minWidth: size.size,
              maxHeight: size.size,
              maxWidth: size.size,
            ),
          ),
          if (label != null)
            Text(
              label!,
              style: AppTextStyles.bodyMediumMedium.copyWith(
                color: colors.onSurface,
              ),
              textAlign: .center,
            ),
        ],
      ),
    );
  }
}

enum AppLoadingWidgetSize {
  small(24.0),
  medium(48.0),
  large(72.0);

  // The size property
  final double size;

  // Constructor
  const AppLoadingWidgetSize(this.size);
}
