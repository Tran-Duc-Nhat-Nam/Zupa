// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_lot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParkingLot _$ParkingLotFromJson(Map<String, dynamic> json) => _ParkingLot(
  id: json['id'] as String? ?? 'N/A',
  name: json['name'] as String? ?? 'N/A',
  address: json['address'] as String? ?? 'N/A',
  capacity:
      (json['capacity'] as List<dynamic>?)
          ?.map((e) => ParkingLotCapacity.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  vehicleType: json['vehicleType'] == null
      ? const VehicleType()
      : VehicleType.fromJson(json['vehicleType'] as Map<String, dynamic>),
  isLocked: json['isLocked'] as bool? ?? false,
);

Map<String, dynamic> _$ParkingLotToJson(_ParkingLot instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'capacity': instance.capacity,
      'vehicleType': instance.vehicleType,
      'isLocked': instance.isLocked,
    };
