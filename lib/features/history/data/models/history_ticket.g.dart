// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryTicket _$HistoryTicketFromJson(Map<String, dynamic> json) =>
    _HistoryTicket(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      timeIn: _$JsonConverterFromJson<String, DateTime>(
        json['timeIn'],
        const DateTimeConverter().fromJson,
      ),
      timeOut: _$JsonConverterFromJson<String, DateTime>(
        json['timeOut'],
        const DateTimeConverter().fromJson,
      ),
      receivedDate: _$JsonConverterFromJson<String, DateTime>(
        json['receivedDate'],
        const DateTimeConverter().fromJson,
      ),
      isFlagError: json['isFlagError'] as bool? ?? false,
      siteId: json['siteId'] as String?,
      type: json['type'] == null
          ? null
          : VehicleType.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HistoryTicketToJson(_HistoryTicket instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'timeIn': _$JsonConverterToJson<String, DateTime>(
        instance.timeIn,
        const DateTimeConverter().toJson,
      ),
      'timeOut': _$JsonConverterToJson<String, DateTime>(
        instance.timeOut,
        const DateTimeConverter().toJson,
      ),
      'receivedDate': _$JsonConverterToJson<String, DateTime>(
        instance.receivedDate,
        const DateTimeConverter().toJson,
      ),
      'isFlagError': instance.isFlagError,
      'siteId': instance.siteId,
      'type': instance.type,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
