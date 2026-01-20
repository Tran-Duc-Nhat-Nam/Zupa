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

  RevenueListCubit(this._revenueRepository) : super(const .initial());

  Future<void> init() async {
    emit(const .loading());
    final response = await _revenueRepository.getRevenue();

    response.whenOrNull(
      success: (data) =>
      data.isEmpty ? emit(const .empty()) : emit(.loaded(data, 1)),
      error: (message) => emit(.failed(message)),
    );
  }

  Future<void> refresh(RevenueFilter? filter) async {
    emit(const .loading());
    final response = await _revenueRepository.getRevenue(filter: filter);

    response.whenOrNull(
      success: (data) =>
      data.isEmpty ? emit(const .empty()) : emit(.loaded(data, 1)),
      error: (message) => emit(.failed(message)),
    );
  }

  Future<void> loadMore(RevenueFilter? filter) async {
    final List<DailyRevenue> items = state.maybeMap(
      loaded: (params) => [...params.tickets],
      orElse: () => [],
    );
    final int pageIndex = state.maybeMap(
      loaded: (params) => params.pageIndex,
      orElse: () => 1,
    );
    emit(.loadingMore(items));

    final result = await _revenueRepository.getRevenue(
      filter: filter,
      page: pageIndex + 1,
    );
    result.whenOrNull(
      success: (newItems) {
        items.addAll(newItems);
        items.isEmpty
            ? emit(const .empty())
            : emit(
              .loaded(items, newItems.isEmpty ? pageIndex : pageIndex + 1),
        );
      },
      error: (message) {
        emit(.failed(message));
      },
    );
  }
}
