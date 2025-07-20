// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Employee _$EmployeeFromJson(Map<String, dynamic> json) => _Employee(
  id: (json['id'] as num?)?.toInt() ?? 0,
  tenantId: (json['tenantId'] as num?)?.toInt() ?? 0,
  dateCreated: json['dateCreated'] as String? ?? 'N/A',
  lastUpdated: json['lastUpdated'] as String? ?? 'N/A',
  modifiedBy: json['modifiedBy'] as String? ?? 'N/A',
  createdBy: json['createdBy'] as String? ?? 'N/A',
  code: json['code'] as String? ?? 'N/A',
  timekeepingCode: json['timekeepingCode'] as String? ?? null,
  fullName: json['fullName'] as String? ?? 'N/A',
  gender: json['gender'] as String? ?? 'N/A',
  birthDate: json['birthDate'] as String? ?? null,
  position: json['position'] as String? ?? 'N/A',
  socialInsuranceCode: json['socialInsuranceCode'] as String? ?? 'N/A',
  taxCode: json['taxCode'] as String? ?? null,
  phoneNumber: json['phoneNumber'] as String? ?? 'N/A',
  email: json['email'] as String? ?? 'N/A',
  identityCard: json['identityCard'] as String? ?? 'N/A',
  issueDateIdentityCard: json['issueDateIdentityCard'] as String? ?? 'N/A',
  issuePlaceIdentityCard: json['issuePlaceIdentityCard'] as String? ?? 'N/A',
  permanentAddress: json['permanentAddress'] as String? ?? 'N/A',
  temporaryAddress: json['temporaryAddress'] as String? ?? 'N/A',
  hireDate: json['hireDate'] as String? ?? null,
  isResigned: json['isResigned'] as bool? ?? false,
  resignDate: json['resignDate'] as String? ?? null,
  note: json['note'] as String? ?? null,
  status: json['status'] as String? ?? 'N/A',
  staffMetaDataLevel: json['staffMetaDataLevel'] as String? ?? 'N/A',
  avatarPath: json['avatarPath'] as String? ?? null,
);

Map<String, dynamic> _$EmployeeToJson(_Employee instance) => <String, dynamic>{
  'id': instance.id,
  'tenantId': instance.tenantId,
  'dateCreated': instance.dateCreated,
  'lastUpdated': instance.lastUpdated,
  'modifiedBy': instance.modifiedBy,
  'createdBy': instance.createdBy,
  'code': instance.code,
  'timekeepingCode': instance.timekeepingCode,
  'fullName': instance.fullName,
  'gender': instance.gender,
  'birthDate': instance.birthDate,
  'position': instance.position,
  'socialInsuranceCode': instance.socialInsuranceCode,
  'taxCode': instance.taxCode,
  'phoneNumber': instance.phoneNumber,
  'email': instance.email,
  'identityCard': instance.identityCard,
  'issueDateIdentityCard': instance.issueDateIdentityCard,
  'issuePlaceIdentityCard': instance.issuePlaceIdentityCard,
  'permanentAddress': instance.permanentAddress,
  'temporaryAddress': instance.temporaryAddress,
  'hireDate': instance.hireDate,
  'isResigned': instance.isResigned,
  'resignDate': instance.resignDate,
  'note': instance.note,
  'status': instance.status,
  'staffMetaDataLevel': instance.staffMetaDataLevel,
  'avatarPath': instance.avatarPath,
};
