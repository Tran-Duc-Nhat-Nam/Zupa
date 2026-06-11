import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/helper/converter/date_time_converter.dart';
import 'package:zupa/core/models/vehicle_type_model.dart';
import 'package:zupa/features/revenue/data/models/revenue_model.dart';
import 'package:zupa/features/revenue/domain/entities/daily_revenue_entity.dart';

part 'daily_revenue_model.freezed.dart';
part 'daily_revenue_model.g.dart';

@freezed
sealed class DailyRevenueModel with _$DailyRevenueModel {
  const DailyRevenueModel._();

  const factory DailyRevenueModel({
    @DateTimeConverter() DateTime? date,
    VehicleTypeModel? vehicleType,
    @Default([]) List<RevenueModel> revenue,
  }) = _DailyRevenueModel;

  factory DailyRevenueModel.fromJson(Map<String, dynamic> json) =>
      _$DailyRevenueModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();

  DailyRevenueEntity toEntity() => .new(
    date: date ?? .now(),
    vehicleType: vehicleType?.toEntity(),
    revenue: revenue.map((e) => e.toEntity()).toList(),
  );
}
