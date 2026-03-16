import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/features/history/data/models/filter/history_filter_model.dart';
import 'package:zupa/features/history/data/models/history_ticket_model.dart';

part 'history_api.g.dart';

@RestApi()
abstract class HistoryAPI {
  factory HistoryAPI(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _HistoryAPI;

  @GET('/bill/receivedReceipt')
  Future<SuccessResponse<List<HistoryTicketModel>>> getList(@Queries() HistoryFilterModel request);

  @GET('/received/{id}')
  Future<SuccessResponse<HistoryTicketModel>> get(@Path('id') String id);

  @POST('/bill/received')
  Future<SuccessResponse> create(@Body() HistoryTicketModel request);

  @DELETE('/bill/receipts/updateStatus/{id}')
  Future<SuccessResponse> delete(@Path('id') String id);
}
