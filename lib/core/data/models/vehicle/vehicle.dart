import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/models/vehicle_type.dart';

part 'vehicle.freezed.dart';
part 'vehicle.g.dart';

@freezed
sealed class Vehicle with _$Vehicle {
  const factory Vehicle({
    @JsonKey(name: 'plate_number') String? plateNumber,
    @Default(VehicleType()) VehicleType type,
    @Default('') String brand,
    @Default('') String color,
    @Default('') String description,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);
}
