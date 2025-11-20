import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:catppuccin_flutter/catppuccin_flutter.dart';

import 'colors.dart';

final appTheme = ThemeData(
  colorScheme: .fromSeed(
    seedColor: const AppColors().primary500,
  ),
  fontFamily: GoogleFonts.inter().fontFamily,
  useMaterial3: true,
  brightness: .light,
  visualDensity: .adaptivePlatformDensity,
  useSystemColors: true,
);

final appDarkTheme = ThemeData(
  colorScheme: .fromSeed(
    brightness: .dark,
    seedColor: catppuccin.mocha.mauve,
    surface: catppuccin.mocha.base,
  ),
  fontFamily: GoogleFonts.inter().fontFamily,
  useMaterial3: true,
  brightness: .dark,
  visualDensity: .adaptivePlatformDensity,
  useSystemColors: true,
);