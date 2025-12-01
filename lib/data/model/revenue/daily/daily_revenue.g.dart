// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_revenue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyRevenue _$DailyRevenueFromJson(Map<String, dynamic> json) =>
    _DailyRevenue(
      date: DateTime.parse(json['date'] as String),
      vehicleType: json['vehicleType'] == null
          ? null
          : VehicleType.fromJson(json['vehicleType'] as Map<String, dynamic>),
      revenue:
          (json['revenue'] as List<dynamic>?)
              ?.map((e) => Revenue.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DailyRevenueToJson(_DailyRevenue instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'vehicleType': instance.vehicleType,
      'revenue': instance.revenue,
    };
