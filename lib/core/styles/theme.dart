import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zupa/core/styles/colors.dart';

enum AppThemeMode { light, dark, system }

enum AppColorSchemeSource { brand, custom, materialYou }

class AppThemes {
  AppThemes._();

  static const _iconTheme = IconThemeData(
    fill: 0,
    weight: 600,
    opticalSize: 48,
  );

  static const Color brandSeedColor = Color(0xFF6750A4);

  /// Helper to build a base theme configuration to keep code DRY
  static ThemeData _buildTheme(ColorScheme scheme, AppColors appColors) {
    return ThemeData(
      useMaterial3: true,
      brightness: scheme.brightness,
      colorScheme: scheme,
      textTheme: GoogleFonts.interTextTheme(
        scheme.brightness == Brightness.dark
            ? ThemeData.dark().textTheme
            : ThemeData.light().textTheme,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      iconTheme: _iconTheme,
      extensions: [appColors],
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        centerTitle: false,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  static ThemeData getTheme({
    required Brightness brightness,
    required AppColorSchemeSource colorSource,
    ColorScheme? dynamicColorScheme,
    Color? customSeedColor,
  }) {
    ColorScheme scheme;
    AppColors appColors;

    final isDark = brightness == Brightness.dark;

    switch (colorSource) {
      case AppColorSchemeSource.materialYou:
        scheme =
            dynamicColorScheme ??
            ColorScheme.fromSeed(
              seedColor: brandSeedColor,
              brightness: brightness,
            );
        appColors = DynamicAppColors(scheme);
      case AppColorSchemeSource.custom:
        scheme = ColorScheme.fromSeed(
          seedColor: customSeedColor ?? brandSeedColor,
          brightness: brightness,
        );
        appColors = DynamicAppColors(scheme);
      case AppColorSchemeSource.brand:
        appColors = isDark ? const DarkAppColors() : const LightAppColors();
        scheme = ColorScheme.fromSeed(
          seedColor: isDark ? const DarkAppColors().primary : const LightAppColors().primary,
          brightness: brightness,
        );
    }

    return _buildTheme(scheme, appColors);
  }
}
