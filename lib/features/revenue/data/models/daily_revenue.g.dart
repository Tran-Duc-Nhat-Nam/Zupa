// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_revenue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyRevenue _$DailyRevenueFromJson(Map<String, dynamic> json) =>
    _DailyRevenue(
      date: _$JsonConverterFromJson<String, DateTime>(
        json['date'],
        const DateTimeConverter().fromJson,
      ),
      vehicleType: json['vehicleType'] == null
          ? null
          : VehicleType.fromJson(json['vehicleType'] as Map<String, dynamic>),
      revenue:
          (json['revenue'] as List<dynamic>?)
              ?.map((e) => RevenueModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DailyRevenueToJson(_DailyRevenue instance) =>
    <String, dynamic>{
      'date': _$JsonConverterToJson<String, DateTime>(
        instance.date,
        const DateTimeConverter().toJson,
      ),
      'vehicleType': instance.vehicleType,
      'revenue': instance.revenue,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
