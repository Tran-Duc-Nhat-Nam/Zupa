import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zupa/core/styles/colors.dart';

final appTheme = ThemeData(
  colorScheme: .fromSeed(seedColor: const AppColors().primary500),
  fontFamily: GoogleFonts.inter().fontFamily,
  useMaterial3: true,
  brightness: .light,
  visualDensity: .adaptivePlatformDensity,
  useSystemColors: true,
  iconTheme: const IconThemeData(fill: 0, weight: 600, opticalSize: 48),
);

final appDarkTheme = ThemeData(
  colorScheme: .fromSeed(
    brightness: .dark,
    seedColor: const DarkAppColors().primary500,
  ),
  fontFamily: GoogleFonts.inter().fontFamily,
  useMaterial3: true,
  brightness: .dark,
  visualDensity: .adaptivePlatformDensity,
  useSystemColors: true,
  iconTheme: const IconThemeData(fill: 0, weight: 600, opticalSize: 48),
);

enum AppThemeMode { light, dark, followSystem }
