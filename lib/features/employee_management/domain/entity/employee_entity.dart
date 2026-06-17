class EmployeeEntity {
  final int id;
  final int tenantId;
  final String dateCreated;
  final String lastUpdated;
  final String modifiedBy;
  final String createdBy;
  final String code;
  final String? timekeepingCode;
  final String fullName;
  final String gender;
  final String? birthDate;
  final String position;
  final String socialInsuranceCode;
  final String? taxCode;
  final String phoneNumber;
  final String email;
  final String identityCard;
  final String issuePlaceIdentityCard;
  final String permanentAddress;
  final String temporaryAddress;
  final String? hireDate;
  final bool isResigned;
  final String? resignDate;
  final String? note;
  final String status;
  final String staffMetaDataLevel;
  final String? avatarPath;

  const EmployeeEntity({
    required this.id,
    required this.tenantId,
    required this.dateCreated,
    required this.lastUpdated,
    required this.modifiedBy,
    required this.createdBy,
    required this.code,
    this.timekeepingCode,
    required this.fullName,
    required this.gender,
    this.birthDate,
    required this.position,
    required this.socialInsuranceCode,
    this.taxCode,
    required this.phoneNumber,
    required this.email,
    required this.identityCard,
    required this.issuePlaceIdentityCard,
    required this.permanentAddress,
    required this.temporaryAddress,
    this.hireDate,
    required this.isResigned,
    this.resignDate,
    this.note,
    required this.status,
    required this.staffMetaDataLevel,
    this.avatarPath,
  });
}
