import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/helper/converter/color_converter.dart';
import 'package:zupa/core/helper/converter/icon_converter.dart';

part 'vehicle_type.freezed.dart';
part 'vehicle_type.g.dart';

@freezed
sealed class VehicleType with _$VehicleType {
  const factory VehicleType({
    @Default('other') String value,
    @Default('vehicle') String name,
    @IconConverter() IconData? icon,
    @ColorConverter() @Default(Colors.grey) Color color,
  }) = _VehicleType;

  factory VehicleType.fromJson(Map<String, dynamic> json) =>
      _$VehicleTypeFromJson(json);
}
