import 'package:zupa/core/entities/vehicle_type_entity.dart';

class RevenueFilterEntity {
  const RevenueFilterEntity({
    required this.keyword,
    required this.type,
    required this.fromDate,
    required this.toDate,
  });

  final String keyword;
  final VehicleTypeEntity type;
  final DateTime fromDate;
  final DateTime toDate;
}
