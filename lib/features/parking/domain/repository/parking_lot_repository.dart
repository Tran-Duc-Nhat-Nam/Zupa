import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/features/parking/domain/entities/parking_lot_entity.dart';
import 'package:zupa/features/parking/domain/usecases/get_list/params/get_parking_lot_list_params.dart';

abstract class IParkingLotRepository {
  Future<RequestState<List<ParkingLotEntity>>> getParkingLots({
    required GetParkingLotListParams params,
    RequestToken? token,
  });

  Future<RequestState<ParkingLotEntity>> getParkingLot({
    required String id,
    RequestToken? token,
  });
}
