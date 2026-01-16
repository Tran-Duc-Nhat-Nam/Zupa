// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revenue_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RevenueFilter _$RevenueFilterFromJson(Map<String, dynamic> json) =>
    _RevenueFilter(
      keyword: json['keyword'] as String?,
      time: json['time'] == null
          ? null
          : DateTime.parse(json['time'] as String),
      type: json['type'] == null
          ? null
          : VehicleType.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RevenueFilterToJson(_RevenueFilter instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'time': instance.time?.toIso8601String(),
      'type': instance.type,
    };
