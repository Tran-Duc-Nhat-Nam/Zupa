import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../screens/camera/models/vehicle_type.dart';

part 'revenue.freezed.dart';
part 'revenue.g.dart';

@freezed
sealed class Revenue with _$Revenue {
  const factory Revenue({
    required VehicleType vehicleType,
    @Default(0) int pass,
    @Default(0) int revenue,
  }) = _Revenue;

  factory Revenue.fromJson(Map<String, dynamic> json) =>
      _$RevenueFromJson(json);
}