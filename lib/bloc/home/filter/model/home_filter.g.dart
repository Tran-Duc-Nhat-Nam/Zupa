// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeFilter _$HomeFilterFromJson(Map<String, dynamic> json) => _HomeFilter(
  keyword: json['keyword'] as String?,
  time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
  type: json['type'] == null
      ? null
      : VehicleType.fromJson(json['type'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HomeFilterToJson(_HomeFilter instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'time': instance.time?.toIso8601String(),
      'type': instance.type,
    };
