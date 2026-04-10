import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/entities/vehicle_type_entity.dart';

class GetRevenueParams {
  const GetRevenueParams({
    required this.keyword,
    required this.type,
    required this.fromDate,
    required this.toDate,
  });

  factory GetRevenueParams.initial() => GetRevenueParams(
        fromDate: DateTime(DateTime.now().year, DateTime.now().month),
        toDate: DateTime(DateTime.now().year, DateTime.now().month + 1, 0),
        keyword: 'QUANTITY',
        type: vehicleTypes[0],
      );

  final String keyword;
  final VehicleTypeEntity? type;
  final DateTime fromDate;
  final DateTime toDate;
}

