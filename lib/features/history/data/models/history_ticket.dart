import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:zupa/core/common/models/vehicle_type.dart';

part 'history_ticket.freezed.dart';
part 'history_ticket.g.dart';

@freezed
sealed class HistoryTicket with _$HistoryTicket {
  const factory HistoryTicket({
    required String id,
    required DateTime timeIn,
    DateTime? timeOut,
    required String siteId,
    required VehicleType type,
  }) = _HistoryTicket;

  factory HistoryTicket.fromJson(Map<String, dynamic> json) =>
      _$HistoryTicketFromJson(json);
}
