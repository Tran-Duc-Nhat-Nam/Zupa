// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_vehicle_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MemberVehicleRequest _$MemberVehicleRequestFromJson(
  Map<String, dynamic> json,
) => _MemberVehicleRequest(
  name: json['name'] as String,
  phoneNumber: json['phoneNumber'] as String,
  licenseNumber: json['licenseNumber'] as String,
  cardID: json['cardID'] as String,
  branchID: json['branchID'] as String,
  vehicleTypeID: json['vehicleTypeID'] as String,
  expiredIn: DateTime.parse(json['expiredIn'] as String),
);

Map<String, dynamic> _$MemberVehicleRequestToJson(
  _MemberVehicleRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'phoneNumber': instance.phoneNumber,
  'licenseNumber': instance.licenseNumber,
  'cardID': instance.cardID,
  'branchID': instance.branchID,
  'vehicleTypeID': instance.vehicleTypeID,
  'expiredIn': instance.expiredIn.toIso8601String(),
};
