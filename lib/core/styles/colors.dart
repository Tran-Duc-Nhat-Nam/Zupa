import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:material_color_utilities/hct/hct.dart';
import 'package:material_color_utilities/palettes/tonal_palette.dart';

abstract class AppColors extends ThemeExtension<AppColors> {
  // Brand & Accent Roles
  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;

  // Semantic Roles
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color success;
  final Color onSuccess;
  final Color warning;
  final Color onWarning;

  // Surface & Neutral Roles
  final Color surface;
  final Color onSurface;
  final Color onSurfaceVariant; // Used for subtext and medium-emphasis icons
  final Color outline; // Used for borders
  final Color outlineVariant; // Used for dividers

  // Surface Containers (Replacement for old shaded scales)
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;

  // Inverse Roles (Used for Snackbars/High-contrast)
  final Color inverseSurface;
  final Color onInverseSurface;
  final Color inversePrimary;

  // Utilities
  final Color shadow;
  final Color scrim;

  const AppColors({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.success,
    required this.onSuccess,
    required this.warning,
    required this.onWarning,
    required this.surface,
    required this.onSurface,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
    required this.inverseSurface,
    required this.onInverseSurface,
    required this.inversePrimary,
    required this.shadow,
    required this.scrim,
  });

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    // We use Color.lerp for all fields to ensure smooth transitions
    return DynamicAppColors(
      ColorScheme.lerp(_toColorScheme(this), _toColorScheme(other), t),
      success: Color.lerp(success, other.success, t),
      warning: Color.lerp(warning, other.warning, t),
    );
  }

  static ColorScheme _toColorScheme(AppColors c) {
    return ColorScheme(
      brightness: c.surface.computeLuminance() > 0.5
          ? Brightness.light
          : Brightness.dark,
      primary: c.primary,
      onPrimary: c.onPrimary,
      primaryContainer: c.primaryContainer,
      onPrimaryContainer: c.onPrimaryContainer,
      secondary: c.secondary,
      onSecondary: c.onSecondary,
      secondaryContainer: c.secondaryContainer,
      onSecondaryContainer: c.onSecondaryContainer,
      tertiary: c.tertiary,
      onTertiary: c.onTertiary,
      tertiaryContainer: c.tertiaryContainer,
      onTertiaryContainer: c.onTertiaryContainer,
      error: c.error,
      onError: c.onError,
      errorContainer: c.errorContainer,
      onErrorContainer: c.onErrorContainer,
      surface: c.surface,
      onSurface: c.onSurface,
      outline: c.outline,
      outlineVariant: c.outlineVariant,
      shadow: c.shadow,
      scrim: c.scrim,
      inverseSurface: c.inverseSurface,
      onInverseSurface: c.onInverseSurface,
      inversePrimary: c.inversePrimary,
      surfaceContainerLowest: c.surfaceContainerLowest,
      surfaceContainerLow: c.surfaceContainerLow,
      surfaceContainer: c.surfaceContainer,
      surfaceContainerHigh: c.surfaceContainerHigh,
      surfaceContainerHighest: c.surfaceContainerHighest,
    );
  }

  static AppColors of(BuildContext context) {
    return Theme.of(context).extension<AppColors>() ?? const LightAppColors();
  }
}

class LightAppColors extends AppColors {
  const LightAppColors()
    : super(
        primary: const Color(0xff8839EF),
        onPrimary: Colors.white,
        primaryContainer: const Color(0xffF3EBFE),
        onPrimaryContainer: const Color(0xff8839EF),
        secondary: const Color(0xff7287FD),
        onSecondary: Colors.white,
        secondaryContainer: const Color(0xffE1E6FF),
        onSecondaryContainer: const Color(0xff7287FD),
        tertiary: const Color(0xff04A5E5),
        onTertiary: Colors.white,
        tertiaryContainer: const Color(0xffD9F1FB),
        onTertiaryContainer: const Color(0xff04A5E5),
        error: const Color(0xffD20F39),
        onError: Colors.white,
        errorContainer: const Color(0xffFBE7EB),
        onErrorContainer: const Color(0xffD20F39),
        success: const Color(0xff40A02B),
        onSuccess: Colors.white,
        warning: const Color(0xffDF8E1D),
        onWarning: Colors.white,
        surface: const Color(0xffEFF1F5),
        onSurface: const Color(0xff4C4F69),
        onSurfaceVariant: const Color(0xff7C7F93),
        outline: const Color(0xffACB0BE),
        outlineVariant: const Color(0xffCCD0DA),
        surfaceContainerLowest: Colors.white,
        surfaceContainerLow: const Color(0xffF9FAFB),
        surfaceContainer: const Color(0xffF3F4F6),
        surfaceContainerHigh: const Color(0xffE5E7EB),
        surfaceContainerHighest: const Color(0xffD1D5DB),
        inverseSurface: const Color(0xff2F2F3F),
        onInverseSurface: const Color(0xffF5F5F5),
        inversePrimary: const Color(0xffCEAFF9),
        shadow: Colors.black,
        scrim: Colors.black,
      );

