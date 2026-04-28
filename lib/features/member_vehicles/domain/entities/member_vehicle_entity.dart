import 'package:zupa/core/constants/vehicle_types.dart';
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

  factory MemberVehicleEntity.initial({
    String? id,
    String? name,
    String? phoneNumber,
    String? licenseNumber,
    String? parkingLotId,
    VehicleTypeEntity? vehicleType,
    String? cardId,
    int? expiredIn,
    int? price,
  }) {
    return MemberVehicleEntity(
      id: id ?? '',
      name: name ?? '',
      phoneNumber: phoneNumber ?? '',
      licenseNumber: licenseNumber ?? '',
      parkingLotId: parkingLotId ?? '',
      vehicleType: vehicleType ?? vehicleTypes[0],
      cardId: cardId ?? '',
      expiredIn: expiredIn ?? 0,
      price: price ?? 0,
    );
  }

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
