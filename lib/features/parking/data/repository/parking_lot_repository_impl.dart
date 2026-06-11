import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_response.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/core/services/request_service.dart';
import 'package:zupa/features/parking/data/api/parking_lot_api.dart';
import 'package:zupa/features/parking/domain/entities/parking_lot_entity.dart';
import 'package:zupa/features/parking/domain/repository/parking_lot_repository.dart';
import 'package:zupa/features/parking/domain/usecases/get_list/params/get_parking_lot_list_params.dart';

@LazySingleton(as: IParkingLotRepository)
class ParkingLotRepositoryImpl
    with RequestService
    implements IParkingLotRepository {
  final ParkingLotAPI _api;

  ParkingLotRepositoryImpl(this._api);

  @override
  Future<RequestState<List<ParkingLotEntity>>> getParkingLots({
    required GetParkingLotListParams params,
    RequestToken? token,
  }) async {
    final response = await request(
      request: (cancelToken) =>
          _api.getList(payload: .fromEntity(params), cancelToken: cancelToken),
      token: token,
    );

    return response.when(
      success: (data) => Success(data.data.map((e) => e.toEntity()).toList()),
      failure: (error) => Error(error.errorMessage),
      cancelled: () => const Error('cancelled'),
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

    return response.when(
      success: (data) => Success(data.data.toEntity()),
      failure: (error) => Error(error.errorMessage),
      cancelled: () => const Error('cancelled'),
    );
  }
}
