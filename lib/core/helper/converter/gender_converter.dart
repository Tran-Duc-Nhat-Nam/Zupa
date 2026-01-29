import 'package:json_annotation/json_annotation.dart';

class GenderConverter implements JsonConverter<bool?, String> {
  const GenderConverter();

  @override
  bool? fromJson(String json) {
    return switch (json) {
      'MALE' => true,
      'FEMALE' => false,
      _ => null,
    };
  }

  @override
  String toJson(bool? object) {
    return switch (object) {
      true => 'MALE',
      false => 'FEMALE',
      _ => 'OTHER',
    };
  }
}
