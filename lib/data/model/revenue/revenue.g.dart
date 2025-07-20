// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revenue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Revenue _$RevenueFromJson(Map<String, dynamic> json) => _Revenue(
  vehicleType: VehicleType.fromJson(
    json['vehicleType'] as Map<String, dynamic>,
  ),
  pass: (json['pass'] as num?)?.toInt() ?? 0,
  revenue: (json['revenue'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$RevenueToJson(_Revenue instance) => <String, dynamic>{
  'vehicleType': instance.vehicleType,
  'pass': instance.pass,
  'revenue': instance.revenue,
};
