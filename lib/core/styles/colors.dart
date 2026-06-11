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

  /// Factory for the Light Theme
  factory AppColors.light() => const _AppColorsImpl(
    primary: .new(0xff8839EF),
    onPrimary: Colors.white,
    primaryContainer: .new(0xffF3EBFE),
    onPrimaryContainer: .new(0xff8839EF),
    secondary: .new(0xff7287FD),
    onSecondary: Colors.white,
    secondaryContainer: .new(0xffE1E6FF),
    onSecondaryContainer: .new(0xff7287FD),
    tertiary: .new(0xff04A5E5),
    onTertiary: Colors.white,
    tertiaryContainer: .new(0xffD9F1FB),
    onTertiaryContainer: .new(0xff04A5E5),
    error: .new(0xffD20F39),
    onError: Colors.white,
    errorContainer: .new(0xffFBE7EB),
    onErrorContainer: .new(0xffD20F39),
    success: .new(0xff40A02B),
    onSuccess: Colors.white,
    warning: .new(0xffDF8E1D),
    onWarning: Colors.white,
    surface: .new(0xffEFF1F5),
    onSurface: .new(0xff4C4F69),
    onSurfaceVariant: .new(0xff7C7F93),
    outline: .new(0xffACB0BE),
    outlineVariant: .new(0xffCCD0DA),
    surfaceContainerLowest: Colors.white,
    surfaceContainerLow: .new(0xffF9FAFB),
    surfaceContainer: .new(0xffF3F4F6),
    surfaceContainerHigh: .new(0xffE5E7EB),
    surfaceContainerHighest: .new(0xffD1D5DB),
    inverseSurface: .new(0xff2F2F3F),
    onInverseSurface: .new(0xffF5F5F5),
    inversePrimary: .new(0xffCEAFF9),
    shadow: Colors.black,
    scrim: Colors.black,
  );

  /// Factory for the Dark Theme
  factory AppColors.dark() => const _AppColorsImpl(
    primary: .new(0xffCBA6F7),
    onPrimary: .new(0xff3E0077),
    primaryContainer: .new(0xff5C3A86),
    onPrimaryContainer: .new(0xffE6D7FC),
    secondary: .new(0xffB4BEFE),
    onSecondary: .new(0xff20295B),
    secondaryContainer: .new(0xff3E4461),
    onSecondaryContainer: .new(0xffB4BEFE),
    tertiary: .new(0xff89DCEB),
    onTertiary: .new(0xff00353D),
    tertiaryContainer: .new(0xff204E55),
    onTertiaryContainer: .new(0xff89DCEB),
    error: .new(0xffF38BA8),
    onError: .new(0xff680016),
    errorContainer: .new(0xff513142),
    onErrorContainer: .new(0xffF38BA8),
    success: .new(0xffA6E3A1),
    onSuccess: .new(0xff00390A),
    warning: .new(0xffFAB387),
    onWarning: .new(0xff452700),
    surface: .new(0xff181825),
    onSurface: .new(0xffCDD6F4),
    onSurfaceVariant: .new(0xff9399B2),
    outline: .new(0xff585B70),
    outlineVariant: .new(0xff45475A),
    surfaceContainerLowest: .new(0xff0F0F1A),
    surfaceContainerLow: .new(0xff1E1E2E),
    surfaceContainer: .new(0xff252539),
    surfaceContainerHigh: .new(0xff2B2B40),
    surfaceContainerHighest: .new(0xff36364D),
    inverseSurface: .new(0xffE6EAF0),
    onInverseSurface: .new(0xff11111B),
    inversePrimary: .new(0xff8839EF),
    shadow: Colors.black,
    scrim: Colors.black,
  );

  /// Factory for Dynamic Color (Material You)
  factory AppColors.fromColorScheme(ColorScheme scheme) {
    return _AppColorsImpl(
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
      success: const Color(0xff40A02B).harmonizeWith(scheme.primary),
      onSuccess: Colors.white,
      warning: const Color(0xffDF8E1D).harmonizeWith(scheme.primary),
      onWarning: Colors.white,
      surface: scheme.surface,
      onSurface: scheme.onSurface,
      onSurfaceVariant: scheme.onSurfaceVariant,
      outline: scheme.outline,
      outlineVariant: scheme.outlineVariant,
      // CorePalette Logic
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
  }

  static Color _getTonalColor(ColorScheme scheme, int lightTone, int darkTone) {
    final hct = Hct.fromInt(scheme.surface.toARGB32());
    return .new(
      TonalPalette.of(
        hct.hue,
        hct.chroma,
      ).get(scheme.brightness == .dark ? darkTone : lightTone),
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return _AppColorsImpl(
      primary: .lerp(primary, other.primary, t)!,
      onPrimary: .lerp(onPrimary, other.onPrimary, t)!,
      primaryContainer: .lerp(primaryContainer, other.primaryContainer, t)!,
      onPrimaryContainer: .lerp(
        onPrimaryContainer,
        other.onPrimaryContainer,
        t,
      )!,
      secondary: .lerp(secondary, other.secondary, t)!,
      onSecondary: .lerp(onSecondary, other.onSecondary, t)!,
      secondaryContainer: .lerp(
        secondaryContainer,
        other.secondaryContainer,
        t,
      )!,
      onSecondaryContainer: .lerp(
        onSecondaryContainer,
        other.onSecondaryContainer,
        t,
      )!,
      tertiary: .lerp(tertiary, other.tertiary, t)!,
      onTertiary: .lerp(onTertiary, other.onTertiary, t)!,
      tertiaryContainer: .lerp(tertiaryContainer, other.tertiaryContainer, t)!,
      onTertiaryContainer: .lerp(
        onTertiaryContainer,
        other.onTertiaryContainer,
        t,
      )!,
      error: .lerp(error, other.error, t)!,
      onError: .lerp(onError, other.onError, t)!,
      errorContainer: .lerp(errorContainer, other.errorContainer, t)!,
      onErrorContainer: .lerp(onErrorContainer, other.onErrorContainer, t)!,
      success: .lerp(success, other.success, t)!,
      onSuccess: .lerp(onSuccess, other.onSuccess, t)!,
      warning: .lerp(warning, other.warning, t)!,
      onWarning: .lerp(onWarning, other.onWarning, t)!,
      surface: .lerp(surface, other.surface, t)!,
      onSurface: .lerp(onSurface, other.onSurface, t)!,
      onSurfaceVariant: .lerp(onSurfaceVariant, other.onSurfaceVariant, t)!,
      outline: .lerp(outline, other.outline, t)!,
      outlineVariant: .lerp(outlineVariant, other.outlineVariant, t)!,
      surfaceContainerLowest: .lerp(
        surfaceContainerLowest,
        other.surfaceContainerLowest,
        t,
      )!,
      surfaceContainerLow: .lerp(
        surfaceContainerLow,
        other.surfaceContainerLow,
        t,
      )!,
      surfaceContainer: .lerp(surfaceContainer, other.surfaceContainer, t)!,
      surfaceContainerHigh: .lerp(
        surfaceContainerHigh,
        other.surfaceContainerHigh,
        t,
      )!,
      surfaceContainerHighest: .lerp(
        surfaceContainerHighest,
        other.surfaceContainerHighest,
        t,
      )!,
      inverseSurface: .lerp(inverseSurface, other.inverseSurface, t)!,
      onInverseSurface: .lerp(onInverseSurface, other.onInverseSurface, t)!,
      inversePrimary: .lerp(inversePrimary, other.inversePrimary, t)!,
      shadow: .lerp(shadow, other.shadow, t)!,
      scrim: .lerp(scrim, other.scrim, t)!,
    );
  }
}

extension ThemeContext on BuildContext {
  AppColors get colorScheme => Theme.of(this).extension<AppColors>() ?? .dark();
}

class _AppColorsImpl extends AppColors {
  const _AppColorsImpl({
    required super.primary,
    required super.onPrimary,
    required super.primaryContainer,
    required super.onPrimaryContainer,
    required super.secondary,
    required super.onSecondary,
    required super.secondaryContainer,
    required super.onSecondaryContainer,
    required super.tertiary,
    required super.onTertiary,
    required super.tertiaryContainer,
    required super.onTertiaryContainer,
    required super.error,
    required super.onError,
    required super.errorContainer,
    required super.onErrorContainer,
    required super.success,
    required super.onSuccess,
    required super.warning,
    required super.onWarning,
    required super.surface,
    required super.onSurface,
    required super.onSurfaceVariant,
    required super.outline,
    required super.outlineVariant,
    required super.surfaceContainerLowest,
    required super.surfaceContainerLow,
    required super.surfaceContainer,
    required super.surfaceContainerHigh,
    required super.surfaceContainerHighest,
    required super.inverseSurface,
    required super.onInverseSurface,
    required super.inversePrimary,
    required super.shadow,
    required super.scrim,
  });

  @override
  _AppColorsImpl copyWith() => this; // Add parameters here if you need manual overrides
}
