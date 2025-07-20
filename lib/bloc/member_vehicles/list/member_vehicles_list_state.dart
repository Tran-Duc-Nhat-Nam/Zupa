part of 'member_vehicles_list_cubit.dart';

@freezed
sealed class MemberVehiclesListState with _$MemberVehiclesListState {
  const factory MemberVehiclesListState.initial() = Initial;
  const factory MemberVehiclesListState.loading() = Loading;
  const factory MemberVehiclesListState.refreshing(List<MemberVehicle> vehicles) = Refreshing;
  const factory MemberVehiclesListState.loadingMore(List<MemberVehicle> vehicles) = LoadingMore;
  const factory MemberVehiclesListState.loaded(List<MemberVehicle> vehicles, int pageIndex) = Loaded;
  const factory MemberVehiclesListState.failed(String message) = Failed;
  const factory MemberVehiclesListState.empty() = Emtpy;
}
