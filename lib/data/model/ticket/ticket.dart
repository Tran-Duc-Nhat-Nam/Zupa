import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../screens/camera/models/vehicle_type.dart';


part 'ticket.freezed.dart';
part 'ticket.g.dart';

@freezed
sealed class Ticket with _$Ticket {
  const factory Ticket({
    required String id,
    String? licensePlate,
    required DateTime timeIn,
    DateTime? timeOut,
    required String siteId,
    required VehicleType type,
    @Default(0) int price,
  }) = _Ticket;

  factory Ticket.fromJson(Map<String, dynamic> json) =>
      _$TicketFromJson(json);
}