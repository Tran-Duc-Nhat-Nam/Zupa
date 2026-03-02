import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/helper/converter/date_time_converter.dart';
import 'package:zupa/core/data/models/ticket/ticket.dart';

part 'history_ticket.freezed.dart';
part 'history_ticket.g.dart';

@freezed
sealed class HistoryTicket with _$HistoryTicket {
  const factory HistoryTicket({
    @Default('') String id,
    @DateTimeConverter() required DateTime date,
    @Default([]) List<Ticket> tickets,
  }) = _HistoryTicket;

  factory HistoryTicket.fromJson(Map<String, dynamic> json) =>
      _$HistoryTicketFromJson(json);


}
