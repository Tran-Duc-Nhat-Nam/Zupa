import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/revenue/domain/entities/daily_revenue_entity.dart';
import 'package:zupa/features/revenue/domain/entities/filter/revenue_filter_entity.dart';
import 'package:zupa/features/revenue/domain/repository/revenue_repository.dart';
import 'package:zupa/features/revenue/presentation/bloc/filter/revenue_filter_cubit.dart';

part 'revenue_list_cubit.freezed.dart';
part 'revenue_list_state.dart';

@injectable
class RevenueListCubit extends Cubit<RevenueListState> {
  final IRevenueRepository _revenueRepository;
  final RevenueFilterCubit _filterCubit;
  late final StreamSubscription _filterSubscription;

  RevenueListCubit(this._revenueRepository, this._filterCubit)
    : super(const .initial()) {
    _filterSubscription = _filterCubit.stream.listen((filterState) {
      filterState.whenOrNull(loaded: (_) => init());
    });
  }

  RevenueFilterEntity get _currentFilter => _filterCubit.state.maybeWhen(
    loading: (filter) => filter,
    loaded: (filter) => filter,
    filtering: (filter) => filter,
    failed: (filter, _) => filter,
    orElse: () => RevenueFilterEntity(
      keyword: '',
      type: vehicleTypes[0],
      fromDate: .now(),
      toDate: .now(),
    ),
  );

  Future<void> init() async {
    emit(const .loading(revenueList: []));
    final response = await _revenueRepository.getRevenue(
      filter: _filterCubit.state.maybeWhen(
        loading: (filter) => filter,
        loaded: (filter) => filter,
        filtering: (filter) => filter,
        failed: (filter, _) => filter,
        orElse: () => .new(
          keyword: '',
          type: vehicleTypes[0],
          fromDate: .now(),
          toDate: .now(),
        ),
      ),
    );

    response.whenOrNull(
      success: (data) => data.isEmpty
          ? emit(const .empty())
          : emit(.loaded(revenueList: data, pageIndex: 0)),
      error: (message) => emit(.failed(revenueList: [], message: message)),
    );
  }

  Future<void> refresh() async {
    final List<DailyRevenueEntity> items = state.maybeWhen(
      loaded: (revenueList, pageIndex) => revenueList,
      orElse: () => [],
    );
    final int page = state.maybeWhen(
      loaded: (revenueList, pageIndex) => pageIndex,
      orElse: () => 0,
    );
    emit(.refreshing(revenueList: items, pageIndex: page));
    final response = await _revenueRepository.getRevenue(
      filter: _currentFilter,
    );

    response.whenOrNull(
      success: (data) => data.isEmpty
          ? emit(const .empty())
          : emit(.loaded(revenueList: data, pageIndex: 0)),
      error: (message) => emit(.failed(revenueList: items, message: message)),
    );
  }

  Future<void> loadMore() async {
    final List<DailyRevenueEntity> items = state.maybeMap(
      loaded: (params) => [...params.revenueList],
      orElse: () => [],
    );
    final int pageIndex = state.maybeMap(
      loaded: (params) => params.pageIndex,
      orElse: () => 0,
    );
    emit(.loadingMore(revenueList: items, pageIndex: pageIndex));

    final result = await _revenueRepository.getRevenue(filter: _currentFilter);

    result.whenOrNull(
      success: (newItems) {
        items.addAll(newItems);
        emit(
          items.isEmpty
              ? const .empty()
              : .loaded(
                  revenueList: items,
                  pageIndex: newItems.isEmpty ? pageIndex : pageIndex + 1,
                ),
        );
      },
      error: (message) {
        emit(.loadMoreFailed(revenueList: items, pageIndex: pageIndex));
      },
    );
  }

  @override
  Future<void> close() {
    _filterSubscription.cancel();
    return super.close();
  }
}
