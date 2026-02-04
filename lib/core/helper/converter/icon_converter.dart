import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class IconConverter implements JsonConverter<IconData?, String> {
  const IconConverter();

  @override
  IconData? fromJson(String json) {
    return switch (json) {
      'motorbike' => Symbols.motorcycle_rounded,
      'bicycle' => Symbols.pedal_bike_rounded,
      'car' => Symbols.directions_car_rounded,
      _ => null,
    };
  }

  @override
  String toJson(IconData? object) {
    return switch (object) {
      Symbols.motorcycle_rounded => 'motorbike',
      Symbols.pedal_bike_rounded => 'bicycle',
      Symbols.directions_car_rounded => 'car',
      _ => '',
    };
  }
}
