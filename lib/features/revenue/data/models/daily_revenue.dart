import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/helper/converter/date_time_converter.dart';

import 'package:zupa/features/revenue/data/models/revenue_detail.dart';

part 'daily_revenue.freezed.dart';
part 'daily_revenue.g.dart';

@freezed
sealed class DailyRevenue with _$DailyRevenue {
  const DailyRevenue._();
  const factory DailyRevenue({
    @Default('') String id,
    @DateTimeConverter() DateTime? date,
    @JsonKey(name: 'total_amount') @Default(0.0) double totalAmount,
    @JsonKey(name: 'by_vehicle_type')
    @Default([])
    List<RevenueDetail> byVehicleType,
  }) = _DailyRevenue;

  int get totalPass => byVehicleType.fold(0, (sum, e) => sum + e.count);
  double get totalRevenueValue =>
      byVehicleType.fold(0.0, (sum, e) => sum + e.amount);

  factory DailyRevenue.fromJson(Map<String, dynamic> json) =>
      _$DailyRevenueFromJson(json);


}
