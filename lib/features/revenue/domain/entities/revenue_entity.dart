import 'package:zupa/core/entities/vehicle_type_entity.dart';

class RevenueEntity {
  const RevenueEntity({
    required this.vehicleType,
    required this.pass,
    required this.revenue,
  });

  final VehicleTypeEntity vehicleType;
  final int pass;
  final int revenue;
}
