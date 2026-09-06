import 'package:material_ui/material_ui.dart';
import 'package:json_annotation/json_annotation.dart';

class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int json) => .new(json);

  @override
  int toJson(Color object) => object.toARGB32();
}
