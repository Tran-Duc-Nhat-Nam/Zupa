import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_response.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/core/services/request_service.dart';
import 'package:zupa/features/parking/data/api/parking_lot_api.dart';
import 'package:zupa/features/parking/data/model/filters/parking_lot_filter_model.dart';
import 'package:zupa/features/parking/domain/entities/parking_lot_entity.dart';
import 'package:zupa/features/parking/domain/repository/parking_lot_repository.dart';
import 'package:zupa/features/parking/domain/usecases/get_list/params/get_parking_lot_list_params.dart';

@LazySingleton(as: IParkingLotRepository)
class ParkingLotRepositoryImpl
    with RequestService
    implements IParkingLotRepository {
  final ParkingLotAPI _api;

  ParkingLotRepositoryImpl(Dio dio) : _api = ParkingLotAPI(dio);

  @override
  Future<RequestState<List<ParkingLotEntity>>> getParkingLots({
    required GetParkingLotListParams params,
    RequestToken? token,
  }) async {
    final payload = ParkingLotFilterModel.fromEntity(params);

    final response = await request(
      request: (cancelToken) =>
          _api.getList(payload: payload, cancelToken: cancelToken),
      token: token,
    );

    return response.maybeWhen(
      success: (data) => .success(data.data.map((e) => e.toEntity()).toList()),
      failure: (error) => .error(error.errorMessage),
      cancelled: () => const .error('cancelled'),
      orElse: () => const .error('unknown_response'),
    );
  }

  @override
  Future<RequestState<ParkingLotEntity>> getParkingLot({
    required String id,
    RequestToken? token,
  }) async {
    final response = await request(
      request: (cancelToken) => _api.get(id: id, cancelToken: cancelToken),
      token: token,
    );

    return response.maybeWhen(
      success: (data) => .success(data.data.toEntity()),
      failure: (error) => .error(error.errorMessage),
      cancelled: () => const .error('cancelled'),
      orElse: () => const .error('unknown_response'),
    );
  }
}
