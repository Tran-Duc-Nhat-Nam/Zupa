import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/member_vehicles/domain/entities/member_vehicle_entity.dart';
import 'package:zupa/features/member_vehicles/domain/usecases/get_member_vehicle_list_usecase.dart';
import 'package:zupa/features/member_vehicles/domain/usecases/params/get_member_vehicle_list_params.dart';

part 'member_vehicles_list_cubit.freezed.dart';
part 'member_vehicles_list_state.dart';

@injectable
class MemberVehiclesListCubit extends Cubit<MemberVehiclesListState> {
  final GetMemberVehicleListUseCase _getMemberVehicleList;
  MemberVehiclesListCubit(this._getMemberVehicleList) : super(const .initial());

  Future<void> init() async {
    emit(const .loading());
    final result = await _getMemberVehicleList(filter: .initial());
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

  void refresh({required GetMemberVehicleListParams filter}) async {
    final List<MemberVehicleEntity> items = state.maybeMap(
      loaded: (params) => [...params.vehicles],
      orElse: () => [],
    );
    emit(.refreshing(items));
    final result = await _getMemberVehicleList(filter: filter);
    result.whenOrNull(
      success: (data) =>
          data.isEmpty ? emit(const .empty()) : emit(.loaded(data, 1)),
      error: (message) => emit(.failed(message)),
    );
  }

  void loadMore({required GetMemberVehicleListParams filter}) async {
    final List<MemberVehicleEntity> items = state.maybeMap(
      loaded: (params) => [...params.vehicles],
      orElse: () => [],
    );
    final int pageIndex = state.maybeMap(
      loaded: (params) => params.pageIndex + 1,
      orElse: () => 1,
    );
    emit(.loadingMore(items));

    final newFilter = GetMemberVehicleListParams(
      page: filter.page + 1,
      size: filter.size,
      keyword: filter.keyword,
      time: filter.time,
      type: filter.type,
    );
    final result = await _getMemberVehicleList(filter: newFilter);
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
