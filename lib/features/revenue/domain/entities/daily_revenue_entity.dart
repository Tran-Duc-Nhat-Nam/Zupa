import 'package:zupa/core/domain/entities/vehicle_type_entity.dart';
import 'package:zupa/features/revenue/domain/entities/revenue_entity.dart';

class DailyRevenueEntity {
  const DailyRevenueEntity({
    required this.date,
    required this.vehicleType,
    required this.revenue,
  });

  final DateTime date;
  final VehicleTypeEntity? vehicleType;
  final List<RevenueEntity> revenue;
}

extension DailyRevenueEntityExtension on DailyRevenueEntity {
  int get totalPass => revenue.fold(0, (sum, e) => sum + e.pass);
  int get totalRevenue => revenue.fold(0, (sum, e) => sum + e.revenue);
}

extension DailyRevenueEntityListExtension on List<DailyRevenueEntity> {
  int get totalPass => fold(0, (sum, e) => sum + e.totalPass);
  int get totalRevenue => fold(0, (sum, e) => sum + e.totalRevenue);
}
