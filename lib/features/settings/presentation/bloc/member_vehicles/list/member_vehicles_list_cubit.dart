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

  MemberVehiclesListCubit(this._repository) : super(const .initial());

  Future<void> init() async {
    emit(const .loading());
    final result = await _repository.getMemberVehicles();
    result.whenOrNull(
      success: (items) {
        if (items.isEmpty) {
          emit(const .empty());
        } else {
          emit(.loaded(items, 1));
        }
      },
      error: (message) => emit(.failed(message)),
    );
  }

  void refresh({
    MemberVehiclesFilter? filter,
    void Function()? onSuccess,
    void Function()? onFailed,
  }) async {
    final List<MemberVehicle> items = state.maybeMap(
      loaded: (params) => [...params.vehicles],
      orElse: () => [],
    );
    emit(.refreshing(items));
    final result = await _repository.getMemberVehicles(filter: filter);
    result.whenOrNull(
      success: (newItems) {
        onSuccess?.call();
        if (newItems.isEmpty) {
          emit(const .empty());
        } else {
          emit(.loaded(newItems, 1));
        }
      },
      error: (message) {
        onFailed?.call();
        emit(.failed(message));
      },
    );
  }

  void loadMore({
    MemberVehiclesFilter? filter,
    void Function()? onSuccess,
    void Function()? onFailed,
    void Function()? onEmpty,
  }) async {
    final List<MemberVehicle> items = state.maybeMap(
      loaded: (params) => [...params.vehicles],
      orElse: () => [],
    );
    final int pageIndex = state.maybeMap(
      loaded: (params) => params.pageIndex + 1,
      orElse: () => 1,
    );
    emit(.loadingMore(items));
    final result = await _repository.getMemberVehicles(page: pageIndex, filter: filter);
    result.whenOrNull(
      success: (newItems) {
        if (newItems.isEmpty) {
          onEmpty?.call();
        } else {
          items.addAll(newItems);
          onSuccess?.call();
        }
        emit(.loaded(items, pageIndex));
      },
      error: (message) {
        onFailed?.call();
        emit(.failed(message));
      },
    );
  }
}
