import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
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
  Future<NetworkState<List<ParkingLot>>> getParkingLots() async {
    // Returning mock data as originally implemented in the cubit
    return .success([
      ParkingLot(
        id: '1',
        name: 'Bãi xe A',
        capacity: [
          .new(vehicleType: vehicleTypes[0], capacity: 100, available: 50),
          .new(vehicleType: vehicleTypes[1], capacity: 200, available: 150),
        ],
      ),
      ParkingLot(
        id: '2',
        name: 'Bãi xe B',
        capacity: [
          .new(vehicleType: vehicleTypes[0], capacity: 50, available: 20),
          .new(vehicleType: vehicleTypes[1], capacity: 100, available: 80),
        ],
      ),
    ]);
  }
}
