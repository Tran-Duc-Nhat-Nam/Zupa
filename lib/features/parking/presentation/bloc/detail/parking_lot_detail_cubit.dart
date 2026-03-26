import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/features/parking/domain/entities/parking_lot_entity.dart';
import 'package:zupa/features/parking/presentation/models/parking_lot_detail_form.dart';

part 'parking_lot_detail_cubit.freezed.dart';
part 'parking_lot_detail_state.dart';

@injectable
class ParkingLotDetailCubit extends Cubit<ParkingLotDetailState> {
  ParkingLotDetailCubit() : super(const .initial());

  final formModel = ParkingLotDetailForm(
    ParkingLotDetailForm.formElements(ParkingLotDetail()),
    null,
    null,
  );

  Future<void> init(ParkingLotEntity? parkingLot) async {
    emit(const .loading());
    await Future.delayed(const .new(seconds: 2));
    emit(parkingLot != null ? .loaded(parkingLot) : const .creating());
  }
}
