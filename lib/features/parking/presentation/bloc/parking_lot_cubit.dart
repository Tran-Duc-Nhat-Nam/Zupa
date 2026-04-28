import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/constants/query.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/features/parking/domain/entities/parking_lot_entity.dart';
import 'package:zupa/features/parking/domain/usecases/get_list/get_parking_lot_list_usecase.dart';

part 'parking_lot_cubit.freezed.dart';
part 'parking_lot_state.dart';

@injectable
class ParkingLotCubit extends Cubit<ParkingLotState> {
  final GetParkingLotListUseCase _getParkingLotList;
  RequestToken? _getToken;

  ParkingLotCubit(this._getParkingLotList) : super(const .initial());

  Future<void> init() async {
    emit(const .loading());
    _getToken?.cancel();
    _getToken = .new();
    final result = await _getParkingLotList(
      params: .initial(),
      token: _getToken,
    );

    if (isClosed) return;

    result.whenOrNull(
      success: (data) => emit(.loaded(data, defaultPageIndex)),
      error: (message) => emit(.failed(message)),
    );
  }

  @override
  Future<void> close() {
    _getToken?.cancel();
    return super.close();
  }
}
