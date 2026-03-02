import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zupa/core/data/request/request.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/features/parking/data/model/parking_lot.dart';

part 'parking_lot_api.g.dart';

@RestApi()
abstract class ParkingLotAPI {
  factory ParkingLotAPI(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _ParkingLotAPI;

  @GET('/hrm/staff-meta-data')
  Future<SuccessResponse<List<ParkingLot>>> getList(@Queries() Request request);

  @GET('/hrm/staff-meta-data/{id}')
  Future<SuccessResponse<ParkingLot>> get(@Path('id') String id);
}
