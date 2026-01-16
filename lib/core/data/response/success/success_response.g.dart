// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SuccessResponse _$SuccessResponseFromJson(Map<String, dynamic> json) =>
    _SuccessResponse(
      code: (json['code'] as num?)?.toInt() ?? 200,
      data: json['data'],
      message: json['message'] as String? ?? 'Success',
    );

Map<String, dynamic> _$SuccessResponseToJson(_SuccessResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };
