import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/parking/data/model/parking_lot.dart';
import 'package:zupa/features/parking/domain/repository/parking_lot_repository.dart';

part 'parking_lot_state.dart';
part 'parking_lot_cubit.freezed.dart';

@injectable
class ParkingLotCubit extends Cubit<ParkingLotState> {
  final IParkingLotRepository _repository;

  ParkingLotCubit(this._repository) : super(const .initial());

  Future<void> init() async {
    emit(const .loading());
    final result = await _repository.getParkingLots();
    
    result.whenOrNull(
      success: (data) => emit(.loaded(data, 0)),
      error: (message) => emit(.failed(message)),
    );
  }
}

