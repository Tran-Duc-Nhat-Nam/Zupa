import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/helper/converter/date_time_converter.dart';

import 'package:zupa/core/models/vehicle_type.dart';
import 'package:zupa/features/revenue/data/models/revenue_model.dart';

part 'daily_revenue.freezed.dart';
part 'daily_revenue.g.dart';

@freezed
sealed class DailyRevenue with _$DailyRevenue {
  const DailyRevenue._();
  const factory DailyRevenue({
    @DateTimeConverter() DateTime? date,
    VehicleType? vehicleType,
    @Default([]) List<RevenueModel> revenue,
  }) = _DailyRevenue;

  int get totalPass => revenue.fold(0, (sum, e) => sum + e.pass);
  int get totalRevenue => revenue.fold(0, (sum, e) => sum + e.revenue);

  factory DailyRevenue.fromJson(Map<String, dynamic> json) =>
      _$DailyRevenueFromJson(json);
}
