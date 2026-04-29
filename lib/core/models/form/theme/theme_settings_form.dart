import 'package:flutter/material.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/core/bloc/usecases/theme/set/params/set_theme_params.dart';
import 'package:zupa/core/styles/theme.dart';

part 'theme_settings_form.gform.dart';

@Rf()
class ThemeSettings {
  final ThemeMode themeMode;
  final AppColorSchemeSource colorSource;
  final int? seedColorValue;

  ThemeSettings({
    @RfControl() this.themeMode = ThemeMode.system,
    @RfControl() this.colorSource = AppColorSchemeSource.brand,
    @RfControl() this.seedColorValue,
  });

  SetThemeParams toParams() => .new(
    themeMode: themeMode,
    colorSource: colorSource,
    seedColorValue: seedColorValue,
  );

  factory ThemeSettings.fromEntity(SetThemeParams entity) => .new(
    themeMode: entity.themeMode,
    colorSource: entity.colorSource,
    seedColorValue: entity.seedColorValue,
  );
}
