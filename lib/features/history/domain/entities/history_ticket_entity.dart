import 'package:zupa/core/models/vehicle_type.dart';

class HistoryTicketEntity {
  final int id;
  final String code;
  final DateTime timeIn;
  final DateTime? timeOut;
  final bool isFlagError;
  final String siteId;
  final VehicleType type;

  const HistoryTicketEntity({
    required this.id,
    required this.code,
    required this.timeIn,
    this.timeOut,
    required this.isFlagError,
    required this.siteId,
    required this.type,
  });
}
