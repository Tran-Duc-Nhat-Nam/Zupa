import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

final appTheme = ThemeData(
  colorScheme: .fromSeed(seedColor: const AppColors().primary500),
  fontFamily: GoogleFonts.inter().fontFamily,
  useMaterial3: true,
  brightness: .light,
  visualDensity: .adaptivePlatformDensity,
  useSystemColors: true,
);

final appDarkTheme = ThemeData(
  colorScheme: .fromSeed(
    brightness: .dark,
    seedColor: const AppColors().primary500,
  ),
  fontFamily: GoogleFonts.inter().fontFamily,
  useMaterial3: true,
  brightness: .dark,
  visualDensity: .adaptivePlatformDensity,
  useSystemColors: true,
);
