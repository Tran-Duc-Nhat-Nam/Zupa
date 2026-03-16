import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/entities/vehicle_type_entity.dart';
import 'package:zupa/core/helper/converter/color_converter.dart';

part 'vehicle_type_model.freezed.dart';
part 'vehicle_type_model.g.dart';

@freezed
sealed class VehicleTypeModel with _$VehicleTypeModel {
  const VehicleTypeModel._();
  const factory VehicleTypeModel({
    @Default('other') String value,
    @Default('vehicle') String name,
    @Default('motorbike') String icon,
    @ColorConverter() @Default(Colors.grey) Color color,
  }) = _VehicleTypeModel;

  factory VehicleTypeModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleTypeModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();
  
  VehicleTypeEntity toEntity() => VehicleTypeEntity(
    value: value,
    name: name,
    icon: icon,
    color: color,
  );

  factory VehicleTypeModel.fromEntity(VehicleTypeEntity entity) {
    return VehicleTypeModel(
      value: entity.value,
      name: entity.name,
      icon: entity.icon,
    );
  }
}
