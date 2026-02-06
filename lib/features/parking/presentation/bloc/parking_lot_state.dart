part of 'parking_lot_cubit.dart';

@freezed
sealed class ParkingLotState with _$ParkingLotState {
  const factory ParkingLotState.initial() = Initial;
  const factory ParkingLotState.loading() = Loading;
  const factory ParkingLotState.refreshing(List<ParkingLot> parkingLots) =
      Refreshing;
  const factory ParkingLotState.loadingMore(List<ParkingLot> parkingLots) =
      LoadingMore;
  const factory ParkingLotState.loaded(
    List<ParkingLot> parkingLots,
    int pageIndex,
  ) = Loaded;
  const factory ParkingLotState.failed(String message) = Failed;
  const factory ParkingLotState.empty() = Empty;
  const factory ParkingLotState.unauthenticated() = Unauthenticated;

}

