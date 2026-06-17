import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/features/employee_management/domain/usecase/update/update_employee_params.dart';

part 'update_employee_info_request_model.freezed.dart';
part 'update_employee_info_request_model.g.dart';

@freezed
sealed class UpdateEmployeeInfoRequest with _$UpdateEmployeeInfoRequest {
  const factory UpdateEmployeeInfoRequest({
    @JsonKey(name: 'code') required String code,
    @JsonKey(name: 'fullName') required String fullName,
    @JsonKey(name: 'position') required String position,
    @JsonKey(name: 'departmentCode') required String departmentCode,
    @JsonKey(name: 'staffMetaDataLevel') required String staffMetaDataLevel,
    @JsonKey(name: 'phoneNumber') required String phoneNumber,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'note') String? note,
    @JsonKey(name: 'gender') required String gender,
    @JsonKey(name: 'socialInsuranceCode') required String socialInsuranceCode,
    @JsonKey(name: 'taxCode') required String taxCode,
    @JsonKey(name: 'identityCard') required String identityCard,
    @JsonKey(name: 'issuePlaceIdentityCard') String? issuePlaceIdentityCard,
    @JsonKey(name: 'permanentAddress') String? permanentAddress,
    @JsonKey(name: 'temporaryAddress') String? temporaryAddress,
    @JsonKey(name: 'isResigned') required bool isResigned,
  }) = _UpdateEmployeeInfoRequest;

  factory UpdateEmployeeInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateEmployeeInfoRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();

  factory UpdateEmployeeInfoRequest.fromParams(
    UpdateEmployeeInfoParams params,
  ) => .new(
    code: params.code,
    fullName: params.fullName,
    position: params.position,
    departmentCode: params.departmentCode,
    staffMetaDataLevel: params.staffMetaDataLevel,
    phoneNumber: params.phoneNumber,
    email: params.email,
    note: params.note,
    gender: params.gender,
    socialInsuranceCode: params.socialInsuranceCode,
    taxCode: params.taxCode,
    identityCard: params.identityCard,
    issuePlaceIdentityCard: params.issuePlaceIdentityCard,
    permanentAddress: params.permanentAddress,
    temporaryAddress: params.temporaryAddress,
    isResigned: params.isResigned,
  );
}
