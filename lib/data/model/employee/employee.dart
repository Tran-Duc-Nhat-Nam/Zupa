import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee.freezed.dart';
part 'employee.g.dart';

@freezed
sealed class Employee with _$Employee {
  factory Employee({
    @Default(0) int id,
    @Default(0) int tenantId,
    @Default('N/A') String dateCreated,
    @Default('N/A') String lastUpdated,
    @Default('N/A') String modifiedBy,
    @Default('N/A') String createdBy,
    @Default('N/A') String code,
    @Default(null) String? timekeepingCode,
    @Default('N/A') String fullName,
    @Default('N/A') String gender,
    @Default(null) String? birthDate,
    @Default('N/A') String position,
    @Default('N/A') String socialInsuranceCode,
    @Default(null) String? taxCode,
    @Default('N/A') String phoneNumber,
    @Default('N/A') String email,
    @Default('N/A') String identityCard,
    @Default('N/A') String issueDateIdentityCard,
    @Default('N/A') String issuePlaceIdentityCard,
    @Default('N/A') String permanentAddress,
    @Default('N/A') String temporaryAddress,
    @Default(null) String? hireDate,
    @Default(false) bool isResigned,
    @Default(null) String? resignDate,
    @Default(null) String? note,
    @Default('N/A') String status,
    @Default('N/A') String staffMetaDataLevel,
    @Default(null) String? avatarPath,
  }) = _Employee;

  factory Employee.fromJson(Map<String, dynamic> json) => _$EmployeeFromJson(json);
}
