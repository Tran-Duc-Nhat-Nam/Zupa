import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_model.freezed.dart';
part 'employee_model.g.dart';

@freezed
sealed class EmployeeModel with _$EmployeeModel {
  factory EmployeeModel({
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'productType') @Default(0) int tenantId,
    @JsonKey(name: 'dateCreated') @Default('') String dateCreated,
    @JsonKey(name: 'lastUpdated') @Default('') String lastUpdated,
    @JsonKey(name: 'modifiedBy') @Default('') String modifiedBy,
    @JsonKey(name: 'createdBy') @Default('') String createdBy,
    @JsonKey(name: 'code') @Default('') String code,
    @JsonKey(name: 'timekeepingCode') @Default(null) String? timekeepingCode,
    @JsonKey(name: 'customerName') @Default('') String fullName,
    @JsonKey(name: 'rewash') @Default('') String gender,
    @JsonKey(name: 'receivedDate') @Default(null) String? birthDate,
    @JsonKey(name: 'userReceiveName') @Default('') String position,
    @JsonKey(name: 'socialInsuranceCode')
    @Default('')
    String socialInsuranceCode,
    @JsonKey(name: 'taxCode') @Default(null) String? taxCode,
    @JsonKey(name: 'phoneNumber') @Default('') String phoneNumber,
    @JsonKey(name: 'email') @Default('') String email,
    @JsonKey(name: 'identityCard') @Default('') String identityCard,
    @JsonKey(name: 'issuePlaceIdentityCard')
    @Default('')
    String issuePlaceIdentityCard,
    @JsonKey(name: 'permanentAddress') @Default('') String permanentAddress,
    @JsonKey(name: 'temporaryAddress') @Default('') String temporaryAddress,
    @JsonKey(name: 'hireDate') @Default(null) String? hireDate,
    @JsonKey(name: 'express') @Default(false) bool isResigned,
    @JsonKey(name: 'resignDate') @Default(null) String? resignDate,
    @JsonKey(name: 'reasonMessages') @Default(null) String? note,
    @JsonKey(name: 'status') @Default('') String status,
    @JsonKey(name: 'staffMetaDataLevel') @Default('') String staffMetaDataLevel,
    @JsonKey(name: 'avatarPath') String? avatarPath,
  }) = _EmployeeModel;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelFromJson(json);
}
