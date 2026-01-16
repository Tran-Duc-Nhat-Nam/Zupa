// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeTicket _$HomeTicketFromJson(Map<String, dynamic> json) => _HomeTicket(
  id: json['id'] as String,
  licensePlate: json['licensePlate'] as String?,
  timeIn: DateTime.parse(json['timeIn'] as String),
  timeOut: json['timeOut'] == null
      ? null
      : DateTime.parse(json['timeOut'] as String),
  siteId: json['siteId'] as String,
  type: VehicleType.fromJson(json['type'] as Map<String, dynamic>),
  price: (json['price'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$HomeTicketToJson(_HomeTicket instance) =>
    <String, dynamic>{
      'id': instance.id,
      'licensePlate': instance.licensePlate,
      'timeIn': instance.timeIn.toIso8601String(),
      'timeOut': instance.timeOut?.toIso8601String(),
      'siteId': instance.siteId,
      'type': instance.type,
      'price': instance.price,
    };
