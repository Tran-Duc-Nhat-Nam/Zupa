import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zupa/core/data/response/success/success_response.dart';

part 'employee_api.g.dart';

@RestApi()
abstract class EmployeeAPI {
  factory EmployeeAPI(Dio dio, {String? baseUrl, ParseErrorLogger? errorLogger}) =
      _EmployeeAPI;

  @GET('/hrm/staff-meta-data')
  Future<SuccessResponse> getEmployees();
}

