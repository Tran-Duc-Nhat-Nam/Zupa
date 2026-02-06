import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/core/constants/localization.dart';

part 'app_settings_form.gform.dart';

@Rf()
class AppSettings {
  final AppLocalization localizationMode;

  AppSettings({
    @RfControl() this.localizationMode = AppLocalization.followSystem,
  });
}
