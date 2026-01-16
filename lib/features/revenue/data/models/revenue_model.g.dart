// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revenue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RevenueModel _$RevenueModelFromJson(Map<String, dynamic> json) =>
    _RevenueModel(
      vehicleType: VehicleType.fromJson(
        json['vehicleType'] as Map<String, dynamic>,
      ),
      pass: (json['pass'] as num?)?.toInt() ?? 0,
      revenue: (json['revenue'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$RevenueModelToJson(_RevenueModel instance) =>
    <String, dynamic>{
      'vehicleType': instance.vehicleType,
      'pass': instance.pass,
      'revenue': instance.revenue,
    };
