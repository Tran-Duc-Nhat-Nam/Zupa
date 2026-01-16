import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/settings/domain/repository/settings_repository.dart';
import 'package:zupa/features/settings/data/models/member_vehicle.dart';
import 'package:zupa/features/settings/data/models/member_vehicles_filter.dart';

part 'member_vehicles_list_state.dart';
part 'member_vehicles_list_cubit.freezed.dart';

@injectable
class MemberVehiclesListCubit extends Cubit<MemberVehiclesListState> {
  final ISettingsRepository _repository;

  MemberVehiclesListCubit(this._repository)
      : super(const MemberVehiclesListState.initial());

  Future<void> init(
    BuildContext context, {
    MemberVehiclesFilter filter = const MemberVehiclesFilter(),
  }) async {
    emit(const MemberVehiclesListState.loading());
    final result = await _repository.getMemberVehicles(page: 1, filter: filter);
    result.when(
      initial: () => emit(const MemberVehiclesListState.initial()),
      loading: () => emit(const MemberVehiclesListState.loading()),
      success: (items) {
        if (items.isEmpty) {
          emit(const MemberVehiclesListState.empty());
        } else {
          emit(MemberVehiclesListState.loaded(items, 1));
        }
      },
      error: (message) => emit(MemberVehiclesListState.failed(message)),
    );
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
    emit(MemberVehiclesListState.refreshing(items));
    final result = await _repository.getMemberVehicles(page: 1);
    result.when(
      initial: () {},
      loading: () {},
      success: (newItems) {
        onSuccess();
        if (newItems.isEmpty) {
          emit(const MemberVehiclesListState.empty());
        } else {
          emit(MemberVehiclesListState.loaded(newItems, 1));
        }
      },
      error: (message) {
        onFailed();
        emit(MemberVehiclesListState.failed(message));
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
    emit(MemberVehiclesListState.loadingMore(items));
    final result = await _repository.getMemberVehicles(page: pageIndex);
    result.when(
      initial: () {},
      loading: () {},
      success: (newItems) {
        if (newItems.isEmpty) {
          onEmpty();
        } else {
          items.addAll(newItems);
          onSuccess();
        }
        emit(MemberVehiclesListState.loaded(items, pageIndex));
      },
      error: (message) {
        onFailed();
        emit(MemberVehiclesListState.failed(message));
      },
    );
  }
}

