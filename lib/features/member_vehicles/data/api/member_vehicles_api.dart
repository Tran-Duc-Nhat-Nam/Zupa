import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/features/member_vehicles/data/models/member_vehicle.dart';

part 'member_vehicles_api.g.dart';

@RestApi()
abstract class MemberVehiclesAPI {
  factory MemberVehiclesAPI(Dio dio, {String? baseUrl, ParseErrorLogger? errorLogger}) =
      _MemberVehiclesAPI;

  @GET('/member-vehicles')
  Future<SuccessResponse> getMemberVehicles(
    @Query('page') String? page,
    @Query('keyword') String? keyword,
    @Query('type') String? type,
    @Query('time') String? time,
  );

  @GET('/hrm/staff-meta-data/{id}')
  Future<SuccessResponse> getMemberVehicle(@Path('id') String id);

  @POST('/hrm/staff-meta-data')
  Future<SuccessResponse> createMemberVehicle(@Body() MemberVehicle request);

  @DELETE('/hrm/staff-meta-data/{id}')
  Future<SuccessResponse> deleteMemberVehicle(@Path('id') String id);
}

