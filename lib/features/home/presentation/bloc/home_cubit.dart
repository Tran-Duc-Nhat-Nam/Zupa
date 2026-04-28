import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/constants/query.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/features/home/domain/entities/home_ticker_entity.dart';
import 'package:zupa/features/home/domain/usecases/get_ticket_usecase.dart';
import 'package:zupa/features/home/domain/usecases/params/get_ticket_params.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetTicketUseCase _getTicket;
  RequestToken? getTicketToken;

  HomeCubit(this._getTicket) : super(const .initial());

  Future<void> init() async {
    emit(const .loading());
    final result = await _getTicket(filter: .initial());
    result.whenOrNull(
      success: (data) =>
          emit(data.isEmpty ? const .empty() : .loaded(data, defaultPageIndex)),
      error: (message) => emit(.failed(message)),
    );
  }

  Future<void> refresh({required GetTicketParams filter}) async {
    final List<HomeTicketEntity> items = state.maybeMap(
      loaded: (params) => [...params.tickets],
      orElse: () => [],
    );

    emit(.refreshing(items));
    getTicketToken?.cancel();
    getTicketToken = .new();

    final result = await _getTicket(filter: filter, token: getTicketToken);
    result.maybeWhen(
      success: (data) =>
          emit(data.isEmpty ? const .empty() : .loaded(data, defaultPageIndex)),
      error: (message) => emit(.failed(message)),
      orElse: () => emit(const .failed('unknownError')),
    );
  }

  Future<void> loadMore({required GetTicketParams filter}) async {
    final List<HomeTicketEntity> items = state.maybeMap(
      loaded: (params) => [...params.tickets],
      orElse: () => [],
    );
    final int pageIndex = state.maybeMap(
      loaded: (params) => params.pageIndex,
      orElse: () => defaultPageIndex,
    );

    emit(.loadingMore(items));
    getTicketToken?.cancel();
    getTicketToken = .new();
    final newFilter = GetTicketParams(
      page: filter.page + 1,
      size: filter.size,
      keyword: filter.keyword,
      time: filter.time,
      type: filter.type,
    );

    final result = await _getTicket(filter: newFilter, token: getTicketToken);
    result.whenOrNull(
      success: (newItems) {
        items.addAll(newItems);
        emit(items.isEmpty ? const .empty() : .loaded(items, pageIndex + 1));
      },
      error: (message) => emit(.failed(message)),
    );
  }
}
