import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/models/vehicle_type.dart';

part 'revenue_detail.freezed.dart';
part 'revenue_detail.g.dart';

@freezed
sealed class RevenueDetail with _$RevenueDetail {
  const factory RevenueDetail({
    @JsonKey(name: 'vehicle_type') @Default(VehicleType()) VehicleType vehicleType,
    @Default(0) int count,
    @Default(0.0) double amount,
  }) = _RevenueDetail;

  factory RevenueDetail.fromJson(Map<String, dynamic> json) => _$RevenueDetailFromJson(json);
}
