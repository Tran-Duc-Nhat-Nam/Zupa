// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Request _$RequestFromJson(Map<String, dynamic> json) => _Request(
  page: (json['page'] as num?)?.toInt() ?? 0,
  size: (json['size'] as num?)?.toInt() ?? 10,
);

Map<String, dynamic> _$RequestToJson(_Request instance) => <String, dynamic>{
  'page': instance.page,
  'size': instance.size,
};
