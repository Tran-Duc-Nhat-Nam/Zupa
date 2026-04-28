import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zupa/core/data/request/member_vehicle/member_vehicle_request.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/features/home/data/models/filter/home_filter_model.dart';
import 'package:zupa/features/home/data/models/ticket_model.dart';

part 'home_api.g.dart';

@RestApi()
abstract class HomeAPI {
  factory HomeAPI(Dio dio, {String? baseUrl, ParseErrorLogger? errorLogger}) =
      _HomeAPI;

  @GET('/hrm/staff-meta-data')
  Future<SuccessResponse<List<HomeTicketModel>>> getList({
    @Queries() required HomeFilterModel payload,
    @CancelRequest() CancelToken? cancelToken,
  });

  @GET('/hrm/staff-meta-data/{id}')
  Future<SuccessResponse<HomeTicketModel>> get({
    @Path('id') required String id,
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST('/hrm/staff-meta-data')
  Future<SuccessResponse> create({
    @Body() required MemberVehicleRequest request,
    @CancelRequest() CancelToken? cancelToken,
  });

  @DELETE('/hrm/staff-meta-data/{id}')
  Future<SuccessResponse> delete({
    @Path('id') required String id,
    @CancelRequest() CancelToken? cancelToken,
  });
}
