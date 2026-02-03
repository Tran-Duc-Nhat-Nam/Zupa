import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/helper/converter/date_time_converter.dart';
import 'package:zupa/core/helper/converter/gender_converter.dart';

// ignore: prefer_relative_imports

part 'ticket.freezed.dart';
part 'ticket.g.dart';

@freezed
sealed class HomeTicket with _$HomeTicket {
  const factory HomeTicket({
    required int id,
    required int tenantId,
    required String code,
    String? timekeepingCode,
    String? fullName,
    String? phoneNumber,
    String? email,
    required bool isResigned,
    @GenderConverter() bool? gender,
    @DateTimeConverter() DateTime? birthDate,
    @DateTimeConverter() required DateTime dateCreated,
    @DateTimeConverter() required DateTime lastUpdated,
    String? avatarPath,
    String? note,
  }) = _HomeTicket;

  factory HomeTicket.fromJson(Map<String, dynamic> json) =>
      _$HomeTicketFromJson(json);
}
