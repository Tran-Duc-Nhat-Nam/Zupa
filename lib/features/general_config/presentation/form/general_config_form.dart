import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/features/general_config/domain/usecases/set/params/set_general_config_params.dart';

part 'general_config_form.gform.dart';

@Rf()
class GeneralConfig {
  final bool isWarning;
  final int? warningThreshold;

  GeneralConfig({
    @RfControl(validators: [RequiredValidator()]) this.isWarning = false,
    @RfControl(validators: [MinValidator(0)]) this.warningThreshold = 0,
  });

  SetGeneralConfigParams toParams() => .new(
    isWarningCapacity: isWarning,
    warningCapacityThreshold: warningThreshold ?? 0,
  );

  factory GeneralConfig.fromParams(SetGeneralConfigParams params) => .new(
    isWarning: params.isWarningCapacity,
    warningThreshold: params.warningCapacityThreshold,
  );
}
