import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/model/parking_lot/parking_lot.dart';

part 'parking_lot_detail_state.dart';
part 'parking_lot_detail_cubit.freezed.dart';

class ParkingLotDetailCubit extends Cubit<ParkingLotDetailState> {
  ParkingLotDetailCubit() : super(const ParkingLotDetailState.initial());

  Future<void> init(ParkingLot? parkingLot) async {
    emit(const ParkingLotDetailState.loading());
    await Future.delayed(const Duration(seconds: 2));
    emit(parkingLot != null ? ParkingLotDetailState.loaded(parkingLot) : const ParkingLotDetailState.creating());
  }
}
