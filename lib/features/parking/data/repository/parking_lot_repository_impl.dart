import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/response/error/error_response.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/core/resource/request_mapper.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/core/services/request_service.dart';
import 'package:zupa/features/parking/data/api/parking_lot_api.dart';
import 'package:zupa/features/parking/data/model/filters/parking_lot_filter_model.dart';
import 'package:zupa/features/parking/data/model/parking_lot_model.dart';
import 'package:zupa/features/parking/domain/entities/parking_lot_entity.dart';
import 'package:zupa/features/parking/domain/repository/parking_lot_repository.dart';
import 'package:zupa/features/parking/domain/usecases/get_list/params/get_parking_lot_list_params.dart';

@LazySingleton(as: IParkingLotRepository)
class ParkingLotRepositoryImpl implements IParkingLotRepository {
  final ParkingLotAPI _api;
  final RequestService _networkService;

  ParkingLotRepositoryImpl(this._networkService, Dio dio)
    : _api = ParkingLotAPI(dio);

  @override
  Future<RequestState<List<ParkingLotEntity>>> getParkingLots({
    required GetParkingLotListParams params,
    RequestToken? token,
  }) async {
    final payload = ParkingLotFilterModel.fromEntity(params);

    final response = await _networkService.request(
      request: (cancelToken) =>
          _api.getList(payload: payload, cancelToken: cancelToken),
      token: token,
    );

    if (response is SuccessResponse<List<ParkingLotModel>>) {
      try {
        final parkingLots = response.data
            .map<ParkingLotEntity>((e) => e.toEntity())
            .toList();
        return .success(parkingLots);
      } catch (e) {
        return .error(e.toString());
      }
    } else if (response is ErrorResponse) {
      return response.toNetworkState<List<ParkingLotEntity>>();
    } else {
      return const .error('error');
    }
  }

  @override
  Future<RequestState<ParkingLotEntity>> getParkingLot({
    required String id,
    RequestToken? token,
  }) async {
    final response = await _networkService.request(
      request: (cancelToken) => _api.get(id: id, cancelToken: cancelToken),
      token: token,
    );

    if (response is SuccessResponse<ParkingLotModel>) {
      try {
        final parkingLot = response.data.toEntity();
        return .success(parkingLot);
      } catch (e) {
        return .error(e.toString());
      }
    } else if (response is ErrorResponse) {
      return response.toNetworkState<ParkingLotEntity>();
    } else {
      return const .error('error');
    }
  }
}
