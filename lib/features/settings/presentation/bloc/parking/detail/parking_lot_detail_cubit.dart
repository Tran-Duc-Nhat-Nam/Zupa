import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:zupa/features/settings/data/models/parking_lot.dart';

part 'parking_lot_detail_state.dart';
part 'parking_lot_detail_cubit.freezed.dart';

@injectable
class ParkingLotDetailCubit extends Cubit<ParkingLotDetailState> {
  ParkingLotDetailCubit() : super(const .initial());

  Future<void> init(ParkingLot? parkingLot) async {
    emit(const .loading());
    await Future.delayed(const .new(seconds: 2));
    emit(parkingLot != null ? .loaded(parkingLot) : const .creating());
  }
}
