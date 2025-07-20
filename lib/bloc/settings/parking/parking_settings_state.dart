part of 'parking_settings_cubit.dart';

@freezed
sealed class ParkingSettingsState with _$ParkingSettingsState {

  const factory ParkingSettingsState.initial() = Initial;
  const factory ParkingSettingsState.loading() = Loading;
  const factory ParkingSettingsState.refreshing(List<ParkingLot> parkingLots) = Refreshing;
  const factory ParkingSettingsState.loadingMore(List<ParkingLot> parkingLots) = LoadingMore;
  const factory ParkingSettingsState.loaded(List<ParkingLot> parkingLots, int pageIndex) = Loaded;
  const factory ParkingSettingsState.failed(String message) = Failed;
  const factory ParkingSettingsState.empty() = Emtpy;
}
