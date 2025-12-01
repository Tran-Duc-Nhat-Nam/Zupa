import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../screens/camera/models/vehicle_type.dart';
import '../revenue.dart';

part 'daily_revenue.freezed.dart';
part 'daily_revenue.g.dart';

@freezed
sealed class DailyRevenue with _$DailyRevenue {
  const DailyRevenue._();
  const factory DailyRevenue({
    required DateTime date,
    VehicleType? vehicleType,
    @Default([]) List<Revenue> revenue,
  }) = _DailyRevenue;

  int get totalPass => revenue.fold(0, (sum, e) => sum + e.pass);
  int get totalRevenue => revenue.fold(0, (sum, e) => sum + e.revenue);

  factory DailyRevenue.fromJson(Map<String, dynamic> json) =>
      _$DailyRevenueFromJson(json);
}