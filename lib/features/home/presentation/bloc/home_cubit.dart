import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:zupa/features/home/domain/entities/home_ticker_entity.dart';
import 'package:zupa/features/home/domain/repository/home_repository.dart';
import 'package:zupa/features/home/domain/usecases/params/get_ticket_params.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final IHomeRepository _repository;
  final AuthCubit _authCubit;

  HomeCubit(this._repository, this._authCubit) : super(const .initial());

  Future<void> init() async {
    emit(const .loading());
    final result = await _repository.getTickets();
    result.whenOrNull(
      unauthenticated: () => _authCubit.logOut(),
      success: (data) => emit(data.isEmpty ? const .empty() : .loaded(data, 0)),
      error: (message) => emit(.failed(message)),
    );
  }

  Future<void> refresh({required GetTicketParams filter}) async {
    final List<HomeTicketEntity> items = state.maybeMap(
      loaded: (params) => [...params.tickets],
      orElse: () => [],
    );
    emit(.refreshing(items));
    final result = await _repository.getTickets(filter: filter);
    result.maybeWhen(
      success: (data) => emit(data.isEmpty ? const .empty() : .loaded(data, 0)),
      error: (message) => emit(.failed(message)),
      unauthenticated: () => _authCubit.logOut(),
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
      unauthenticated: () => _authCubit.logOut(),
    );
  }
}
