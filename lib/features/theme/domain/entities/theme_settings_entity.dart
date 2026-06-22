import 'package:flutter/material.dart';
import 'package:zupa/core/styles/theme.dart';

class ThemeSettingsEntity {
  final ThemeMode themeMode;
  final AppColorSchemeSource colorSource;
  final int? seedColorValue;

  const ThemeSettingsEntity({
    this.themeMode = .system,
    this.colorSource = .brand,
    this.seedColorValue,
  });
}
