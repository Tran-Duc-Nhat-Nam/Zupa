import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/models/request/request_state.dart';
import 'package:zupa/core/data/models/request/request_token.dart';
import 'package:zupa/features/parking/domain/entities/parking_lot_entity.dart';
import 'package:zupa/features/parking/domain/usecases/get_detail/get_parking_lot_usecase.dart';

part 'parking_lot_detail_cubit.freezed.dart';
part 'parking_lot_detail_state.dart';

@injectable
class ParkingLotDetailCubit extends Cubit<ParkingLotDetailState> {
  final GetParkingLotUseCase _getParkingLot;
  RequestToken? _getToken;

  ParkingLotDetailCubit(this._getParkingLot) : super(const .initial());

  Future<void> init({String? id}) async {
    if (id == null) {
      emit(const .creating());
    } else {
      emit(const .loading());
      _getToken?.cancel();
      _getToken = .new();
      final result = await _getParkingLot(id: id, token: _getToken);

      switch (result) {
        case Success(:final data):
          try {
            emit(.loaded(data));
          } catch (e) {
            emit(const .empty());
          }
        case Error(:final message):
          emit(.failed(message));
        default:
          emit(const .failed('error'));
      }
    }
  }

  @override
  Future<void> close() {
    _getToken?.cancel();
    return super.close();
  }
}
