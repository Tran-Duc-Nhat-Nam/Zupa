import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:zupa/data/request/member_vehicle/member_vehicle_request.dart';
import 'package:zupa/data/request/request.dart';
import 'package:zupa/data/response/success/success_response.dart';

part 'history_api.g.dart';

@RestApi()
abstract class HistoryAPI {
  factory HistoryAPI(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _HistoryAPI;

  @GET('/hrm/staff-meta-data')
  Future<SuccessResponse> getList(@Queries() Request request);

  @GET('/hrm/staff-meta-data/{id}')
  Future<SuccessResponse> get(@Path('id') String id);

  @POST('/hrm/staff-meta-data')
  Future<SuccessResponse> create(@Body() MemberVehicleRequest request);

  @DELETE('/hrm/staff-meta-data/{id}')
  Future<SuccessResponse> delete(@Path('id') String id);
}
