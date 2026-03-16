import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:zupa/core/models/vehicle_type_model.dart';
import 'package:zupa/features/revenue/domain/entities/revenue_entity.dart';

part 'revenue_model.freezed.dart';
part 'revenue_model.g.dart';

@freezed
sealed class RevenueModel with _$RevenueModel {
  const RevenueModel._();
  const factory RevenueModel({
    required VehicleTypeModel vehicleType,
    @Default(0) int pass,
    @Default(0) int revenue,
  }) = _RevenueModel;

  factory RevenueModel.fromJson(Map<String, dynamic> json) =>
      _$RevenueModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();

  RevenueEntity toEntity() => RevenueEntity(
    vehicleType: vehicleType.toEntity(),
    pass: pass,
    revenue: revenue,
  );
}
