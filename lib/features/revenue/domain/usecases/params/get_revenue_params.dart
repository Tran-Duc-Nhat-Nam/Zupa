import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/entities/vehicle_type_entity.dart';

class GetRevenueParams {
  const GetRevenueParams({
    required this.keyword,
    required this.type,
    required this.fromDate,
    required this.toDate,
  });

  factory GetRevenueParams.initial({
    String? keyword,
    VehicleTypeEntity? type,
    DateTime? fromDate,
    DateTime? toDate,
  }) => .new(
    fromDate: fromDate ?? DateTime(DateTime.now().year, DateTime.now().month),
    toDate:
        toDate ?? DateTime(DateTime.now().year, DateTime.now().month + 1, 0),
    keyword: keyword ?? 'QUANTITY',
    type: type ?? vehicleTypes[0],
  );

  final String keyword;
  final VehicleTypeEntity? type;
  final DateTime fromDate;
  final DateTime toDate;
}
