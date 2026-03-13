import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/helper/converter/date_time_converter.dart';
import 'package:zupa/core/models/vehicle_type.dart';
import 'package:zupa/features/history/domain/entities/history_ticket_entity.dart';

part 'history_ticket_model.freezed.dart';
part 'history_ticket_model.g.dart';

@freezed
sealed class HistoryTicketModel with _$HistoryTicketModel {
  const factory HistoryTicketModel({
    @Default(0) int id,
    @DateTimeConverter() required DateTime dateCreated,
    @DateTimeConverter() required DateTime lastUpdated,
    @Default('') String code,
    @Default('') String productType,
    @Default('') String customerName,
    @DateTimeConverter() required DateTime receivedDate,
    @Default(false) bool express,
    @Default('DONE') String status,
    @Default('') String referenceCode,
    @Default('') String numberRoom,
    @Default(0) int bagNumber,
    @Default(0) int numberOfLooseBags,
    @Default(0) int numberOfCheckBags,
    @Default(0) int totalReceive,
    @Default('') String userReceiveName,
    @Default('') String reasonMessages,
    @Default('') String productGroupName,
    @Default(false) bool flagError,
    @Default(false) bool rewash,
  }) = _HistoryTicketModel;

  factory HistoryTicketModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryTicketModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();

  HistoryTicketEntity toEntity() => HistoryTicketEntity(
    id: id,
    code: code,
    timeIn: dateCreated,
    timeOut: lastUpdated,
    isFlagError: flagError,
    siteId: referenceCode,
    type: const VehicleType()
  );
}
