import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/constants/vehicle_types.dart';
import '../../../data/api/ticket/ticket_api.dart';
import '../../../data/model/ticket/ticket.dart';
import '../../../helper/api/api_helper.dart';

part 'history_list_state.dart';
part 'history_list_cubit.freezed.dart';

class HistoryListCubit extends Cubit<HistoryListState> {
  HistoryListCubit() : super(const .initial());

  Future<void> init(BuildContext context) async {
    emit(const .loading());
    await Future.delayed(const .new(seconds: 2));
    if (context.mounted) {
      await ApiHelper.callAPI(
  
        apiFunction: (dio) => StaffAPI(dio).getList(const .new()),
        onSuccess: (response) {
          final items = (response.data.data as List<dynamic>)
              .map(
                (item) => Ticket(
                  id: item['code'],
                  timeIn: .now(),
                  siteId: 'EBST',
                  type: vehicleTypes.first,
                ),
              )
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
    final List<Ticket> items = state.maybeMap(
      loaded: (params) => [...params.tickets],
      orElse: () => [],
    );
    emit(.refreshing(items));
    await ApiHelper.callAPI(

      apiFunction: (dio) => StaffAPI(dio).getList(const .new()),
      onSuccess: (response) {
        final items = (response.data.data as List<dynamic>)
            .map(
              (item) => Ticket(
                id: item['code'],
                timeIn: DateTime.now(),
                siteId: 'EBST',
                type: vehicleTypes.first,
              ),
            )
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
    final List<Ticket> items = state.maybeMap(
      loaded: (params) => [...params.tickets],
      orElse: () => [],
    );
    final int pageIndex = state.maybeMap(
      loaded: (params) => params.pageIndex + 1,
      orElse: () => 1,
    );
    emit(.loadingMore(items));
    await ApiHelper.callAPI(

      apiFunction: (dio) => StaffAPI(dio).getList(.new(page: pageIndex)),
      onSuccess: (response) {
        final List<Ticket> newItems = (response.data.data as List<dynamic>)
            .map(
              (item) => Ticket(
                id: item['code'],
                timeIn: DateTime.now(),
                siteId: 'EBST',
                type: vehicleTypes.first,
              ),
            )
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
