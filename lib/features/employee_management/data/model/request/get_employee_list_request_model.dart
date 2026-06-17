import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/features/employee_management/domain/usecase/get_list/get_employee_list_params.dart';

part 'get_employee_list_request_model.freezed.dart';
part 'get_employee_list_request_model.g.dart';

@freezed
sealed class GetEmployeeListRequest with _$GetEmployeeListRequest {
  const factory GetEmployeeListRequest({
    @JsonKey(name: 'page') required int pageIndex,
    @JsonKey(name: 'size') required int pageSize,
  }) = _GetEmployeeListRequest;

  factory GetEmployeeListRequest.fromJson(Map<String, Object?> json) =>
      _$GetEmployeeListRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();

  factory GetEmployeeListRequest.fromParams(GetEmployeeListParams params) =>
      .new(pageIndex: params.pageIndex, pageSize: params.pageSize);
}
