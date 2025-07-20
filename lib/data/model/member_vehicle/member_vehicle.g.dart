// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MemberVehicle _$MemberVehicleFromJson(Map<String, dynamic> json) =>
    _MemberVehicle(
      id: json['id'] as String? ?? 'N/A',
      name: json['name'] as String? ?? 'N/A',
      phoneNumber: json['phoneNumber'] as String? ?? 'N/A',
      parkingLotId: json['parkingLotId'] as String? ?? 'N/A',
      vehicleType: json['vehicleType'] == null
          ? const VehicleType()
          : VehicleType.fromJson(json['vehicleType'] as Map<String, dynamic>),
      cardId: json['cardId'] as String? ?? 'N/A',
      expiredIn: (json['expiredIn'] as num?)?.toInt() ?? 86400,
      price: (json['price'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$MemberVehicleToJson(_MemberVehicle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'parkingLotId': instance.parkingLotId,
      'vehicleType': instance.vehicleType,
      'cardId': instance.cardId,
      'expiredIn': instance.expiredIn,
      'price': instance.price,
    };
