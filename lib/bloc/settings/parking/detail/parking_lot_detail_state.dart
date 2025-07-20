part of 'parking_lot_detail_cubit.dart';

@freezed
class ParkingLotDetailState with _$ParkingLotDetailState {
  const factory ParkingLotDetailState.initial() = Initial;
  const factory ParkingLotDetailState.loading() = Loading;
  const factory ParkingLotDetailState.loaded(ParkingLot parkingLot) = Loaded;
  const factory ParkingLotDetailState.creating() = Creating;
  const factory ParkingLotDetailState.empty() = Empty;
  const factory ParkingLotDetailState.failed(String message) = Failed;
}
