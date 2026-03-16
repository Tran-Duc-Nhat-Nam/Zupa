import 'package:zupa/core/entities/vehicle_type_entity.dart';

class ParkingLotCapacityEntity {
  ParkingLotCapacityEntity({
    required this.vehicleType,
    required this.capacity,
    required this.available,
  });

  final VehicleTypeEntity vehicleType;
  final int capacity;
  final int available;
}
