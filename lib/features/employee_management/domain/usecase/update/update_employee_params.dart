class UpdateEmployeeInfoParams {
  final int id;
  final String code;
  final String fullName;
  final String position;
  final String departmentCode;
  final String staffMetaDataLevel;
  final String phoneNumber;
  final String? email;
  final String? note;
  final String gender;
  final String socialInsuranceCode;
  final String taxCode;
  final String identityCard;
  final String? issuePlaceIdentityCard;
  final String? permanentAddress;
  final String? temporaryAddress;
  final bool isResigned;

  const UpdateEmployeeInfoParams({
    required this.id,
    required this.code,
    required this.fullName,
    required this.position,
    required this.departmentCode,
    required this.staffMetaDataLevel,
    required this.phoneNumber,
    this.email,
    this.note,
    required this.gender,
    required this.socialInsuranceCode,
    required this.taxCode,
    required this.identityCard,
    this.issuePlaceIdentityCard,
    this.permanentAddress,
    this.temporaryAddress,
    required this.isResigned,
  });
}
