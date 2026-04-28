import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/helper/converter/date_time_converter.dart';
import 'package:zupa/features/history/domain/entities/history_ticket_entity.dart';

part 'history_ticket_model.freezed.dart';
part 'history_ticket_model.g.dart';

@freezed
sealed class HistoryTicketModel with _$HistoryTicketModel {
  const HistoryTicketModel._();

  const factory HistoryTicketModel({
    @Default(0) int id,
    @DateTimeConverter() DateTime? dateCreated,
    @DateTimeConverter() DateTime? lastUpdated,
    @Default('') String code,
    @Default('') String productType,
    @Default('') String customerName,
    @DateTimeConverter() DateTime? deliveryDate,
    @Default('DONE') String status,
    @Default(0) int numberOfLooseBags,
    @Default(0) int bagNumber,
    @Default(0.0) double weight,
    @Default('') String receivedCode,
    @Default(false) bool isDebt,
    @Default(0) int totalDeliveryActual,
    @Default(0) int totalDelivery,
    @Default('') String userDoneName,
    @Default('') String productGroupName,
    @Default(false) bool flagError,
    @Default(false) bool express,
    @Default(false) bool rewash,
  }) = _HistoryTicketModel;

  factory HistoryTicketModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryTicketModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();

  HistoryTicketEntity toEntity() => .new(
    id: id,
    code: code,
    timeIn: dateCreated ?? .now(),
    timeOut: lastUpdated ?? .now(),
    isFlagError: flagError,
    siteId: receivedCode,
    type: vehicleTypes.first,
  );
}
