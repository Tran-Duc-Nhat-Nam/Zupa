import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/parking/domain/entities/parking_lot_entity.dart';
import 'package:zupa/features/parking/domain/repository/parking_lot_repository.dart';

@injectable
class GetParkingLotListUseCase {
  final IParkingLotRepository _repository;

  GetParkingLotListUseCase(this._repository);

  Future<NetworkState<List<ParkingLotEntity>>> call() async {
    return _repository.getParkingLots();
  }
}
