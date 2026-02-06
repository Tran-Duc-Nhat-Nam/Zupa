import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/core/models/vehicle_type.dart';

part 'member_vehicle_detail_form.gform.dart';

@Rf()
class MemberVehicleDetail {
  final String name;
  final String phoneNumber;
  final String licenseNumber;
  final String branch;
  final VehicleType? vehicleType;
  final String ticketID;
  final Duration expiredIn;

  MemberVehicleDetail({
    @RfControl(validators: [RequiredValidator()]) this.name = '',
    @RfControl(validators: [RequiredValidator()]) this.phoneNumber = '',
    @RfControl(validators: [RequiredValidator()]) this.licenseNumber = '',
    @RfControl(validators: [RequiredValidator()]) this.branch = '',
    @RfControl(validators: [RequiredValidator()]) this.vehicleType,
    @RfControl(validators: [RequiredValidator()]) this.ticketID = '',
    @RfControl(validators: [RequiredValidator()]) this.expiredIn = const Duration(days: 30),
  });
}
