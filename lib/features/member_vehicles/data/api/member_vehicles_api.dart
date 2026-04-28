import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/features/member_vehicles/data/models/filter/member_vehicles_filter_model.dart';
import 'package:zupa/features/member_vehicles/data/models/member_vehicle_model.dart';

part 'member_vehicles_api.g.dart';

@RestApi()
abstract class MemberVehiclesAPI {
  factory MemberVehiclesAPI(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _MemberVehiclesAPI;

  @GET('/member-vehicles')
  Future<SuccessResponse<List<MemberVehicleModel>>> getMemberVehicles({
    @Queries() required MemberVehiclesFilterModel payload,
    @CancelRequest() CancelToken? cancelToken,
  });

  @GET('/hrm/staff-meta-data/{id}')
  Future<SuccessResponse<MemberVehicleModel>> getMemberVehicle({
    @Path('id') required String id,
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST('/hrm/staff-meta-data')
  Future<SuccessResponse> createMemberVehicle({
    @Body() required MemberVehicleModel payload,
    @CancelRequest() CancelToken? cancelToken,
  });

  @PUT('/hrm/staff-meta-data')
  Future<SuccessResponse> updateMemberVehicle({
    @Body() required MemberVehicleModel payload,
    @CancelRequest() CancelToken? cancelToken,
  });

  @DELETE('/hrm/staff-meta-data/{id}')
  Future<SuccessResponse> deleteMemberVehicle({
    @Path('id') required String id,
    @CancelRequest() CancelToken? cancelToken,
  });
}
