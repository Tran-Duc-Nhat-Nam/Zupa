import 'package:flutter/material.dart';
import 'package:zupa/core/widgets/app_icon.dart';

import 'package:zupa/core/helper/theme/theme_helper.dart';
import 'package:zupa/core/styles/text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    this.text,
    this.child,
    this.fitContent = false,
    this.padding,
    this.icon,
    this.theme = .primary,
    this.color = .info,
    this.radius,
    this.shape,
    this.iconPath,
    this.height,
  });

  final void Function()? onPressed;
  final String? text;
  final Widget? child;
  final Widget? icon;
  final String? iconPath;
  final bool fitContent;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? radius;
  final ShapeBorder? shape;
  final AppButtonTheme theme;
  final AppButtonColor color;

  @override
  Widget build(BuildContext context) {
    Color primaryColor;
    Color? secondaryColor;
    Color primarySurfaceColor;
    Color? secondarySurfaceColor;
    Color primarySplashColor;
    Color secondarySplashColor;
    Color splashColor;
    Color? borderColor;
    Color backgroundColor;
    Color foregroundColor;
    Color disabledColor;
    double elevation = 0;

    final colorScheme = ThemeHelper.getColor(context);

    switch (color) {
      case AppButtonColor.success:
        primaryColor = colorScheme.success500;
        secondaryColor = colorScheme.white;
        primarySurfaceColor = colorScheme.success200;
        secondarySurfaceColor = colorScheme.success100;
        primarySplashColor = colorScheme.success600;
        secondarySplashColor = colorScheme.success200;
      case AppButtonColor.warning:
        primaryColor = colorScheme.warning600;
        secondaryColor = colorScheme.white;
        primarySurfaceColor = colorScheme.warning200;
        secondarySurfaceColor = colorScheme.warning100;
        primarySplashColor = colorScheme.warning600;
        secondarySplashColor = colorScheme.warning200;
      case AppButtonColor.error:
        primaryColor = colorScheme.error600;
        secondaryColor = colorScheme.white;
        primarySurfaceColor = colorScheme.error200;
        secondarySurfaceColor = colorScheme.error100;
        primarySplashColor = colorScheme.error600;
        secondarySplashColor = colorScheme.error200;
      case AppButtonColor.info:
        primaryColor = colorScheme.primary500;
        secondaryColor = colorScheme.white;
        primarySurfaceColor = colorScheme.primary200;
        secondarySurfaceColor = colorScheme.primary100;
        primarySplashColor = colorScheme.blueDark;
        secondarySplashColor = colorScheme.primary200;
      case AppButtonColor.basic:
        primaryColor = colorScheme.grey900;
        secondaryColor = colorScheme.white;
        primarySurfaceColor = colorScheme.grey200;
        secondarySurfaceColor = colorScheme.grey100;
        primarySplashColor = colorScheme.grey1000;
        secondarySplashColor = colorScheme.grey200;
    }

    switch (theme) {
      case .primary:
        foregroundColor = secondaryColor;
        backgroundColor = primaryColor;
        disabledColor = primarySurfaceColor;
        splashColor = primarySplashColor;
        elevation = 1;
      case .secondary:
        backgroundColor = secondarySurfaceColor;
        foregroundColor = primaryColor;
        disabledColor = secondarySurfaceColor;
        splashColor = secondarySplashColor;
        elevation = 0.5;
      case .outline:
        backgroundColor = colorScheme.white;
        foregroundColor = primaryColor;
        borderColor = primarySurfaceColor;
        disabledColor = secondarySurfaceColor;
        splashColor = secondarySplashColor;
    }

    return ButtonTheme(
      height: height ?? 36,
      minWidth: 0,
      child: MaterialButton(
        onPressed: onPressed,
        disabledColor: disabledColor,
        color: backgroundColor,
        splashColor: splashColor,
        padding: padding ?? const .all(10),
        shape:
            shape ??
            StadiumBorder(side: .new(color: borderColor ?? Colors.transparent)),
        elevation: elevation,
        minWidth: fitContent ? null : .infinity,
        child:
            child ??
            Row(
              mainAxisAlignment: .center,
              spacing: 8,
              children: [
                if (icon != null || iconPath != null)
                  icon ?? AppIcon(path: iconPath!, color: foregroundColor),
                if (text != null)
                  Text(
                    text!,
                    style: AppTextStyles.bodyLargeSemibold.copyWith(
                      color: foregroundColor,
                    ),
                  ),
              ],
            ),
      ),
    );
  }
}

enum AppButtonTheme { primary, secondary, outline }

enum AppButtonColor { basic, info, success, warning, error }
