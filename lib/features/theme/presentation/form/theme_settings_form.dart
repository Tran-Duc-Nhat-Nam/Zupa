import 'package:flutter/material.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/core/styles/theme.dart';
import 'package:zupa/features/theme/domain/entities/theme_settings_entity.dart';
import 'package:zupa/features/theme/domain/usecases/set/params/set_theme_params.dart';

part 'theme_settings_form.gform.dart';

@Rf()
class ThemeSettings {
  final ThemeMode themeMode;
  final AppColorSchemeSource colorSource;
  final int? seedColorValue;

  const ThemeSettings({
    @RfControl() required this.themeMode,
    @RfControl() required this.colorSource,
    @RfControl() this.seedColorValue,
  });

  SetThemeParams toParams() => .new(
    themeMode: themeMode,
    colorSource: colorSource,
    seedColorValue: seedColorValue,
  );

  factory ThemeSettings.fromEntity(ThemeSettingsEntity entity) => .new(
    themeMode: entity.themeMode,
    colorSource: entity.colorSource,
    seedColorValue: entity.seedColorValue,
  );
}
