import 'package:flutter/material.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
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
}
