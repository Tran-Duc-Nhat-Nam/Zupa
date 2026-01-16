import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/revenue/domain/repository/revenue_repository.dart';
import 'package:zupa/features/revenue/data/models/daily_revenue.dart';
import 'package:zupa/features/revenue/presentation/bloc/filter/revenue_filter_cubit.dart';

part 'revenue_list_state.dart';
part 'revenue_list_cubit.freezed.dart';

@injectable
class RevenueListCubit extends Cubit<RevenueListState> {
  final IRevenueRepository _revenueRepository;
  final RevenueFilterCubit _revenueFilterCubit;

  RevenueListCubit(this._revenueRepository, this._revenueFilterCubit)
    : super(const RevenueListState());

  Future<void> init(BuildContext context) async {
    emit(state.copyWith(status: const NetworkState.loading()));
    final filter = _revenueFilterCubit.state.maybeMap(
      loaded: (s) => s.filter,
      orElse: () => null,
    );
    final result = await _revenueRepository.getRevenue(filter: filter);

    result.when(
      initial: () => emit(state.copyWith(status: const NetworkState.initial())),
      loading: () => emit(state.copyWith(status: const NetworkState.loading())),
      success: (data) => emit(
        state.copyWith(
          revenue: data,
          page: 1,
          hasMore: data.length >= 10,
          status: NetworkState.success(data),
        ),
      ),
      error: (message) =>
          emit(state.copyWith(status: NetworkState.error(message))),
    );
  }

  Future<void> loadMore() async {
    final isLoading = state.status.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );
    if (!state.hasMore || isLoading) return;

    final filter = _revenueFilterCubit.state.maybeMap(
      loaded: (s) => s.filter,
      orElse: () => null,
    );
    final response = await _revenueRepository.getRevenue(
      page: state.page + 1,
      filter: filter,
    );

    response.whenOrNull(
      success: (data) => emit(
        state.copyWith(
          revenue: [...state.revenue, ...data],
          page: state.page + 1,
          hasMore: data.length >= 10,
        ),
      ),
    );
  }
}
