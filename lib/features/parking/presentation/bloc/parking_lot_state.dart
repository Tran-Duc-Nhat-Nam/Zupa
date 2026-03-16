part of 'parking_lot_cubit.dart';

@freezed
sealed class ParkingLotState with _$ParkingLotState {
  const factory ParkingLotState.initial() = Initial;
  const factory ParkingLotState.loading() = Loading;
  const factory ParkingLotState.refreshing(List<ParkingLotEntity> parkingLots) =
      Refreshing;
  const factory ParkingLotState.loadingMore(List<ParkingLotEntity> parkingLots) =
      LoadingMore;
  const factory ParkingLotState.loaded(
    List<ParkingLotEntity> parkingLots,
    int pageIndex,
  ) = Loaded;
  const factory ParkingLotState.failed(String message) = Failed;
  const factory ParkingLotState.empty() = Empty;
  const factory ParkingLotState.unauthenticated() = Unauthenticated;

}

