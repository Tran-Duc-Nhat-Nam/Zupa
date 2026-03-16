import 'package:zupa/core/entities/vehicle_type_entity.dart';

class HomeFilterEntity {
  const HomeFilterEntity({
    required this.page,
    required this.size,
    required this.keyword,
    required this.time,
    required this.type,
  });

  final int page;
  final int size;
  final String? keyword;
  final DateTime? time;
  final VehicleTypeEntity? type;
}
