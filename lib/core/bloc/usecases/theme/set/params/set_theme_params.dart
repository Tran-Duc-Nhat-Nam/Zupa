import 'package:flutter/material.dart';
import 'package:zupa/core/styles/theme.dart';

class SetThemeParams {
  const SetThemeParams({
    required this.themeMode,
    required this.colorSource,
    this.seedColorValue,
  });

  factory SetThemeParams.initial({
    ThemeMode? themeMode,
    AppColorSchemeSource? colorSource,
    int? seedColorValue,
  }) => .new(
    themeMode: themeMode ?? .system,
    colorSource: colorSource ?? .brand,
    seedColorValue: seedColorValue,
  );

  final ThemeMode themeMode;
  final AppColorSchemeSource colorSource;
  final int? seedColorValue;
}
