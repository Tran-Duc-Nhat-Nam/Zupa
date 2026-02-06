import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zupa/core/data/response/success/success_response.dart';

part 'password_api.g.dart';

@RestApi()
abstract class PasswordAPI {
  factory PasswordAPI(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _PasswordAPI;

  @PUT('/hrm/staff-meta-data')
  Future<SuccessResponse> changePassword(
    @Query('currentPassword') String currentPassword,
    @Query('newPassword') String newPassword,
  );
}
