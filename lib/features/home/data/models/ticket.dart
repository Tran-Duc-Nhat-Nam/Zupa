import 'package:freezed_annotation/freezed_annotation.dart';

// ignore: prefer_relative_imports
import 'package:zupa/core/models/vehicle_type.dart';

part 'ticket.freezed.dart';
part 'ticket.g.dart';

@freezed
sealed class HomeTicket with _$HomeTicket {
  const factory HomeTicket({
    required String id,
    String? licensePlate,
    required DateTime timeIn,
    DateTime? timeOut,
    required String siteId,
    required VehicleType type,
    @Default(0) int price,
  }) = _HomeTicket;

  factory HomeTicket.fromJson(Map<String, dynamic> json) =>
      _$HomeTicketFromJson(json);
}
