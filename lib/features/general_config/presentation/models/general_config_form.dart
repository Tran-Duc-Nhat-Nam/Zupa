import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'general_config_form.gform.dart';

@Rf()
class GeneralConfig {
  final bool isWarning;
  final int warningThreshold;

  GeneralConfig({
    @RfControl() this.isWarning = false,
    @RfControl(validators: [MinValidator(0)]) this.warningThreshold = 0,
  });
}
