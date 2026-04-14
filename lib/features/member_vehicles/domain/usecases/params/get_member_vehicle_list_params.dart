import 'package:zupa/core/constants/query.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/entities/vehicle_type_entity.dart';

class GetMemberVehicleListParams {
  const GetMemberVehicleListParams({
    required this.page,
    required this.size,
    required this.keyword,
    required this.time,
    required this.type,
  });

  factory GetMemberVehicleListParams.initial({
    int? page,
    int? size,
    String? keyword,
    DateTime? time,
    VehicleTypeEntity? type,
  }) => .new(
    page: page ?? defaultPageIndex,
    size: size ?? defaultPageSize,
    keyword: keyword ?? '',
    time: time ?? .now(),
    type: type ?? vehicleTypes[0],
  );

  final int page;
  final int size;
  final String? keyword;
  final DateTime? time;
  final VehicleTypeEntity? type;
}
