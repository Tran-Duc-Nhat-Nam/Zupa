import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:zupa/features/auth/data/models/account_request.dart';
import 'package:zupa/data/request/request.dart';
import 'package:zupa/data/response/success/success_response.dart';

part 'revenue_api.g.dart';

@RestApi()
abstract class RevenueAPI {
  factory RevenueAPI(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _RevenueAPI;

  @GET('/hrm/staff-meta-data')
  Future<SuccessResponse> getList(@Queries() Request request);

  @GET('/hrm/staff-meta-data/{id}')
  Future<SuccessResponse> get(@Path('id') String id);

  @POST('/hrm/staff-meta-data')
  Future<SuccessResponse> create(@Body() AccountRequest request);

  @DELETE('/hrm/staff-meta-data/{id}')
  Future<SuccessResponse> delete(@Path('id') String id);
}
