// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_vehicles_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MemberVehiclesFilter _$MemberVehiclesFilterFromJson(
  Map<String, dynamic> json,
) => _MemberVehiclesFilter(
  keyword: json['keyword'] as String?,
  time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
  type: json['type'] == null
      ? null
      : VehicleType.fromJson(json['type'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MemberVehiclesFilterToJson(
  _MemberVehiclesFilter instance,
) => <String, dynamic>{
  'keyword': instance.keyword,
  'time': instance.time?.toIso8601String(),
  'type': instance.type,
};