  @override
  LightAppColors copyWith() => this;
}

class DarkAppColors extends AppColors {
  const DarkAppColors()
    : super(
        primary: const Color(0xffCBA6F7),
        onPrimary: const Color(0xff3E0077),
        primaryContainer: const Color(0xff5C3A86),
        onPrimaryContainer: const Color(0xffE6D7FC),
        secondary: const Color(0xffB4BEFE),
        onSecondary: const Color(0xff20295B),
        secondaryContainer: const Color(0xff3E4461),
        onSecondaryContainer: const Color(0xffB4BEFE),
        tertiary: const Color(0xff89DCEB),
        onTertiary: const Color(0xff00353D),
        tertiaryContainer: const Color(0xff204E55),
        onTertiaryContainer: const Color(0xff89DCEB),
        error: const Color(0xffF38BA8),
        onError: const Color(0xff680016),
        errorContainer: const Color(0xff513142),
        onErrorContainer: const Color(0xffF38BA8),
        success: const Color(0xffA6E3A1),
        onSuccess: const Color(0xff00390A),
        warning: const Color(0xffFAB387),
        onWarning: const Color(0xff452700),
        surface: const Color(0xff181825),
        onSurface: const Color(0xffCDD6F4),
        onSurfaceVariant: const Color(0xff9399B2),
        outline: const Color(0xff585B70),
        outlineVariant: const Color(0xff45475A),
        surfaceContainerLowest: const Color(0xff0F0F1A),
        surfaceContainerLow: const Color(0xff1E1E2E),
        surfaceContainer: const Color(0xff252539),
        surfaceContainerHigh: const Color(0xff2B2B40),
        surfaceContainerHighest: const Color(0xff36364D),
        inverseSurface: const Color(0xffE6EAF0),
        onInverseSurface: const Color(0xff11111B),
        inversePrimary: const Color(0xff8839EF),
        shadow: Colors.black,
        scrim: Colors.black,
      );

  @override
  DarkAppColors copyWith() => this;
}

class DynamicAppColors extends AppColors {
  DynamicAppColors(ColorScheme scheme, {Color? success, Color? warning})
    : super(
        primary: scheme.primary,
        onPrimary: scheme.onPrimary,
        primaryContainer: scheme.primaryContainer,
        onPrimaryContainer: scheme.onPrimaryContainer,
        secondary: scheme.secondary,
        onSecondary: scheme.onSecondary,
        secondaryContainer: scheme.secondaryContainer,
        onSecondaryContainer: scheme.onSecondaryContainer,
        tertiary: scheme.tertiary,
        onTertiary: scheme.onTertiary,
        tertiaryContainer: scheme.tertiaryContainer,
        onTertiaryContainer: scheme.onTertiaryContainer,
        error: scheme.error,
        onError: scheme.onError,
        errorContainer: scheme.errorContainer,
        onErrorContainer: scheme.onErrorContainer,

        // Semantic harmonization
        success: (success ?? const Color(0xff40A02B)).harmonizeWith(
          scheme.primary,
        ),
        onSuccess: Colors.white,
        warning: (warning ?? const Color(0xffDF8E1D)).harmonizeWith(
          scheme.primary,
        ),
        onWarning: Colors.white,

        surface: scheme.surface,
        onSurface: scheme.onSurface,
        onSurfaceVariant: scheme.onSurfaceVariant,
        outline: scheme.outline,
        outlineVariant: scheme.outlineVariant,

        // Logic for Surface Containers using CorePalette
        surfaceContainerLowest: _getTonalColor(scheme, 100, 4),
        surfaceContainerLow: _getTonalColor(scheme, 96, 10),
        surfaceContainer: _getTonalColor(scheme, 94, 12),
        surfaceContainerHigh: _getTonalColor(scheme, 92, 17),
        surfaceContainerHighest: _getTonalColor(scheme, 90, 22),

        inverseSurface: scheme.inverseSurface,
        onInverseSurface: scheme.onInverseSurface,
        inversePrimary: scheme.inversePrimary,
        shadow: scheme.shadow,
        scrim: scheme.scrim,
      );

  static Color _getTonalColor(ColorScheme scheme, int lightTone, int darkTone) {
    final bool isDark = scheme.brightness == .dark;
    final targetTone = isDark ? darkTone.toInt() : lightTone.toInt();

    final hct = Hct.fromInt(scheme.surface.toARGB32());
    final TonalPalette neutralPalette = TonalPalette.of(hct.hue, hct.chroma);
    return Color(neutralPalette.get(targetTone).toInt());
  }

  @override
  DynamicAppColors copyWith() => this;
}
