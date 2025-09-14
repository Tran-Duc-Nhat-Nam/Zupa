import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/api/ticket/ticket_api.dart';
import '../../../data/model/member_vehicle/member_vehicle.dart';
import '../../../data/request/request.dart';
import '../../../helper/api/api_helper.dart';
import '../filter/model/member_vehicles_filter.dart';

part 'member_vehicles_list_state.dart';
part 'member_vehicles_list_cubit.freezed.dart';

class MemberVehiclesListCubit extends Cubit<MemberVehiclesListState> {
  MemberVehiclesListCubit() : super(const MemberVehiclesListState.initial());

  Future<void> init(
    BuildContext context, {
    MemberVehiclesFilter filter = const MemberVehiclesFilter(),
  }) async {
    emit(const MemberVehiclesListState.loading());
    log(name: 'MemberVehiclesListCubit', filter.toString());
    await Future.delayed(const Duration(seconds: 2));
    await ApiHelper.callAPI(
      context: context,
      apiFunction: (dio) => StaffAPI(dio).getList(const Request()),
      onSuccess: (response) {
        final items =
            (response.data.data as List<dynamic>)
                .map((item) => const MemberVehicle())
                .toList();
        emit(
          items.isEmpty
              ? const MemberVehiclesListState.empty()
              : MemberVehiclesListState.loaded(items, 0),
        );
      },
      onFailed:
          (response) => emit(MemberVehiclesListState.failed(response.message)),
    );
  }

  void refresh(
    BuildContext context,
    void Function() onSuccess,
    void Function() onFailed,
  ) async {
    final List<MemberVehicle> items = state.maybeWhen(loaded: (vehicles, _) => [...vehicles], orElse: () => []);
    emit(MemberVehiclesListState.refreshing(items));
    await ApiHelper.callAPI(
      context: context,
      apiFunction: (dio) => StaffAPI(dio).getList(const Request()),
      onSuccess: (response) {
        final items =
            (response.data.data as List<dynamic>)
                .map((item) => const MemberVehicle())
                .toList();
        onSuccess();
        emit(
          items.isEmpty
              ? const MemberVehiclesListState.empty()
              : MemberVehiclesListState.loaded(items, 0),
        );
      },
      onFailed: (response) {
        onFailed();
        emit(MemberVehiclesListState.failed(response.message));
      },
    );
  }

  void loadMore(
    BuildContext context,
    void Function() onSuccess,
    void Function() onFailed,
    void Function() onEmpty,
  ) async {
    final List<MemberVehicle> items = state.maybeWhen(loaded: (vehicles, _) => [...vehicles], orElse: () => []);
    final int pageIndex = state.maybeWhen(loaded: (_, pageIndex) => pageIndex + 1, orElse: () => 1);
    emit(MemberVehiclesListState.loadingMore(items));
    await ApiHelper.callAPI(
      context: context,
      apiFunction:
          (dio) => StaffAPI(dio).getList( Request(page: pageIndex)),
      onSuccess: (response) {
        final List<MemberVehicle> newItems =
            (response.data.data as List<dynamic>)
                .map((item) => const MemberVehicle())
                .toList();
        items.addAll(newItems);
        newItems.isEmpty ? onEmpty() : onSuccess();
        emit(MemberVehiclesListState.loaded(items, pageIndex));
      },
      onFailed: (response) {
        onFailed();
        emit(MemberVehiclesListState.failed(response.message));
      },
    );
  }
}
