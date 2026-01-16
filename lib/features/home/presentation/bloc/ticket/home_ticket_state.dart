part of 'home_ticket_cubit.dart';

@freezed
sealed class HomeTicketState with _$HomeTicketState {
  const factory HomeTicketState.initial() = Initial;
  const factory HomeTicketState.loading() = Loading;
  const factory HomeTicketState.refreshing(List<HomeTicket> tickets) =
      Refreshing;
  const factory HomeTicketState.loadingMore(List<HomeTicket> tickets) =
      LoadingMore;
  const factory HomeTicketState.loaded(
    List<HomeTicket> tickets,
    int pageIndex,
  ) = Loaded;
  const factory HomeTicketState.failed(String message) = Failed;
  const factory HomeTicketState.empty() = Emtpy;
}
