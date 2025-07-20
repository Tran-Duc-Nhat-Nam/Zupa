import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/constants/vehicle_types.dart';
import '../../../data/model/parking_lot/capacity/parking_lot_capacity.dart';
import '../../../data/model/parking_lot/parking_lot.dart';

part 'parking_settings_state.dart';
part 'parking_settings_cubit.freezed.dart';

class ParkingSettingsCubit extends Cubit<ParkingSettingsState> {
  ParkingSettingsCubit() : super(const ParkingSettingsState.initial());

  Future<void> init() async {
    emit(const ParkingSettingsState.loading());
    await Future.delayed(const Duration(seconds: 2));
    final List<ParkingLot> parkingLots = [
      ParkingLot(
        id: '1',
        name: 'Parking Lot 1',
        capacity:
        vehicleTypes
            .map((e) => ParkingLotCapacity(vehicleType: e))
            .toList(),
      ),
      ParkingLot(
        id: '2',
        name: 'Parking Lot 2',
        capacity:
        vehicleTypes
            .map((e) => ParkingLotCapacity(vehicleType: e))
            .toList(),
      ),
      ParkingLot(
        id: '3',
        name: 'Parking Lot 3',
        capacity:
        vehicleTypes
            .map((e) => ParkingLotCapacity(vehicleType: e))
            .toList(),
      ),
    ];
    emit(
      ParkingSettingsState.loaded(parkingLots, 0),
    );
  }
}
