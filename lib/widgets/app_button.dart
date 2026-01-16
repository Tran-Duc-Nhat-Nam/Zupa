import 'package:flutter/material.dart';
import 'package:zupa/widgets/app_icon.dart';

import 'package:zupa/helper/theme/theme_helper.dart';
import 'package:zupa/common/styles/text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    this.text,
    this.child,
    this.fitContent = false,
    this.padding,
    this.icon,
    this.theme = AppButtonTheme.primary,
    this.color = AppButtonColor.info,
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

    switch (color) {
      case AppButtonColor.success:
        primaryColor = ThemeHelper.getColor(context).success500;
        secondaryColor = ThemeHelper.getColor(context).white;
        primarySurfaceColor = ThemeHelper.getColor(context).success200;
        secondarySurfaceColor = ThemeHelper.getColor(context).success100;
        primarySplashColor = ThemeHelper.getColor(context).success600;
        secondarySplashColor = ThemeHelper.getColor(context).success200;
      case AppButtonColor.warning:
        primaryColor = ThemeHelper.getColor(context).warning600;
        secondaryColor = ThemeHelper.getColor(context).white;
        primarySurfaceColor = ThemeHelper.getColor(context).warning200;
        secondarySurfaceColor = ThemeHelper.getColor(context).warning100;
        primarySplashColor = ThemeHelper.getColor(context).warning600;
        secondarySplashColor = ThemeHelper.getColor(context).warning200;
      case AppButtonColor.error:
        primaryColor = ThemeHelper.getColor(context).error600;
        secondaryColor = ThemeHelper.getColor(context).white;
        primarySurfaceColor = ThemeHelper.getColor(context).error200;
        secondarySurfaceColor = ThemeHelper.getColor(context).error100;
        primarySplashColor = ThemeHelper.getColor(context).error600;
        secondarySplashColor = ThemeHelper.getColor(context).error200;
      case AppButtonColor.info:
        primaryColor = ThemeHelper.getColor(context).primary500;
        secondaryColor = ThemeHelper.getColor(context).white;
        primarySurfaceColor = ThemeHelper.getColor(context).primary200;
        secondarySurfaceColor = ThemeHelper.getColor(context).primary100;
        primarySplashColor = ThemeHelper.getColor(context).blueDark;
        secondarySplashColor = ThemeHelper.getColor(context).primary200;
      case AppButtonColor.basic:
        primaryColor = ThemeHelper.getColor(context).grey900;
        secondaryColor = ThemeHelper.getColor(context).white;
        primarySurfaceColor = ThemeHelper.getColor(context).grey200;
        secondarySurfaceColor = ThemeHelper.getColor(context).grey100;
        primarySplashColor = ThemeHelper.getColor(context).grey1000;
        secondarySplashColor = ThemeHelper.getColor(context).grey200;
    }

    switch (theme) {
      case AppButtonTheme.primary:
        foregroundColor = secondaryColor;
        backgroundColor = primaryColor;
        disabledColor = primarySurfaceColor;
        splashColor = primarySplashColor;
        elevation = 1;
      case AppButtonTheme.secondary:
        backgroundColor = secondarySurfaceColor;
        foregroundColor = primaryColor;
        disabledColor = secondarySurfaceColor;
        splashColor = secondarySplashColor;
        elevation = 0.5;
      case AppButtonTheme.outline:
        backgroundColor = ThemeHelper.getColor(context).white;
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
            StadiumBorder(
              side: BorderSide(color: borderColor ?? Colors.transparent),
            ),
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
