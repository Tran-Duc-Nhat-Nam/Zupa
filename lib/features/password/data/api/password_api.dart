import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zupa/core/data/models/user/user.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/features/password/data/models/change_password_request.dart';

part 'password_api.g.dart';

@RestApi()
abstract class PasswordAPI {
  factory PasswordAPI(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _PasswordAPI;

  @PUT('/core/staffs/{id}/updatePassword')
  Future<SuccessResponse<User>> changePassword(
    @Path('id') String id,
    @Body() ChangePasswordRequest request,
  );
}
