import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:catppuccin_flutter/catppuccin_flutter.dart';

import 'colors.dart';

ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const AppColors().primary500,
  ),
  fontFamily: GoogleFonts.inter().fontFamily,
  useMaterial3: true,
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  useSystemColors: true,
);

ThemeData appDarkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: catppuccin.mocha.mauve,
    surface: catppuccin.mocha.base,
  ),
  fontFamily: GoogleFonts.inter().fontFamily,
  useMaterial3: true,
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  useSystemColors: true,
);