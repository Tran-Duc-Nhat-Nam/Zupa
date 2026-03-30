import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'ui_settings_form.gform.dart';

@Rf()
class UISettings {
  final bool isFloatingNavbar;
  final bool isShowNavbarLabel;

  UISettings({
    @RfControl() required this.isFloatingNavbar,
    @RfControl() required this.isShowNavbarLabel,
  });
}
