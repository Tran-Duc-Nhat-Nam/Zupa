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
      scaffoldBackgroundColor: scheme.surface,
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
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: scheme.surfaceContainer,
        indicatorColor: scheme.secondaryContainer,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: scheme.onSurface,
            );
          }
          return TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: scheme.onSurfaceVariant,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: scheme.onSecondaryContainer);
          }
          return IconThemeData(color: scheme.onSurfaceVariant);
        }),
      ),
    );
  }

  static ThemeData getTheme({
    required Brightness brightness,
    required AppColorSchemeSource colorSource,
    ColorScheme? dynamicColorScheme,
    Color? customSeedColor,
  }) {
    final isDark = brightness == Brightness.dark;
    AppColors appColors;
    ColorScheme scheme;

    switch (colorSource) {
      case AppColorSchemeSource.materialYou:
        final seed = dynamicColorScheme?.primary ?? brandSeedColor;
        scheme = ColorScheme.fromSeed(
          seedColor: seed,
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
        final seed = isDark ? const Color(0xffCBA6F7) : const Color(0xff8839EF);
        scheme = ColorScheme.fromSeed(
          seedColor: seed,
          brightness: brightness,
        );
        appColors = DynamicAppColors(scheme);
    }

    return _buildTheme(scheme, appColors);
  }
}
