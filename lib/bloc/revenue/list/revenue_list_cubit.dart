import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/api/ticket/ticket_api.dart';
import '../../../data/model/revenue/daily/daily_revenue.dart';
import '../../../data/request/request.dart';
import '../../../helper/api/api_helper.dart';

part 'revenue_list_state.dart';
part 'revenue_list_cubit.freezed.dart';

class RevenueListCubit extends Cubit<RevenueListState> {
  RevenueListCubit() : super(const RevenueListState.initial());

  Future<void> init(BuildContext context) async {
    emit(const RevenueListState.loading());
    await Future.delayed(const Duration(seconds: 2));
    await ApiHelper.callAPI(
      context: context,
      apiFunction: (dio) => StaffAPI(dio).getList(const Request()),
      onSuccess: (response) {
        final items =
            (response.data.data as List<dynamic>)
                .map((item) => DailyRevenue(date: DateTime.now()))
                .toList();
        emit(
          items.isEmpty
              ? const RevenueListState.empty()
              : RevenueListState.loaded(items, 0),
        );
      },
      onFailed: (response) => emit(RevenueListState.failed(response.message)),
    );
  }

  void refresh(
    BuildContext context,
    void Function() onSuccess,
    void Function() onFailed,
  ) async {
    final List<DailyRevenue> items = switch (state) {
      Loaded(:final revenue) => [...revenue],
      _ => [],
    };
    emit(RevenueListState.refreshing(items));
    await ApiHelper.callAPI(
      context: context,
      apiFunction: (dio) => StaffAPI(dio).getList(const Request()),
      onSuccess: (response) {
        final items =
            (response.data.data as List<dynamic>)
                .map((item) => DailyRevenue(date: DateTime.now()))
                .toList();
        onSuccess();
        emit(
          items.isEmpty
              ? const RevenueListState.empty()
              : RevenueListState.loaded(items, 0),
        );
      },
      onFailed: (response) {
        onFailed();
        emit(RevenueListState.failed(response.message));
      },
    );
  }

  void loadMore(
    BuildContext context,
    void Function() onSuccess,
    void Function() onFailed,
    void Function() onEmpty,
  ) async {
    final List<DailyRevenue> items = switch (state) {
      Loaded(:final revenue) => [...revenue],
      _ => [],
    };
    final int pageIndex = switch (state) {
      Loaded(:final pageIndex) => pageIndex + 1,
      _ => 1,
    };
    emit(RevenueListState.loadingMore(items));
    await ApiHelper.callAPI(
      context: context,
      apiFunction:
          (dio) => StaffAPI(dio).getList( Request(page: pageIndex)),
      onSuccess: (response) {
        final List<DailyRevenue> newItems =
            (response.data.data as List<dynamic>)
                .map((item) => DailyRevenue(date: DateTime.now()))
                .toList();
        items.addAll(newItems);
        if (newItems.isEmpty) {
          onEmpty();
        } else {
          onSuccess();
        }
        emit(RevenueListState.loaded(items, pageIndex));
      },
      onFailed: (response) {
        onFailed();
        emit(RevenueListState.failed(response.message));
      },
    );
  }
}
