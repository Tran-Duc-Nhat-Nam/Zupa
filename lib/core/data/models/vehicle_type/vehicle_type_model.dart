import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:zupa/core/domain/entities/vehicle_type_entity.dart';
import 'package:zupa/core/helper/converter/color_converter.dart';
import 'package:zupa/core/helper/converter/icon_converter.dart';

part 'vehicle_type_model.freezed.dart';
part 'vehicle_type_model.g.dart';

@freezed
sealed class VehicleTypeModel with _$VehicleTypeModel {
  const VehicleTypeModel._();

  const factory VehicleTypeModel({
    @Default('other') String value,
    @Default('vehicle') String name,
    @Default('motorbike') @IconConverter() IconData? icon,
    @ColorConverter() @Default(Colors.grey) Color color,
  }) = _VehicleTypeModel;

  factory VehicleTypeModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleTypeModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();

  VehicleTypeEntity toEntity() =>
      .new(value: value, name: name, icon: icon ?? Symbols.globe_rounded, color: color);

  factory VehicleTypeModel.fromEntity(VehicleTypeEntity entity) =>
      .new(value: entity.value, name: entity.name, icon: entity.icon);
}
