import 'package:zupa/core/entities/vehicle_type_entity.dart';

class HomeTicketEntity {
  final int id;
  final String code;
  final DateTime timeIn;
  final DateTime? timeOut;
  final bool isFlagError;
  final String siteId;
  final VehicleTypeEntity type;
  final String imageUrl;

  const HomeTicketEntity({
    required this.id,
    required this.code,
    required this.timeIn,
    this.timeOut,
    required this.isFlagError,
    required this.siteId,
    required this.type,
    required this.imageUrl,
  });
}
