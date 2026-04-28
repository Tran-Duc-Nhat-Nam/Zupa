import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee.freezed.dart';
part 'employee.g.dart';

@freezed
sealed class Employee with _$Employee {
  factory Employee({
    @Default(0) int id,
    @Default(0) int tenantId,
    @Default('') String dateCreated,
    @Default('') String lastUpdated,
    @Default('') String modifiedBy,
    @Default('') String createdBy,
    @Default('') String code,
    @Default(null) String? timekeepingCode,
    @Default('') String fullName,
    @Default('') String gender,
    @Default(null) String? birthDate,
    @Default('') String position,
    @Default('') String socialInsuranceCode,
    @Default(null) String? taxCode,
    @Default('') String phoneNumber,
    @Default('') String email,
    @Default('') String identityCard,
    @Default('') String issueDateIdentityCard,
    @Default('') String issuePlaceIdentityCard,
    @Default('') String permanentAddress,
    @Default('') String temporaryAddress,
    @Default(null) String? hireDate,
    @Default(false) bool isResigned,
    @Default(null) String? resignDate,
    @Default(null) String? note,
    @Default('') String status,
    @Default('') String staffMetaDataLevel,
    @Default(null) String? avatarPath,
  }) = _Employee;

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
}
