// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_lot_capacity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParkingLotCapacity _$ParkingLotCapacityFromJson(Map<String, dynamic> json) =>
    _ParkingLotCapacity(
      vehicleType: json['vehicleType'] == null
          ? const VehicleType()
          : VehicleType.fromJson(json['vehicleType'] as Map<String, dynamic>),
      capacity: (json['capacity'] as num?)?.toInt() ?? 0,
      available: (json['available'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ParkingLotCapacityToJson(_ParkingLotCapacity instance) =>
    <String, dynamic>{
      'vehicleType': instance.vehicleType,
      'capacity': instance.capacity,
      'available': instance.available,
    };
