import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../common/styles/icons.dart';

part 'vehicle_type.freezed.dart';
part 'vehicle_type.g.dart';

@freezed
sealed class VehicleType with _$VehicleType {
  const factory VehicleType({
    @Default('other') String value,
    @Default('vehicle') String name,
    @Default(AppIcons.home) String iconPath,
  }) = _VehicleType;

  factory VehicleType.fromJson(Map<String, Object?> json)
  => _$VehicleTypeFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();
}