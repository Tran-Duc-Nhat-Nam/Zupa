import 'package:zupa/core/constants/query.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/entities/vehicle_type_entity.dart';

class GetHistoryParams {
  const GetHistoryParams({
    required this.page,
    required this.size,
    required this.keyword,
    required this.time,
    required this.type,
  });

  factory GetHistoryParams.initial() => GetHistoryParams(
    page: defaultPageIndex,
    size: defaultPageSize,
    keyword: '',
    type: vehicleTypes[0],
    time: .now()
  );

  final int page;
  final int size;
  final String? keyword;
  final DateTime? time;
  final VehicleTypeEntity? type;
}
