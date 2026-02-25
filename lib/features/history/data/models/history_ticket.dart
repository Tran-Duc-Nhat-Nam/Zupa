import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/helper/converter/date_time_converter.dart';

import 'package:zupa/core/models/vehicle_type.dart';

part 'history_ticket.freezed.dart';
part 'history_ticket.g.dart';

@freezed
sealed class HistoryTicket with _$HistoryTicket {
  const factory HistoryTicket({
    required int id,
    required String code,
    @DateTimeConverter() DateTime? timeIn,
    @DateTimeConverter() DateTime? timeOut,
    @DateTimeConverter() DateTime? receivedDate,
    @Default(false) bool isFlagError,
    String? siteId,
    VehicleType? type,
  }) = _HistoryTicket;

  factory HistoryTicket.fromJson(Map<String, dynamic> json) =>
      _$HistoryTicketFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();
}
