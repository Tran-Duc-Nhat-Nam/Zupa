
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/parking/data/model/parking_lot.dart';

abstract class IParkingLotRepository {
  Future<NetworkState<List<ParkingLot>>> getParkingLots();
}
