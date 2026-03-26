import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zupa/core/data/request/account/account_request.dart';
import 'package:zupa/features/auth/data/models/auth_response.dart';

part 'account_api.g.dart';

@RestApi()
abstract class AccountAPI {
  factory AccountAPI(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _AccountAPI;

  @POST('/account/auth/login')
  Future<AuthResponse> login(@Body() AccountRequest request);
}
