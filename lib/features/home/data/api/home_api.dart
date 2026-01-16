import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:zupa/core/data/request/member_vehicle/member_vehicle_request.dart';
import 'package:zupa/core/data/request/request.dart';
import 'package:zupa/core/data/response/success/success_response.dart';

part 'home_api.g.dart';

@RestApi()
abstract class HomeAPI {
  factory HomeAPI(Dio dio, {String? baseUrl, ParseErrorLogger? errorLogger}) =
      _HomeAPI;

  @GET('/hrm/staff-meta-data')
  Future<SuccessResponse> getList(@Queries() Request request);

  @GET('/hrm/staff-meta-data/{id}')
  Future<SuccessResponse> get(@Path('id') String id);

  @POST('/hrm/staff-meta-data')
  Future<SuccessResponse> create(@Body() MemberVehicleRequest request);

  @DELETE('/hrm/staff-meta-data/{id}')
  Future<SuccessResponse> delete(@Path('id') String id);
}
