import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/features/home/data/models/ticket.dart';
import 'package:zupa/features/home/domain/repository/home_repository.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/home/presentation/bloc/filter/model/home_filter.dart';

part 'home_ticket_state.dart';
part 'home_ticket_cubit.freezed.dart';

@injectable
class HomeTicketCubit extends Cubit<HomeTicketState> {
  final IHomeRepository _repository;

  HomeTicketCubit(this._repository) : super(const .initial());

  Future<void> init(BuildContext context, {filter = const HomeFilter()}) async {
    emit(const .loading());
    final result = await _repository.getTickets();
    result.when(
      initial: () {},
      loading: () => emit(const .loading()),
      success: (data) => emit(data.isEmpty ? const .empty() : .loaded(data, 0)),
      error: (message) => emit(.failed(message)),
    );
  }

  void refresh(
    BuildContext context,
    void Function() onSuccess,
    void Function() onFailed,
  ) async {
    final List<HomeTicket> items = state.maybeMap(
      loaded: (params) => [...params.tickets],
      orElse: () => [],
    );
    emit(.refreshing(items));

    final result = await _repository.getTickets();
    result.when(
      initial: () {},
      loading: () {},
      success: (data) {
        onSuccess();
        emit(data.isEmpty ? const .empty() : .loaded(data, 0));
      },
      error: (message) {
        onFailed();
        emit(.failed(message));
      },
    );
  }

  void loadMore(
    BuildContext context,
    void Function() onSuccess,
    void Function() onFailed,
    void Function() onEmpty,
  ) async {
    final List<HomeTicket> items = state.maybeMap(
      loaded: (params) => [...params.tickets],
      orElse: () => [],
    );
    final int pageIndex = state.maybeMap(
      loaded: (params) => params.pageIndex,
      orElse: () => 1,
    );
    emit(.loadingMore(items));

    final result = await _repository.getTickets(page: pageIndex + 1);
    result.when(
      initial: () {},
      loading: () {},
      success: (newItems) {
        items.addAll(newItems);
        if (newItems.isEmpty) {
          onEmpty();
        } else {
          onSuccess();
        }
        emit(.loaded(items, pageIndex + 1));
      },
      error: (message) {
        onFailed();
        emit(.failed(message));
      },
    );
  }
}
