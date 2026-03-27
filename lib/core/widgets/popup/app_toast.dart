import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:zupa/core/styles/colors.dart';
import 'package:zupa/core/styles/text_styles.dart';

import 'package:zupa/core/bloc/animation/animation_cubit.dart';
import 'package:zupa/core/di/injection.dart';

abstract class AppToast {
  static void showNotify(String message, {AppToastType type = .info}) {
    final icon = switch (type) {
      .success => Symbols.check_circle_outline_rounded,
      .error => Symbols.error_outline_rounded,
      .warning => Symbols.warning_amber_rounded,
      .info => Symbols.info_i_rounded,
    };

    SmartDialog.show(
      builder: (context) {
        final colorScheme = AppColors.of(context);
        return Container(
          margin: const .all(36),
          padding: const .all(16),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHigh,
            borderRadius: .circular(28),
          ),
          child: Column(
            mainAxisSize: .min,
            children: [
              Icon(icon, size: 36, color: colorScheme.primary),
              Text(
                message,
                style: AppTextStyles.bodyMediumMedium.copyWith(
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
        );
      },
      useAnimation: true,
      animationType: .centerScale_otherSlide,
      keepSingle: true,
      displayTime: const Duration(seconds: 3),
      alignment: .center,
      animationTime: getIt<AnimationCubit>().state.maybeWhen(
            loaded: (isOn) => isOn ? null : Duration.zero,
            orElse: () => null,
          ),
    );
  }

  static void showToast(String message) {
    SmartDialog.showToast(
      message,
      useAnimation: true,
      animationType: .fade,
      animationTime: getIt<AnimationCubit>().state.maybeWhen(
            loaded: (isOn) => isOn ? null : Duration.zero,
            orElse: () => null,
          ),
    );
  }
}

enum AppToastType { success, error, warning, info }
