// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeTicket _$HomeTicketFromJson(Map<String, dynamic> json) => _HomeTicket(
  id: (json['id'] as num).toInt(),
  tenantId: (json['tenantId'] as num).toInt(),
  code: json['code'] as String,
  timekeepingCode: json['timekeepingCode'] as String?,
  fullName: json['fullName'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  email: json['email'] as String?,
  isResigned: json['isResigned'] as bool,
  gender: _$JsonConverterFromJson<String, bool?>(
    json['gender'],
    const GenderConverter().fromJson,
  ),
  birthDate: _$JsonConverterFromJson<String, DateTime>(
    json['birthDate'],
    const DateTimeConverter().fromJson,
  ),
  dateCreated: const DateTimeConverter().fromJson(
    json['dateCreated'] as String,
  ),
  lastUpdated: const DateTimeConverter().fromJson(
    json['lastUpdated'] as String,
  ),
  avatarPath: json['avatarPath'] as String?,
  note: json['note'] as String?,
);

Map<String, dynamic> _$HomeTicketToJson(_HomeTicket instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenantId': instance.tenantId,
      'code': instance.code,
      'timekeepingCode': instance.timekeepingCode,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'isResigned': instance.isResigned,
      'gender': const GenderConverter().toJson(instance.gender),
      'birthDate': _$JsonConverterToJson<String, DateTime>(
        instance.birthDate,
        const DateTimeConverter().toJson,
      ),
      'dateCreated': const DateTimeConverter().toJson(instance.dateCreated),
      'lastUpdated': const DateTimeConverter().toJson(instance.lastUpdated),
      'avatarPath': instance.avatarPath,
      'note': instance.note,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
