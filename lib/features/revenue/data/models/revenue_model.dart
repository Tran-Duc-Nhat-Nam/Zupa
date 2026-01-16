import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:zupa/core/models/vehicle_type.dart';

part 'revenue_model.freezed.dart';
part 'revenue_model.g.dart';

@freezed
sealed class RevenueModel with _$RevenueModel {
  const factory RevenueModel({
    required VehicleType vehicleType,
    @Default(0) int pass,
    @Default(0) int revenue,
  }) = _RevenueModel;

  factory RevenueModel.fromJson(Map<String, dynamic> json) =>
      _$RevenueModelFromJson(json);
}
