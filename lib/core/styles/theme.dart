import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zupa/core/styles/colors.dart';

enum AppColorSchemeSource { brand, custom, materialYou }

class AppThemes {
  AppThemes._();

  static const _iconTheme = IconThemeData(
    fill: 0,
    weight: 600,
    opticalSize: 48,
  );

  static const Color brandSeedColor = Color(0xFF6750A4);

  static ThemeData _buildTheme(ColorScheme scheme, AppColors appColors) {
    return .new(
      useMaterial3: true,
      colorScheme: scheme,
      textTheme: GoogleFonts.interTextTheme(
        scheme.brightness == .dark
            ? ThemeData.dark().textTheme
            : ThemeData.light().textTheme,
      ),
      visualDensity: .adaptivePlatformDensity,
      iconTheme: _iconTheme,
      extensions: [appColors],
      appBarTheme: const AppBarTheme(centerTitle: false, elevation: 0),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: .circular(12)),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        // Now works! surfaceContainer won't just be the base surface color anymore.
        backgroundColor: scheme.surfaceContainer,
        indicatorColor: scheme.secondaryContainer,
        labelTextStyle: .resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(
              fontSize: 12,
              fontWeight: .w600,
              color: scheme.onSurface,
            );
          }
          return TextStyle(
            fontSize: 12,
            fontWeight: .w500,
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
    final Color seedColor = switch (colorSource) {
      .materialYou => dynamicColorScheme?.primary ?? brandSeedColor,
      .custom => customSeedColor ?? brandSeedColor,
      .brand => brandSeedColor,
    };

    final scheme = colorSource == .materialYou && dynamicColorScheme != null
        ? dynamicColorScheme
        : ColorScheme.fromSeed(seedColor: seedColor, brightness: brightness);

    final appColors = DynamicAppColors(scheme);
    return _buildTheme(scheme, appColors);
  }
}
