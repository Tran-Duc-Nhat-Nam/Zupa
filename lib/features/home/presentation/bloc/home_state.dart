part of 'home_cubit.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState.initial() = Initial;

  const factory HomeState.loading() = Loading;

  const factory HomeState.refreshing(List<HomeTicketEntity> tickets) =
      Refreshing;

  const factory HomeState.loadingMore(List<HomeTicketEntity> tickets) =
      LoadingMore;

  const factory HomeState.loaded(
    List<HomeTicketEntity> tickets,
    int pageIndex,
  ) = Loaded;

  const factory HomeState.failed(String? message) = Failed;

  const factory HomeState.empty() = Emtpy;
}
