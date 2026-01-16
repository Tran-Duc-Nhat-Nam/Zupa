import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/common/styles/icons.dart';
import 'package:zupa/helper/converter/color_converter.dart';

part 'vehicle_type.freezed.dart';
part 'vehicle_type.g.dart';

@freezed
sealed class VehicleType with _$VehicleType {
  const factory VehicleType({
    @Default('other') String value,
    @Default('vehicle') String name,
    @Default(AppIcons.home) String iconPath,
    @ColorConverter() @Default(Colors.grey) Color color,
  }) = _VehicleType;

  factory VehicleType.fromJson(Map<String, dynamic> json) =>
      _$VehicleTypeFromJson(json);
}
