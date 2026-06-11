import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/constants/query.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/features/revenue/domain/entities/daily_revenue_entity.dart';
import 'package:zupa/features/revenue/domain/usecases/get_revenue_usecase.dart';
import 'package:zupa/features/revenue/domain/usecases/params/get_revenue_params.dart';

part 'revenue_cubit.freezed.dart';
part 'revenue_state.dart';

@injectable
class RevenueCubit extends Cubit<RevenueState> {
  final GetRevenueUseCase _getRevenue;
  RequestToken? _getToken;

  RevenueCubit(this._getRevenue) : super(const .initial());

  Future<void> init({required GetRevenueParams filter}) async {
    emit(const .loading(revenueList: []));
    _getToken?.cancel();
    _getToken = .new();
    final response = await _getRevenue(filter: filter, token: _getToken);

    switch (response) {
      case Success(:final data):
        emit(.loaded(revenueList: data, pageIndex: defaultPageIndex));
      case Error(:final message):
        emit(.failed(revenueList: [], message: message));
      default:
        emit(const .failed(revenueList: [], message: 'cancelled'));
    }
  }

  Future<void> refresh({required GetRevenueParams filter}) async {
    final int page = state.maybeWhen(
      loaded: (revenueList, pageIndex) => pageIndex,
      orElse: () => defaultPageIndex,
    );
    emit(.refreshing(revenueList: state.items, pageIndex: page));
    _getToken?.cancel();
    _getToken = RequestToken();
    final response = await _getRevenue(filter: filter, token: _getToken);

    switch (response) {
      case Success(:final data):
        emit(.loaded(revenueList: data, pageIndex: defaultPageIndex));
      case Error(:final message):
        emit(.failed(revenueList: state.items, message: message));
      default:
        emit(.failed(revenueList: state.items, message: 'cancelled'));
    }
  }

  Future<void> loadMore({required GetRevenueParams filter}) async {
    final tempItems = state.items;
    final int pageIndex = state.maybeMap(
      loaded: (params) => params.pageIndex,
      orElse: () => defaultPageIndex,
    );

    emit(.loadingMore(revenueList: tempItems, pageIndex: pageIndex));
    _getToken?.cancel();
    _getToken = RequestToken();
    final result = await _getRevenue(filter: filter, token: _getToken);

    switch (result) {
      case Success(data: final newItems):
        tempItems.addAll(newItems);
        emit(
          tempItems.isEmpty
              ? const .empty()
              : .loaded(
                  revenueList: tempItems,
                  pageIndex: newItems.isEmpty ? pageIndex : pageIndex + 1,
                ),
        );
      case Error(:final message):
        emit(.failed(revenueList: tempItems, message: message));
      default:
        emit(.failed(revenueList: tempItems, message: 'cancelled'));
    }
  }

  @override
  Future<void> close() {
    _getToken?.cancel();
    return super.close();
  }
}
