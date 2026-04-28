import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/features/parking/domain/entities/parking_lot_entity.dart';
import 'package:zupa/features/parking/domain/repository/parking_lot_repository.dart';
import 'package:zupa/features/parking/domain/usecases/get_list/params/get_parking_lot_list_params.dart';

@injectable
class GetParkingLotListUseCase {
  final IParkingLotRepository _repository;

  GetParkingLotListUseCase(this._repository);

  Future<RequestState<List<ParkingLotEntity>>> call({
    required GetParkingLotListParams params,
  }) async {
    return _repository.getParkingLots(params: params);
  }
}
