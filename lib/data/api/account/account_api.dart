import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../request/account/account_request.dart';


part 'account_api.g.dart';

@RestApi()
abstract class AccountAPI {
  factory AccountAPI(Dio dio, {String? baseUrl, ParseErrorLogger? errorLogger}) =
  _AccountAPI;

  @POST('/account')
  Future<dynamic> login(@Body() AccountRequest request);
}
