import 'package:camera/camera.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/core/models/vehicle_type.dart';

part 'check_in_form.gform.dart';

@Rf()
class CheckIn {
  final String ticketID;
  final XFile? picture;
  final VehicleType? vehicleType;

  CheckIn({
    @RfControl(validators: [RequiredValidator()]) this.ticketID = '',
    @RfControl(validators: [RequiredValidator()]) this.picture,
    @RfControl(validators: [RequiredValidator()]) this.vehicleType,
  });
}
