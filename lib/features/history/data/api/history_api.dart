import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:zupa/core/data/request/member_vehicle/member_vehicle_request.dart';
import 'package:zupa/core/data/request/request.dart';
import 'package:zupa/core/data/response/success/success_response.dart';

part 'history_api.g.dart';

@RestApi()
abstract class HistoryAPI {
  factory HistoryAPI(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _HistoryAPI;

  @GET('/bill/receivedReceipt')
  Future<SuccessResponse> getList(@Queries() Request request);

  @GET('/received/{id}')
  Future<SuccessResponse> get(@Path('id') String id);

  @POST('/bill/received')
  Future<SuccessResponse> create(@Body() MemberVehicleRequest request);

  @DELETE('/bill/receipts/updateStatus/{id}')
  Future<SuccessResponse> delete(@Path('id') String id);
}
