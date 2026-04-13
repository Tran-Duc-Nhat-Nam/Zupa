import 'package:zupa/core/constants/query.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/entities/vehicle_type_entity.dart';

class GetTicketParams {
  const GetTicketParams({
    required this.page,
    required this.size,
    required this.keyword,
    required this.time,
    required this.type,
  });

  factory GetTicketParams.initial({
    int? page,
    int? size,
    String? keyword,
    DateTime? time,
    VehicleTypeEntity? type,
  }) => GetTicketParams(
    page: page ?? defaultPageIndex,
    size: size ?? defaultPageSize,
    keyword: keyword ?? '',
    type: type ?? vehicleTypes[0],
    time: time ?? .now(),
  );

  final int page;
  final int size;
  final String? keyword;
  final DateTime? time;
  final VehicleTypeEntity? type;
}
