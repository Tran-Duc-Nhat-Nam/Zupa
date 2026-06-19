import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/helper/converter/date_time_converter.dart';
import 'package:zupa/features/home/domain/entities/home_ticker_entity.dart';

part 'ticket_model.freezed.dart';
part 'ticket_model.g.dart';

@freezed
sealed class TicketModel with _$TicketModel {
  const TicketModel._();

  const factory TicketModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'tenantId') required int tenantId,
    @JsonKey(name: 'dateCreated') @DateTimeConverter() DateTime? dateCreated,
    @JsonKey(name: 'lastUpdated') @DateTimeConverter() DateTime? lastUpdated,
    @JsonKey(name: 'modifiedBy') String? modifiedBy,
    @JsonKey(name: 'createdBy') String? createdBy,
    @JsonKey(name: 'code') String? code,
    @JsonKey(name: 'referenceCode') String? referenceCode,
    @JsonKey(name: 'receivedDate') @DateTimeConverter() DateTime? receivedDate,
    @JsonKey(name: 'deliveryDate') @DateTimeConverter() DateTime? deliveryDate,
    @JsonKey(name: 'weight') double? weight,
    @JsonKey(name: 'note') String? note,
    @JsonKey(name: 'fsNote') String? fsNote,
    @JsonKey(name: 'reasonMessages') String? reasonMessages,
    @JsonKey(name: 'numberRoom') String? numberRoom,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'bagNumber') int? bagNumber,
    @JsonKey(name: 'bagNumberDriver') int? bagNumberDriver,
    @JsonKey(name: 'deliveryBagNumber') int? deliveryBagNumber,
    @JsonKey(name: 'numberOfLooseBags') int? numberOfLooseBags,
    @JsonKey(name: 'numberOfLooseBagsDriver') int? numberOfLooseBagsDriver,
    @JsonKey(name: 'numberOfLooseBagsActual') int? numberOfLooseBagsActual,
    @JsonKey(name: 'numberOfCheckBags') int? numberOfCheckBags,
    @JsonKey(name: 'sequenceNumber') int? sequenceNumber,
    @JsonKey(name: 'hasDeliveryReceiptDone') bool? hasDeliveryReceiptDone,
    @JsonKey(name: 'imagePaths') List<String>? imagePaths,
    @JsonKey(name: 'confirmNote') String? confirmNote,
    @JsonKey(name: 'cancelNote') String? cancelNote,
    @JsonKey(name: 'userIdReceived') int? userIdReceived,
    @JsonKey(name: 'createdSourceType') String? createdSourceType,
    @JsonKey(name: 'imageReceipts')
    @Default([])
    List<ImageReceipt> imageReceipts,
    @JsonKey(name: 'truck') dynamic truck,
    @JsonKey(name: 'driver') dynamic driver,
    @JsonKey(name: 'receiptImageStorage') dynamic receiptImageStorage,
    @JsonKey(name: 'packer') String? packer,
    @JsonKey(name: 'staffReceivedDate') String? staffReceivedDate,
    @JsonKey(name: 'weightTimes') @Default([]) List<dynamic> weightTimes,
    @JsonKey(name: 'numberBagReceivedList')
    @Default([])
    List<dynamic> numberBagReceivedList,
    @JsonKey(name: 'listRoomsNumber') String? listRoomsNumber,
    @JsonKey(name: 'userRequestRecheck') String? userRequestRecheck,
    @JsonKey(name: 'userIdCancel') int? userIdCancel,
    @JsonKey(name: 'rewash') @Default(false) bool rewash,
    @JsonKey(name: 'flagError') @Default(false) bool flagError,
    @JsonKey(name: 'express') @Default(false) bool express,
    @JsonKey(name: 'markError') @Default(false) bool markError,
    @JsonKey(name: 'update') @Default(false) bool update,
    @JsonKey(name: 'debtClosing') @Default(false) bool debtClosing,
    @JsonKey(name: 'autoGen') @Default(false) bool autoGen,
  }) = _TicketModel;

  factory TicketModel.fromJson(Map<String, dynamic> json) =>
      _$TicketModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();

  HomeTicketEntity toEntity() => .new(
    id: id,
    code: code ?? '',
    timeIn: dateCreated ?? .now(),
    timeOut: lastUpdated ?? .now(),
    isFlagError: express,
    siteId: note ?? '',
    type: vehicleTypes.first,
    imageUrl: imageReceipts.firstOrNull?.image ?? '',
    checkOutImageUrl: imageReceipts.lastOrNull?.image,
  );
}

@freezed
sealed class ImageReceipt with _$ImageReceipt {
  const factory ImageReceipt({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'dateCreated') String? dateCreated,
    @JsonKey(name: 'lastUpdated') String? lastUpdated,
    @JsonKey(name: 'modifiedBy') String? modifiedBy,
    @JsonKey(name: 'createdBy') String? createdBy,
    @JsonKey(name: 'image') String? image,
  }) = _ImageReceipt;

  factory ImageReceipt.fromJson(Map<String, dynamic> json) =>
      _$ImageReceiptFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();
}
