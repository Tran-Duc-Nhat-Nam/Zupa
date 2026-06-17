import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/features/employee_management/domain/usecase/get_info/get_employee_info_params.dart';

part 'get_employee_info_request_model.freezed.dart';
part 'get_employee_info_request_model.g.dart';

@freezed
sealed class GetEmployeeInfoRequest with _$GetEmployeeInfoRequest {
  const factory GetEmployeeInfoRequest({@JsonKey(name: 'id') required int id}) =
      _GetEmployeeInfoRequest;

  factory GetEmployeeInfoRequest.fromJson(Map<String, Object?> json) =>
      _$GetEmployeeInfoRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();

  factory GetEmployeeInfoRequest.fromParams(GetEmployeeInfoParams params) =>
      .new(id: params.id);
}
