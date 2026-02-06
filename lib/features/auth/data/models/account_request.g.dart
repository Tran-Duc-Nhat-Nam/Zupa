// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountRequest _$AccountRequestFromJson(Map<String, dynamic> json) =>
    _AccountRequest(
      tenant: json['tenant'] as String? ?? '',
      username: json['username'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );

Map<String, dynamic> _$AccountRequestToJson(_AccountRequest instance) =>
    <String, dynamic>{
      'tenant': instance.tenant,
      'username': instance.username,
      'password': instance.password,
    };
