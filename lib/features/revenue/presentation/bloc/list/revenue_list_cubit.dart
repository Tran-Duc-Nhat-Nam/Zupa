import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/revenue/domain/entities/daily_revenue_entity.dart';
import 'package:zupa/features/revenue/domain/usecases/get_revenue_usecase.dart';
import 'package:zupa/features/revenue/domain/usecases/params/get_revenue_params.dart';

part 'revenue_list_cubit.freezed.dart';
part 'revenue_list_state.dart';

@injectable
class RevenueListCubit extends Cubit<RevenueListState> {
  final GetRevenueUseCase _getRevenue;

  RevenueListCubit(this._getRevenue) : super(const .initial());

  Future<void> init({required GetRevenueParams filter}) async {
    emit(const .loading(revenueList: []));
    final response = await _getRevenue(filter: filter);

    response.whenOrNull(
      success: (data) => data.isEmpty
          ? emit(const .empty())
          : emit(.loaded(revenueList: data, pageIndex: 0)),
      error: (message) => emit(.failed(revenueList: [], message: message)),
    );
  }

  Future<void> refresh({required GetRevenueParams filter}) async {
    final List<DailyRevenueEntity> items = state.maybeWhen(
      loaded: (revenueList, pageIndex) => revenueList,
      orElse: () => [],
    );
    final int page = state.maybeWhen(
      loaded: (revenueList, pageIndex) => pageIndex,
      orElse: () => 0,
    );
    emit(.refreshing(revenueList: items, pageIndex: page));

    final response = await _getRevenue(filter: filter);

    response.whenOrNull(
      success: (data) => data.isEmpty
          ? emit(const .empty())
          : emit(.loaded(revenueList: data, pageIndex: 0)),
      error: (message) => emit(.failed(revenueList: items, message: message)),
    );
  }

  Future<void> loadMore({required GetRevenueParams filter}) async {
    final List<DailyRevenueEntity> items = state.maybeMap(
      loaded: (params) => [...params.revenueList],
      orElse: () => [],
    );
    final int pageIndex = state.maybeMap(
      loaded: (params) => params.pageIndex,
      orElse: () => 0,
    );

    emit(.loadingMore(revenueList: items, pageIndex: pageIndex));
    final result = await _getRevenue(filter: filter);

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
}
