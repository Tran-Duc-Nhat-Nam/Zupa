import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/features/employee_management/data/model/employee_model.dart';
import 'package:zupa/features/employee_management/data/model/request/get_employee_list_request_model.dart';
import 'package:zupa/features/employee_management/data/model/request/update_employee_info_request_model.dart';

part 'employee_api.g.dart';

@RestApi()
abstract class EmployeeAPI {
  factory EmployeeAPI(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _EmployeeAPI;

  @GET('/hrm/staff-meta-data')
  Future<SuccessResponse<List<EmployeeModel>>> getEmployeeList({
    @Queries() required GetEmployeeListRequest params,
    @CancelRequest() CancelToken? cancelToken,
  });

  @GET('/hrm/staff-meta-data/{id}')
  Future<SuccessResponse<EmployeeModel>> getEmployeeInfo({
    @Path('id') required int id,
    @CancelRequest() CancelToken? cancelToken,
  });

  @PUT('/hrm/staff-meta-data/{id}')
  Future<SuccessResponse<EmployeeModel>> updateEmployeeInfo({
    @Path('id') required int id,
    @Body() required UpdateEmployeeInfoRequest body,
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST('/hrm/upload/staff-meta-data/{id}/avatar')
  @MultiPart()
  Future<SuccessResponse<String>> updateAvatar({
    @Path('id') required int id,
    @Part() required MultipartFile avatar,
    @CancelRequest() CancelToken? cancelToken,
  });
}
