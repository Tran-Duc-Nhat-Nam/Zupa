import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zupa/data/response/success/success_response.dart';

part 'settings_api.g.dart';

@RestApi()
abstract class SettingsAPI {
  factory SettingsAPI(Dio dio, {String? baseUrl, ParseErrorLogger? errorLogger}) =
      _SettingsAPI;

  @GET('/hrm/staff-meta-data')
  Future<SuccessResponse> getEmployees();

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
  Future<SuccessResponse> createMemberVehicle(@Body() Map<String, dynamic> request);

  @DELETE('/hrm/staff-meta-data/{id}')
  Future<SuccessResponse> deleteMemberVehicle(@Path('id') String id);
}

