import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zupa/core/data/response/success/success_response.dart';

part 'parking_lot_api.g.dart';

@RestApi()
abstract class ParkingLotAPI {
  factory ParkingLotAPI(Dio dio, {String? baseUrl, ParseErrorLogger? errorLogger}) =
      _ParkingLotAPI;

  @GET('/member-vehicles')
  Future<SuccessResponse> getParkingLots(
    @Query('page') String? page,
    @Query('keyword') String? keyword,
    @Query('type') String? type,
    @Query('time') String? time,
  );
}

