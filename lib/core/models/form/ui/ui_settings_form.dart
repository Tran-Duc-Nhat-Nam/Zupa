import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/core/bloc/usecases/ui_settings/set/params/set_ui_settings_params.dart';
import 'package:zupa/core/entities/ui_settings_entity.dart';

part 'ui_settings_form.gform.dart';

@Rf()
class UISettings {
  final bool isFloatingNavbar;
  final bool isShowNavbarLabel;
  final bool isGlassmorphism;

  UISettings({
    @RfControl() required this.isFloatingNavbar,
    @RfControl() required this.isShowNavbarLabel,
    @RfControl() required this.isGlassmorphism,
  });

  SetUISettingsParams toParams() => .new(
    isFloatingNavbar: isFloatingNavbar,
    isShowNavbarLabel: isShowNavbarLabel,
    isGlassmorphism: isGlassmorphism,
  );

  factory UISettings.fromEntity(UISettingsEntity entity) => .new(
    isShowNavbarLabel: entity.isShowNavbarLabel,
    isFloatingNavbar: entity.isFloatingNavbar,
    isGlassmorphism: entity.isGlassmorphism,
  );
}
