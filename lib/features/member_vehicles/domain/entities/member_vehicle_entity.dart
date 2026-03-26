import 'package:zupa/core/entities/vehicle_type_entity.dart';

class MemberVehicleEntity {
  MemberVehicleEntity({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.licenseNumber,
    required this.parkingLotId,
    required this.vehicleType,
    required this.cardId,
    required this.expiredIn,
    required this.price,
  });

  final String id;
  final String name;
  final String phoneNumber;
  final String licenseNumber;
  final String parkingLotId;
  final VehicleTypeEntity vehicleType;
  final String cardId;
  final int expiredIn;
  final int price;
}
