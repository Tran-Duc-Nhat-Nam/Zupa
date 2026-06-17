import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/env/env.dart';
import 'package:zupa/features/employee_management/domain/entity/employee_entity.dart';

part 'employee_model.freezed.dart';
part 'employee_model.g.dart';

@freezed
sealed class EmployeeModel with _$EmployeeModel {
  const EmployeeModel._();

  const factory EmployeeModel({
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'productType') @Default(0) int tenantId,
    @JsonKey(name: 'dateCreated') @Default('') String dateCreated,
    @JsonKey(name: 'lastUpdated') @Default('') String lastUpdated,
    @JsonKey(name: 'modifiedBy') @Default('') String modifiedBy,
    @JsonKey(name: 'createdBy') @Default('') String createdBy,
    @JsonKey(name: 'code') @Default('') String code,
    @JsonKey(name: 'timekeepingCode') @Default(null) String? timekeepingCode,
    @JsonKey(name: 'fullName') @Default('') String fullName,
    @JsonKey(name: 'gender') @Default('') String gender,
    @JsonKey(name: 'birthDate') @Default(null) String? birthDate,
    @JsonKey(name: 'position') @Default('') String position,
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
    @JsonKey(name: 'isResigned') @Default(false) bool isResigned,
    @JsonKey(name: 'resignDate') @Default(null) String? resignDate,
    @JsonKey(name: 'note') @Default(null) String? note,
    @JsonKey(name: 'status') @Default('') String status,
    @JsonKey(name: 'staffMetaDataLevel') @Default('') String staffMetaDataLevel,
    @JsonKey(name: 'avatarPath') String? avatarPath,
  }) = _EmployeeModel;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelFromJson(json);

  @override
  Map<String, Object?> toJson() => toJson();

  EmployeeEntity toEntity() => .new(
    id: id,
    tenantId: tenantId,
    dateCreated: dateCreated,
    lastUpdated: lastUpdated,
    modifiedBy: modifiedBy,
    createdBy: createdBy,
    code: code,
    timekeepingCode: timekeepingCode,
    fullName: fullName,
    gender: gender,
    birthDate: birthDate,
    position: position,
    socialInsuranceCode: socialInsuranceCode,
    taxCode: taxCode,
    phoneNumber: phoneNumber,
    email: email,
    identityCard: identityCard,
    issuePlaceIdentityCard: issuePlaceIdentityCard,
    permanentAddress: permanentAddress,
    temporaryAddress: temporaryAddress,
    hireDate: hireDate,
    isResigned: isResigned,
    resignDate: resignDate,
    note: note,
    status: status,
    staffMetaDataLevel: staffMetaDataLevel,
    avatarPath: avatarPath != null
        ? '${Env.cdnEndPoint}/staffMetaData/avatar/$avatarPath'
        : null,
  );
}
