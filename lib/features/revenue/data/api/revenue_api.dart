import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/features/revenue/data/models/daily_revenue_model.dart';
import 'package:zupa/features/revenue/data/models/filter/revenue_filter_model.dart';

part 'revenue_api.g.dart';

@RestApi()
abstract class RevenueAPI {
  factory RevenueAPI(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _RevenueAPI;

  @GET('/delivery')
  Future<SuccessResponse<List<DailyRevenueModel>>> getList(
    @Queries() RevenueFilterModel request,
  );

  @GET('/delivery/{id}')
  Future<SuccessResponse<DailyRevenueModel>> get(@Path('id') String id);

  @POST('/delivery')
  Future<SuccessResponse> create(@Body() DailyRevenueModel request);

  @DELETE('/delivery/{id}')
  Future<SuccessResponse> delete(@Path('id') String id);
}
