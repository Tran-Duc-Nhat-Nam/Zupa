import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/response/error/error_response.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/core/services/network_service.dart';
import 'package:zupa/features/parking/data/api/parking_lot_api.dart';
import 'package:zupa/features/parking/data/model/parking_lot.dart';
import 'package:zupa/features/parking/domain/repository/parking_lot_repository.dart';

@LazySingleton(as: IParkingLotRepository)
class ParkingLotRepositoryImpl implements IParkingLotRepository {
  final ParkingLotAPI _api;
  final NetworkService _networkService;

  ParkingLotRepositoryImpl(this._networkService, Dio dio)
    : _api = ParkingLotAPI(dio);

  @override
  Future<NetworkState<List<ParkingLot>>> getParkingLots({
    int page = 0,
    int pageSize = 10,
  }) async {
    final response = await _networkService.request(
      (dio) => _api.getList(.new(page: page, size: pageSize, query: {})),
    );

    if (response is SuccessResponse<List<ParkingLot>>) {
      try {
        final List<ParkingLot> parkingLots = response.data;
        return .success(parkingLots);
      } catch (e) {
        return .error(e.toString());
      }
    } else if (response is ErrorResponse) {
      if (response.code == 4001) {
        return const .unauthenticated();
      } else {
        return .error(response.message);
      }
    } else {
      return const .error('error');
    }
  }
}
