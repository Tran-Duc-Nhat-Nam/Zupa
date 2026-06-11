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

extension HomeStateExtension on HomeState {
  List<HomeTicketEntity> get items => switch (this) {
    Loaded(:final tickets) => tickets,
    Refreshing(:final tickets) => tickets,
    LoadingMore(:final tickets) => tickets,
    _ => [],
  };

  bool get isLoading => switch (this) {
    Loading() => true,
    _ => false,
  };

  bool get isFiltering => switch (this) {
    Loading() => true,
    Refreshing() => true,
    LoadingMore() => true,
    _ => false,
  };
}
