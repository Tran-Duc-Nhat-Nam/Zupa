import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/revenue/domain/entity/revenue_filter.dart';
import 'package:zupa/features/revenue/domain/repository/revenue_repository.dart';
import 'package:zupa/features/revenue/data/models/daily_revenue.dart';

part 'revenue_list_state.dart';
part 'revenue_list_cubit.freezed.dart';

@injectable
class RevenueListCubit extends Cubit<RevenueListState> {
  final IRevenueRepository _revenueRepository;

  RevenueListCubit(this._revenueRepository) : super(const RevenueListState());

  Future<void> init() async {
    emit(state.copyWith(status: const .loading()));
    final result = await _revenueRepository.getRevenue(filter: const .new());

    result.when(
      initial: () => emit(state.copyWith(status: const .initial())),
      loading: () => emit(state.copyWith(status: const .loading())),
      success: (data) => emit(
        state.copyWith(
          revenue: data,
          page: 1,
          hasMore: data.length >= 10,
          status: .success(data),
        ),
      ),
      error: (message) => emit(state.copyWith(status: .error(message))),
    );
  }

  Future<void> refresh(RevenueFilter? filter) async {
    emit(state.copyWith(status: const .loading()));
    final result = await _revenueRepository.getRevenue(filter: filter);

    result.whenOrNull(
      success: (data) => emit(
        state.copyWith(
          revenue: data,
          page: 1,
          hasMore: data.length >= 10,
          status: .success(data),
        ),
      ),
      error: (message) => emit(state.copyWith(status: .error(message))),
    );
  }

  Future<void> loadMore(RevenueFilter? filter) async {
    final isLoading = state.status.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );
    if (!state.hasMore || isLoading) return;

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
