import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/helper/converter/date_time_converter.dart';
import 'package:zupa/features/history/domain/entities/history_ticket_entity.dart';

part 'history_ticket_model.freezed.dart';
part 'history_ticket_model.g.dart';

@freezed
sealed class HistoryTicketModel with _$HistoryTicketModel {
  const factory HistoryTicketModel({
    required int id,
    required String code,
    @DateTimeConverter() DateTime? timeIn,
    @DateTimeConverter() DateTime? timeOut,
    @DateTimeConverter() DateTime? receivedDate,
    @Default(false) bool isFlagError,
    String? siteId,
  }) = _HistoryTicketModel;

  factory HistoryTicketModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryTicketModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();

  HistoryTicketEntity toEntity() => HistoryTicketEntity(
    id: id,
    code: code,
    timeIn: timeIn,
    timeOut: timeOut,
    receivedDate: receivedDate,
    isFlagError: isFlagError,
    siteId: siteId,
  );
}
