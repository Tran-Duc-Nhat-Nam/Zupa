// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryTicket _$HistoryTicketFromJson(Map<String, dynamic> json) =>
    _HistoryTicket(
      id: json['id'] as String,
      timeIn: DateTime.parse(json['timeIn'] as String),
      timeOut: json['timeOut'] == null
          ? null
          : DateTime.parse(json['timeOut'] as String),
      siteId: json['siteId'] as String,
      type: VehicleType.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HistoryTicketToJson(_HistoryTicket instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timeIn': instance.timeIn.toIso8601String(),
      'timeOut': instance.timeOut?.toIso8601String(),
      'siteId': instance.siteId,
      'type': instance.type,
    };
