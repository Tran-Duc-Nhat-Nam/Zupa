import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:zupa/features/employee_management/domain/entity/employee_entity.dart';
import 'package:zupa/features/employee_management/domain/usecase/update/update_employee_params.dart';

part 'employee_form.gform.dart';

@Rf()
class Employee {
  final int id;
  final String code;
  final String fullName;
  final String position;
  final String staffMetaDataLevel;
  final String phoneNumber;
  final String? email;
  final String? note;
  final String gender;
  final String socialInsuranceCode;
  final String? taxCode;
  final String identityCard;
  final String? issuePlaceIdentityCard;
  final String? permanentAddress;
  final String? temporaryAddress;
  final bool isResigned;

  const Employee({
    @RfControl(validators: [RequiredValidator()]) required this.id,
    @RfControl(validators: [RequiredValidator()]) required this.code,
    @RfControl(validators: [RequiredValidator()]) required this.fullName,
    @RfControl(validators: [RequiredValidator()]) required this.position,
    @RfControl(validators: [RequiredValidator()])
    required this.staffMetaDataLevel,
    @RfControl(validators: [RequiredValidator()]) required this.phoneNumber,
    @RfControl() this.email,
    @RfControl() this.note,
    @RfControl(validators: [RequiredValidator()]) required this.gender,
    @RfControl(validators: [RequiredValidator()])
    required this.socialInsuranceCode,
    @RfControl() this.taxCode,
    @RfControl(validators: [RequiredValidator()]) required this.identityCard,
    @RfControl() this.issuePlaceIdentityCard,
    @RfControl() this.permanentAddress,
    @RfControl() this.temporaryAddress,
    @RfControl(validators: [RequiredValidator()]) required this.isResigned,
  });

  // Factory Constructor to map data from EmployeeEntity to Form Model
  factory Employee.fromEntity(EmployeeEntity entity) => .new(
    id: entity.id,
    code: entity.code,
    fullName: entity.fullName,
    position: entity.position,
    staffMetaDataLevel: entity.staffMetaDataLevel,
    phoneNumber: entity.phoneNumber,
    email: entity.email.isEmpty ? null : entity.email,
    note: entity.note,
    gender: entity.gender,
    socialInsuranceCode: entity.socialInsuranceCode,
    taxCode: entity.taxCode,
    identityCard: entity.identityCard,
    issuePlaceIdentityCard: entity.issuePlaceIdentityCard,
    permanentAddress: entity.permanentAddress,
    temporaryAddress: entity.temporaryAddress,
    isResigned: entity.isResigned,
  );

  // Mapper Method to output Form Model values directly into SaveStaffParams
  UpdateEmployeeInfoParams toParams({String departmentCode = ''}) => .new(
    id: id,
    code: code,
    fullName: fullName,
    position: position,
    departmentCode: departmentCode,
    staffMetaDataLevel: staffMetaDataLevel,
    phoneNumber: phoneNumber,
    email: email,
    note: note,
    gender: gender,
    socialInsuranceCode: socialInsuranceCode,
    taxCode: taxCode ?? '',
    identityCard: identityCard,
    issuePlaceIdentityCard: issuePlaceIdentityCard,
    permanentAddress: permanentAddress,
    temporaryAddress: temporaryAddress,
    isResigned: isResigned,
  );
}
