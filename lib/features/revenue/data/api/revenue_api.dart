import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:zupa/features/auth/data/models/account_request.dart';
import 'package:zupa/core/data/request/request.dart';
import 'package:zupa/core/data/response/success/success_response.dart';

part 'revenue_api.g.dart';

@RestApi()
abstract class RevenueAPI {
  factory RevenueAPI(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _RevenueAPI;

  @GET('/delivery')
  Future<SuccessResponse> getList(@Queries() Request request);

  @GET('/delivery/{id}')
  Future<SuccessResponse> get(@Path('id') String id);

  @POST('/delivery')
  Future<SuccessResponse> create(@Body() AccountRequest request);

  @DELETE('/delivery/{id}')
  Future<SuccessResponse> delete(@Path('id') String id);
}
