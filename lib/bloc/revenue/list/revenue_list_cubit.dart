import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/api/ticket/ticket_api.dart';
import '../../../data/model/revenue/daily/daily_revenue.dart';
import '../../../helper/api/api_helper.dart';

part 'revenue_list_state.dart';
part 'revenue_list_cubit.freezed.dart';

class RevenueListCubit extends Cubit<RevenueListState> {
  RevenueListCubit() : super(const .initial());

  Future<void> init(BuildContext context) async {
    emit(const .loading());
    await Future.delayed(const .new(seconds: 2));
    if (context.mounted) {
      await ApiHelper.callAPI(
        context: context,
        apiFunction: (dio) => StaffAPI(dio).getList(const .new()),
        onSuccess: (response) {
          final items = (response.data.data as List<dynamic>)
              .map((item) => DailyRevenue(date: .now()))
              .toList();
          emit(items.isEmpty ? const .empty() : .loaded(items, 0));
        },
        onFailed: (response) => emit(.failed(response.message)),
      );
    } else {
      emit(const .initial());
    }
  }

  void refresh(
    BuildContext context,
    void Function() onSuccess,
    void Function() onFailed,
  ) async {
    final List<DailyRevenue> items = state.maybeMap(
      loaded: (params) => [...params.revenue],
      orElse: () => [],
    );
    emit(.refreshing(items));
    await ApiHelper.callAPI(
      context: context,
      apiFunction: (dio) => StaffAPI(dio).getList(const .new()),
      onSuccess: (response) {
        final items = (response.data.data as List<dynamic>)
            .map((item) => DailyRevenue(date: .now()))
            .toList();
        onSuccess();
        emit(items.isEmpty ? const .empty() : .loaded(items, 0));
      },
      onFailed: (response) {
        onFailed();
        emit(.failed(response.message));
      },
    );
  }

  void loadMore(
    BuildContext context,
    void Function() onSuccess,
    void Function() onFailed,
    void Function() onEmpty,
  ) async {
    final List<DailyRevenue> items = state.maybeMap(
      loaded: (params) => [...params.revenue],
      orElse: () => [],
    );
    final int pageIndex = state.maybeMap(
      loaded: (params) => params.pageIndex,
      orElse: () => 1,
    );
    emit(.loadingMore(items));
    await ApiHelper.callAPI(
      context: context,
      apiFunction: (dio) => StaffAPI(dio).getList(.new(page: pageIndex)),
      onSuccess: (response) {
        final List<DailyRevenue> newItems =
            (response.data.data as List<dynamic>)
                .map((item) => DailyRevenue(date: .now()))
                .toList();
        items.addAll(newItems);
        if (newItems.isEmpty) {
          onEmpty();
        } else {
          onSuccess();
        }
        emit(.loaded(items, pageIndex));
      },
      onFailed: (response) {
        onFailed();
        emit(.failed(response.message));
      },
    );
  }
}
