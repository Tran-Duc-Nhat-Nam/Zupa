// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryFilter _$HistoryFilterFromJson(Map<String, dynamic> json) =>
    _HistoryFilter(
      keyword: json['keyword'] as String?,
      time: json['time'] == null
          ? null
          : DateTime.parse(json['time'] as String),
      type: json['type'] == null
          ? null
          : VehicleType.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HistoryFilterToJson(_HistoryFilter instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'time': instance.time?.toIso8601String(),
      'type': instance.type,
    };
