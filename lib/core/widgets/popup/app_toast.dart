import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/styles/text_styles.dart';

abstract class AppToast {
  static void showNotify(
    String message, {
    AppToastType type = AppToastType.info,
  }) {
    final IconData icon = switch (type) {
      .success => Icons.check_circle_outline_rounded,
      .error => Icons.error_outline_rounded,
      .warning => Icons.warning_amber_rounded,
      .info => Icons.info_outline_rounded,
    };

    SmartDialog.show(
      builder: (context) {
        return Container(
          margin: const .all(36),
          padding: const .all(16),
          decoration: BoxDecoration(
            color: ThemeHelper.getColor(context).white,
            borderRadius: .circular(28),
          ),
          child: Column(
            mainAxisSize: .min,
            children: [
              Icon(icon, size: 36, color: ThemeHelper.getColor(context).primary500),
              Text(
                message,
                style: AppTextStyles.bodyMediumMedium.copyWith(
                  color: ThemeHelper.getColor(context).primary500,
                ),
              ),
            ],
          ),
        );
      },
      useAnimation: true,
      animationType: .fade,
      keepSingle: true,
      displayTime: const Duration(seconds: 3),
      alignment: .center,
    );
  }

  static void showToast(String message) {
    SmartDialog.showToast(
      message,
      useAnimation: true,
      animationType: SmartAnimationType.fade,
    );
  }
}

enum AppToastType { success, error, warning, info }
