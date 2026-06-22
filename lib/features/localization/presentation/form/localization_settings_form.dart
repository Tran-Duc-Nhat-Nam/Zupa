import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/core/constants/localization.dart';

part 'localization_settings_form.gform.dart';

@Rf()
class LocalizationSettings {
  final AppLocalization localizationMode;

  LocalizationSettings({
    @RfControl() this.localizationMode = AppLocalization.followSystem,
  });
}
