import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/core/models/vehicle_type.dart';

part 'parking_lot_detail_form.gform.dart';

@Rf()
class ParkingLotDetail {
  final String branchName;
  final String address;
  final List<ParkingLotCapacity> capacity;
  final bool isLocked;

  ParkingLotDetail({
    @RfControl(validators: [RequiredValidator()]) this.branchName = '',
    @RfControl(validators: [RequiredValidator()]) this.address = '',
    @RfArray(validators: [RequiredValidator()]) this.capacity = const [],
    @RfControl(validators: [RequiredValidator()]) this.isLocked = false,
  });
}

@RfGroup()
class ParkingLotCapacity {
  final String capacity;
  final VehicleType vehicleType;

  ParkingLotCapacity({
    @RfControl(validators: [RequiredValidator(), MinValidator(0)]) this.capacity = '',
    @RfControl(validators: [RequiredValidator()])required this.vehicleType,
  });
}

