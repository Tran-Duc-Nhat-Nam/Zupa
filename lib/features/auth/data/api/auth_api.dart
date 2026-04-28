import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zupa/core/data/models/user/user.dart';
import 'package:zupa/core/data/request/account/account_request.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/features/auth/data/models/requests/change_password_request.dart';
import 'package:zupa/features/auth/data/models/responses/auth_response.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthAPI {
  factory AuthAPI(Dio dio, {String? baseUrl, ParseErrorLogger? errorLogger}) =
      _AuthAPI;

  @POST('/account/auth/login')
  Future<AuthResponse> login({
    @Body() required AccountRequest payload,
    @CancelRequest() CancelToken? cancelToken,
  });

  @PUT('/core/staffs/{id}/updatePassword')
  Future<SuccessResponse<User>> changePassword({
    @Path('id') required String id,
    @Body() required ChangePasswordRequest payload,
    @CancelRequest() CancelToken? cancelToken,
  });
}
