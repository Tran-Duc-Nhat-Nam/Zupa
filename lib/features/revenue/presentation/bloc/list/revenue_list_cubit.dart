import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/revenue/domain/entities/daily_revenue_entity.dart';
import 'package:zupa/features/revenue/domain/repository/revenue_repository.dart';
import 'package:zupa/features/revenue/presentation/bloc/filter/revenue_filter_cubit.dart';

part 'revenue_list_cubit.freezed.dart';
part 'revenue_list_state.dart';

@injectable
class RevenueListCubit extends Cubit<RevenueListState> {
  final IRevenueRepository _revenueRepository;
  final RevenueFilterCubit _filterCubit;

  RevenueListCubit(this._revenueRepository, this._filterCubit)
    : super(const .initial());

  Future<void> init() async {
    emit(const .loading());
    final response = await _revenueRepository.getRevenue(
      filter: _filterCubit.filter,
    );

    response.whenOrNull(
      success: (data) =>
          data.isEmpty ? emit(const .empty()) : emit(.loaded(data, 1)),
      error: (message) => emit(.failed(message)),
    );
  }

  Future<void> refresh() async {
    final List<DailyRevenueEntity> items = state.maybeMap(
      loaded: (params) => [...params.tickets],
      orElse: () => [],
    );
    emit(.refreshing(items));
    final response = await _revenueRepository.getRevenue(
      filter: _filterCubit.filter,
    );

    response.whenOrNull(
      success: (data) =>
          data.isEmpty ? emit(const .empty()) : emit(.loaded(data, 1)),
      error: (message) => emit(.failed(message)),
    );
  }

  Future<void> loadMore() async {
    final List<DailyRevenueEntity> items = state.maybeMap(
      loaded: (params) => [...params.tickets],
      orElse: () => [],
    );
    final int pageIndex = state.maybeMap(
      loaded: (params) => params.pageIndex,
      orElse: () => 1,
    );
    emit(.loadingMore(items));

    final result = await _revenueRepository.getRevenue(
      filter: _filterCubit.filter,
    );
    result.whenOrNull(
      success: (newItems) {
        items.addAll(newItems);
        emit(
          items.isEmpty
              ? const .empty()
              : .loaded(items, newItems.isEmpty ? pageIndex : pageIndex + 1),
        );
      },
      error: (message) {
        emit(.failed(message));
      },
    );
  }
}
