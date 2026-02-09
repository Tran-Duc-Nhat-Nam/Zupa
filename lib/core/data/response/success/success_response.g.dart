// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SuccessResponse<T> _$SuccessResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _SuccessResponse<T>(
  code: (json['code'] as num?)?.toInt() ?? 200,
  data: fromJsonT(json['data']),
  message: json['message'] as String? ?? 'Success',
);

Map<String, dynamic> _$SuccessResponseToJson<T>(
  _SuccessResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'code': instance.code,
  'data': toJsonT(instance.data),
  'message': instance.message,
};
