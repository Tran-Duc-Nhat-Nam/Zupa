// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VehicleType _$VehicleTypeFromJson(Map<String, dynamic> json) => _VehicleType(
  value: json['value'] as String? ?? 'other',
  name: json['name'] as String? ?? 'vehicle',
  icon: _$JsonConverterFromJson<String, IconData?>(
    json['icon'],
    const IconConverter().fromJson,
  ),
  color: json['color'] == null
      ? Colors.grey
      : const ColorConverter().fromJson((json['color'] as num).toInt()),
);

Map<String, dynamic> _$VehicleTypeToJson(_VehicleType instance) =>
    <String, dynamic>{
      'value': instance.value,
      'name': instance.name,
      'icon': const IconConverter().toJson(instance.icon),
      'color': const ColorConverter().toJson(instance.color),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);
