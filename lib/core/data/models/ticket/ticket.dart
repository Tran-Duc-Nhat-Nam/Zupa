import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/helper/converter/date_time_converter.dart';
import 'package:zupa/core/data/models/vehicle/vehicle.dart';

part 'ticket.freezed.dart';
part 'ticket.g.dart';

@freezed
sealed class Ticket with _$Ticket {
  const factory Ticket({
    @Default('') String id,
    @JsonKey(name: 'parking_lot_id') @Default('') String parkingLotId,
    @Default(Vehicle()) Vehicle vehicle,
    @JsonKey(name: 'slot_id') @Default('') String slotId,
    @JsonKey(name: 'entry_time') @DateTimeConverter() required DateTime entryTime,
    @JsonKey(name: 'exit_time') @DateTimeConverter() DateTime? exitTime,
    @Default(0.0) double fee,
    @Default('active') String status,
    @JsonKey(name: 'processed_by') @Default('') String processedBy,
  }) = _Ticket;

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
}
