import 'package:zupa/core/entities/vehicle_type_entity.dart';
import 'package:zupa/features/parking/domain/entities/parking_lot_capacity_entity.dart';

class ParkingLotEntity  {
  ParkingLotEntity({required this.id, required this.name, required this.address, required this.capacity, required this.vehicleType, required this.isLocked});
  final String id;
  final String name;
  final String address;
  final List<ParkingLotCapacityEntity> capacity;
  final VehicleTypeEntity vehicleType;
  final bool isLocked;
}

