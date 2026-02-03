import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/features/home/data/models/ticket.dart';
import 'package:zupa/features/home/domain/repository/home_repository.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/home/domain/entities/home_filter.dart';

part 'home_ticket_state.dart';
part 'home_ticket_cubit.freezed.dart';

@injectable
class HomeTicketCubit extends Cubit<HomeTicketState> {
  final IHomeRepository _repository;

  HomeTicketCubit(this._repository) : super(const .initial());

  Future<void> init() async {
    emit(const .loading());
    final result = await _repository.getTickets();
    result.whenOrNull(
      unauthenticated: () => emit(const .unauthenticated()),
      success: (data) => emit(data.isEmpty ? const .empty() : .loaded(data, 0)),
      error: (message) => emit(.failed(message)),
    );
  }

  void refresh(HomeFilter? filter) async {
    final List<HomeTicket> items = state.maybeMap(
      loaded: (params) => [...params.tickets],
      orElse: () => [],
    );
    emit(.refreshing(items));
    final result = await _repository.getTickets(filter: filter);
    result.maybeWhen(
      success: (data) => emit(data.isEmpty ? const .empty() : .loaded(data, 0)),
      error: (message) => emit(.failed(message)),
      unauthenticated: () => emit(const .unauthenticated()),
      orElse: () => emit(const .failed('unknownError')),
    );
  }

  void loadMore(HomeFilter? filter) async {
    final List<HomeTicket> items = state.maybeMap(
      loaded: (params) => [...params.tickets],
      orElse: () => [],
    );
    final int pageIndex = state.maybeMap(
      loaded: (params) => params.pageIndex,
      orElse: () => 1,
    );
    emit(.loadingMore(items));

    final result = await _repository.getTickets(
      filter: filter,
      page: pageIndex + 1,
    );
    result.whenOrNull(
      success: (newItems) {
        items.addAll(newItems);
        emit(items.isEmpty ? const .empty() : .loaded(items, pageIndex + 1));
      },
      error: (message) => emit(.failed(message)),
      unauthenticated: () => emit(const .unauthenticated()),
    );
  }
}
