import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/features/parking/data/model/filters/parking_lot_filter_model.dart';
import 'package:zupa/features/parking/data/model/parking_lot_model.dart';

part 'parking_lot_api.g.dart';

@RestApi()
abstract class ParkingLotAPI {
  factory ParkingLotAPI(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _ParkingLotAPI;

  @GET('/hrm/staff-meta-data')
  Future<SuccessResponse<List<ParkingLotModel>>> getList({
    @Queries() required ParkingLotFilterModel payload,
    @CancelRequest() CancelToken? cancelToken,
  });

  @GET('/hrm/staff-meta-data/{id}')
  Future<SuccessResponse<ParkingLotModel>> get({
    @Path('id') required String id,
    @CancelRequest() CancelToken? cancelToken,
  });
}
