import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/core/entities/vehicle_type_entity.dart';
import 'package:zupa/features/member_vehicles/domain/entities/member_vehicle_entity.dart';

part 'member_vehicle_detail_form.gform.dart';

@Rf()
class MemberVehicleDetail {
  final String id;
  final String name;
  final String phoneNumber;
  final String licenseNumber;
  final String branch;
  final VehicleTypeEntity? vehicleType;
  final String ticketID;
  final Duration expiredIn;
  final int price;

  MemberVehicleDetail({
    this.id = '',
    @RfControl(validators: [RequiredValidator()]) this.name = '',
    @RfControl(validators: [RequiredValidator()]) this.phoneNumber = '',
    @RfControl(validators: [RequiredValidator()]) this.licenseNumber = '',
    @RfControl(validators: [RequiredValidator()]) this.branch = '',
    @RfControl(validators: [RequiredValidator()]) this.vehicleType,
    @RfControl(validators: [RequiredValidator()]) this.ticketID = '',
    @RfControl(validators: [RequiredValidator()])
    this.expiredIn = const Duration(days: 30),
    @RfControl(validators: [RequiredValidator()]) this.price = 0,
  });

  MemberVehicleEntity toEntity() => .inital(
    id: id,
    name: name,
    phoneNumber: phoneNumber,
    licenseNumber: licenseNumber,
    parkingLotId: branch,
    vehicleType: vehicleType,
    cardId: ticketID,
    expiredIn: expiredIn.inSeconds,
    price: price,
  );
}
