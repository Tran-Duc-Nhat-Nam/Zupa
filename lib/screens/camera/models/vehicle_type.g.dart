// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VehicleType _$VehicleTypeFromJson(Map<String, dynamic> json) => _VehicleType(
  value: json['value'] as String? ?? 'other',
  name: json['name'] as String? ?? 'vehicle',
  iconPath: json['iconPath'] as String? ?? AppIcons.home,
  color: json['color'] == null
      ? Colors.grey
      : const ColorConverter().fromJson((json['color'] as num).toInt()),
);

Map<String, dynamic> _$VehicleTypeToJson(_VehicleType instance) =>
    <String, dynamic>{
      'value': instance.value,
      'name': instance.name,
      'iconPath': instance.iconPath,
      'color': const ColorConverter().toJson(instance.color),
    };
