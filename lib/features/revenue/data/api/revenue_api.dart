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

  @GET('')
  Future<SuccessResponse<List<DailyRevenueModel>>> getList({
    @Queries() required RevenueFilterModel payload,
    @CancelRequest() CancelToken? cancelToken,
  });

  @GET('/{id}')
  Future<SuccessResponse<DailyRevenueModel>> get({
    @Path('id') required String id,
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST('')
  Future<SuccessResponse> create({
    @Body() required DailyRevenueModel payload,
    @CancelRequest() CancelToken? cancelToken,
  });

  @DELETE('/{id}')
  Future<SuccessResponse> delete({
    @Path('id') required String id,
    @CancelRequest() CancelToken? cancelToken,
  });
}
