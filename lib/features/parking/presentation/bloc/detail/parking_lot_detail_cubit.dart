import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/features/parking/domain/entities/parking_lot_entity.dart';
import 'package:zupa/features/parking/domain/usecases/get_detail/get_parking_lot_usecase.dart';

part 'parking_lot_detail_cubit.freezed.dart';
part 'parking_lot_detail_state.dart';

@injectable
class ParkingLotDetailCubit extends Cubit<ParkingLotDetailState> {
  final GetParkingLotUseCase _getParkingLot;

  ParkingLotDetailCubit(this._getParkingLot) : super(const .initial());

  Future<void> init({String? id}) async {
    if (id == null) {
      emit(const .creating());
    } else {
      emit(const .loading());
      final result = await _getParkingLot(id: id);

      result.whenOrNull(
        success: (item) {
          try {
            emit(.loaded(item));
          } catch (e) {
            emit(const .empty());
          }
        },
        error: (message) => emit(.failed(message)),
      );
    }
  }
}
