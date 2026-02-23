import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zupa/core/styles/colors.dart';

class AppThemes {
  // Use a private constructor to prevent instantiation
  AppThemes._();

  static const _iconTheme = IconThemeData(
    fill: 0,
    weight: 600,
    opticalSize: 48,
  );

  static ThemeData lightTheme(AppColors colors) {
    final scheme = ColorScheme.fromSeed(
      seedColor: colors.primary500,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: scheme,
      textTheme: GoogleFonts.interTextTheme(), // Maps all text styles correctly
      visualDensity: VisualDensity.adaptivePlatformDensity,
      iconTheme: _iconTheme,
      useSystemColors: true,
      // Define specific component behaviors
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

  static ThemeData darkTheme(DarkAppColors colors) {
    final scheme = ColorScheme.fromSeed(
      seedColor: colors.primary500,
      brightness: .dark,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: .dark,
      colorScheme: scheme,
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
      visualDensity: .adaptivePlatformDensity,
      iconTheme: _iconTheme,
      useSystemColors: true,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        elevation: 0,
      ),
    );
  }
}

enum AppThemeMode { light, dark, followSystem }