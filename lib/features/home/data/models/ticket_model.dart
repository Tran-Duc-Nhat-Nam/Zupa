import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/helper/converter/date_time_converter.dart';
import 'package:zupa/features/home/domain/entities/home_ticker_entity.dart';

part 'ticket_model.freezed.dart';
part 'ticket_model.g.dart';

@freezed
sealed class HomeTicketModel with _$HomeTicketModel {
  const HomeTicketModel._();

  const factory HomeTicketModel({
    @Default(0) int id,
    @DateTimeConverter() DateTime? dateCreated,
    @DateTimeConverter() DateTime? lastUpdated,
    @Default('') String code,
    @Default('') String productType,
    @Default('') String customerName,
    @DateTimeConverter() DateTime? receivedDate,
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
  }) = _HomeTicketModel;

  factory HomeTicketModel.fromJson(Map<String, dynamic> json) =>
      _$HomeTicketModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();

  HomeTicketEntity toEntity() => .new(
    id: id,
    code: code,
    timeIn: dateCreated ?? .now(),
    timeOut: lastUpdated ?? .now(),
    isFlagError: express,
    siteId: referenceCode,
    type: vehicleTypes.first,
    imageUrl: reasonMessages,
  );
}
