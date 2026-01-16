// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketRequest _$TicketRequestFromJson(Map<String, dynamic> json) =>
    _TicketRequest(
      keyword: json['keyword'] as String?,
      time: json['time'] == null
          ? null
          : DateTime.parse(json['time'] as String),
      typeId: (json['typeId'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt() ?? 0,
      size: (json['size'] as num?)?.toInt() ?? 10,
    );

Map<String, dynamic> _$TicketRequestToJson(_TicketRequest instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'time': instance.time?.toIso8601String(),
      'typeId': instance.typeId,
      'page': instance.page,
      'size': instance.size,
    };
