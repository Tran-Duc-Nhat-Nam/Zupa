import 'package:zupa/core/entities/vehicle_type_entity.dart';
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

  int get totalPass => revenue.fold(0, (sum, e) => sum + e.pass);

  int get totalRevenue => revenue.fold(0, (sum, e) => sum + e.revenue);
}
