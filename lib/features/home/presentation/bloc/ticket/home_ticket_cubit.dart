import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/constants/query.dart';
import 'package:zupa/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:zupa/features/home/domain/entities/home_ticker_entity.dart';
import 'package:zupa/features/home/domain/repository/home_repository.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/home/domain/entities/filter/home_filter_entity.dart';

part 'home_ticket_state.dart';
part 'home_ticket_cubit.freezed.dart';

@injectable
class HomeTicketCubit extends Cubit<HomeTicketState> {
  final IHomeRepository _repository;

  HomeTicketCubit(this._repository) : super(const .initial());

  Future<void> init(BuildContext context) async {
    emit(const .loading());
    final result = await _repository.getTickets();
    result.whenOrNull(
      unauthenticated: () => context.read<AuthCubit>().logOut(),
      success: (data) => emit(data.isEmpty ? const .empty() : .loaded(data, 0)),
      error: (message) => emit(.failed(message)),
    );
  }

  void refresh(BuildContext context, HomeFilterEntity? filter) async {
    final List<HomeTicketEntity> items = state.maybeMap(
      loaded: (params) => [...params.tickets],
      orElse: () => [],
    );
    emit(.refreshing(items));
    final result = await _repository.getTickets(
      filter:
          filter ??
          const HomeFilterEntity(
            page: defaultPageIndex,
            size: defaultPageSize,
            keyword: null,
            time: null,
            type: null,
          ),
    );
    result.maybeWhen(
      success: (data) => emit(data.isEmpty ? const .empty() : .loaded(data, 0)),
      error: (message) => emit(.failed(message)),
      unauthenticated: () => context.read<AuthCubit>().logOut(),
      orElse: () => emit(const .failed('unknownError')),
    );
  }

  void loadMore(BuildContext context, HomeFilterEntity? filter) async {
    final List<HomeTicketEntity> items = state.maybeMap(
      loaded: (params) => [...params.tickets],
      orElse: () => [],
    );
    final int pageIndex = state.maybeMap(
      loaded: (params) => params.pageIndex,
      orElse: () => 1,
    );
    emit(.loadingMore(items));

    final result = await _repository.getTickets(
      filter:
          filter ??
          const HomeFilterEntity(
            page: defaultPageIndex,
            size: defaultPageSize,
            keyword: null,
            time: null,
            type: null,
          ),
      page: pageIndex + 1,
    );
    result.whenOrNull(
      success: (newItems) {
        items.addAll(newItems);
        emit(items.isEmpty ? const .empty() : .loaded(items, pageIndex + 1));
      },
      error: (message) => emit(.failed(message)),
      unauthenticated: () => context.read<AuthCubit>().logOut(),
    );
  }
}
