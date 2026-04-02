import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/member_vehicles/domain/entities/member_vehicle_entity.dart';
import 'package:zupa/features/member_vehicles/domain/repository/member_vehicles_repository.dart';
import 'package:zupa/features/member_vehicles/presentation/bloc/filter/member_vehicles_filter_cubit.dart';

part 'member_vehicles_list_cubit.freezed.dart';
part 'member_vehicles_list_state.dart';

@injectable
class MemberVehiclesListCubit extends Cubit<MemberVehiclesListState> {
  final IMemberVehiclesRepository _repository;
  final MemberVehiclesFilterCubit _filterCubit;

  MemberVehiclesListCubit(this._repository, this._filterCubit)
    : super(const .initial());

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

  void refresh() async {
    final List<MemberVehicleEntity> items = state.maybeMap(
      loaded: (params) => [...params.vehicles],
      orElse: () => [],
    );
    emit(.refreshing(items));
    final result = await _repository.getMemberVehicles(
      filter: _filterCubit.filter,
    );
    result.whenOrNull(
      success: (data) =>
          data.isEmpty ? emit(const .empty()) : emit(.loaded(data, 1)),
      error: (message) => emit(.failed(message)),
    );
  }

  void loadMore() async {
    final List<MemberVehicleEntity> items = state.maybeMap(
      loaded: (params) => [...params.vehicles],
      orElse: () => [],
    );
    final int pageIndex = state.maybeMap(
      loaded: (params) => params.pageIndex + 1,
      orElse: () => 1,
    );
    emit(.loadingMore(items));

    final result = await _repository.getMemberVehicles(
      page: pageIndex,
      filter: _filterCubit.filter,
    );
    result.whenOrNull(
      success: (newItems) {
        items.addAll(newItems);
        emit(
          items.isEmpty
              ? const .empty()
              : .loaded(items, newItems.isEmpty ? pageIndex : pageIndex + 1),
        );
      },
      error: (message) {
        emit(.failed(message));
      },
    );
  }
}
