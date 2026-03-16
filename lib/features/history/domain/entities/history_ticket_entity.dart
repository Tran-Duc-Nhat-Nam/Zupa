import 'package:zupa/core/entities/vehicle_type_entity.dart';

class HistoryTicketEntity {
  final int id;
  final String code;
  final DateTime timeIn;
  final DateTime? timeOut;
  final bool isFlagError;
  final String siteId;
  final VehicleTypeEntity type;

  const HistoryTicketEntity({
    required this.id,
    required this.code,
    required this.timeIn,
    required this.timeOut,
    required this.isFlagError,
    required this.siteId,
    required this.type,
  });
}
