import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/features/parking/domain/entities/parking_lot_entity.dart';
import 'package:zupa/features/parking/domain/repository/parking_lot_repository.dart';

@injectable
class GetParkingLotUseCase {
  final IParkingLotRepository _repository;

  GetParkingLotUseCase(this._repository);

  Future<RequestState<ParkingLotEntity>> call({required String id}) async {
    return _repository.getParkingLot(id: id);
  }
}
