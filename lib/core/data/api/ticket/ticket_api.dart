import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:zupa/core/data/request/request.dart';
import 'package:zupa/core/data/request/ticket/ticket_request.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/features/home/data/models/ticket.dart';

part 'ticket_api.g.dart';

@RestApi()
abstract class StaffAPI {
  factory StaffAPI(Dio dio, {String? baseUrl, ParseErrorLogger? errorLogger}) =
      _StaffAPI;

  @GET('/hrm/staff-meta-data')
  Future<SuccessResponse<List<HomeTicket>>> getList(@Queries() Request request);

  @GET('/hrm/staff-meta-data/{id}')
  Future<SuccessResponse<HomeTicket>> get(@Path('id') String id);

  @POST('/hrm/staff-meta-data')
  Future<SuccessResponse> create(@Body() TicketRequest request);

  @DELETE('/hrm/staff-meta-data/{id}')
  Future<SuccessResponse> delete(@Path('id') String id);
}
