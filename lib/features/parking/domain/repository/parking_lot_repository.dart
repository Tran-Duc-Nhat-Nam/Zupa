import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/parking/domain/entities/parking_lot_entity.dart';

abstract class IParkingLotRepository {
  Future<NetworkState<List<ParkingLotEntity>>> getParkingLots();
}
