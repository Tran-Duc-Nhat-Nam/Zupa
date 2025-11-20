import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/api/ticket/ticket_api.dart';
import '../../../data/model/member_vehicle/member_vehicle.dart';
import '../../../helper/api/api_helper.dart';
import '../filter/model/member_vehicles_filter.dart';

part 'member_vehicles_list_state.dart';
part 'member_vehicles_list_cubit.freezed.dart';

class MemberVehiclesListCubit extends Cubit<MemberVehiclesListState> {
  MemberVehiclesListCubit() : super(const .initial());

  Future<void> init(
    BuildContext context, {
    filter = const MemberVehiclesFilter(),
  }) async {
    emit(const .loading());
    log(name: 'MemberVehiclesListCubit', filter.toString());
    await Future.delayed(const .new(seconds: 2));
    if (context.mounted) {
      await ApiHelper.callAPI(
        context: context,
        apiFunction: (dio) => StaffAPI(dio).getList(const .new()),
        onSuccess: (response) {
          final items = (response.data.data as List<dynamic>)
              .map((item) => const MemberVehicle())
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
    final List<MemberVehicle> items = state.maybeMap(
      loaded: (params) => [...params.vehicles],
      orElse: () => [],
    );
    emit(.refreshing(items));
    await ApiHelper.callAPI(
      context: context,
      apiFunction: (dio) => StaffAPI(dio).getList(const .new()),
      onSuccess: (response) {
        final items = (response.data.data as List<dynamic>)
            .map((item) => const MemberVehicle())
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
    final List<MemberVehicle> items = state.maybeMap(
      loaded: (params) => [...params.vehicles],
      orElse: () => [],
    );
    final int pageIndex = state.maybeMap(
      loaded: (params) => params.pageIndex + 1,
      orElse: () => 1,
    );
    emit(.loadingMore(items));
    await ApiHelper.callAPI(
      context: context,
      apiFunction: (dio) => StaffAPI(dio).getList(.new(page: pageIndex)),
      onSuccess: (response) {
        final List<MemberVehicle> newItems =
            (response.data.data as List<dynamic>)
                .map((item) => const MemberVehicle())
                .toList();
        items.addAll(newItems);
        newItems.isEmpty ? onEmpty() : onSuccess();
        emit(.loaded(items, pageIndex));
      },
      onFailed: (response) {
        onFailed();
        emit(.failed(response.message));
      },
    );
  }
}
