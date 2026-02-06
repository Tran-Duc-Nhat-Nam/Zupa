import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/member_vehicles/data/models/member_vehicle.dart';
import 'package:zupa/features/member_vehicles/domain/entities/member_vehicles_filter.dart';
import 'package:zupa/features/member_vehicles/domain/repository/member_vehicles_repository.dart';

part 'member_vehicles_list_state.dart';
part 'member_vehicles_list_cubit.freezed.dart';

@injectable
class MemberVehiclesListCubit extends Cubit<MemberVehiclesListState> {
  final IMemberVehiclesRepository _repository;

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

  void refresh(MemberVehiclesFilter? filter) async {
    final List<MemberVehicle> items = state.maybeMap(
      loaded: (params) => [...params.vehicles],
      orElse: () => [],
    );
    emit(.refreshing(items));
    final result = await _repository.getMemberVehicles(filter: filter);
    result.whenOrNull(
      success: (data) =>
          data.isEmpty ? emit(const .empty()) : emit(.loaded(data, 1)),
      error: (message) => emit(.failed(message)),
    );
  }

  void loadMore(MemberVehiclesFilter? filter) async {
    final List<MemberVehicle> items = state.maybeMap(
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
      filter: filter,
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
