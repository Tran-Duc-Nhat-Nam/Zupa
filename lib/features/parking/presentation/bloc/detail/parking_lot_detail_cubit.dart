import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/features/parking/data/model/parking_lot.dart';
import 'package:zupa/features/parking/presentation/models/parking_lot_detail_form.dart';

part 'parking_lot_detail_state.dart';
part 'parking_lot_detail_cubit.freezed.dart';

@injectable
class ParkingLotDetailCubit extends Cubit<ParkingLotDetailState> {
  ParkingLotDetailCubit() : super(const .initial());

  final formModel = ParkingLotDetailForm(
    ParkingLotDetailForm.formElements(ParkingLotDetail()),
    null,
    null
  );

  Future<void> init(ParkingLot? parkingLot) async {
    emit(const .loading());
    await Future.delayed(const .new(seconds: 2));
    emit(parkingLot != null ? .loaded(parkingLot) : const .creating());
  }
}
