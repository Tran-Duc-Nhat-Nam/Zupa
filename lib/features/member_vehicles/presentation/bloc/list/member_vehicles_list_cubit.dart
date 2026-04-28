import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/constants/query.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/features/member_vehicles/domain/entities/member_vehicle_entity.dart';
import 'package:zupa/features/member_vehicles/domain/usecases/get_list/get_member_vehicle_list_usecase.dart';
import 'package:zupa/features/member_vehicles/domain/usecases/get_list/params/get_member_vehicle_list_params.dart';

part 'member_vehicles_list_cubit.freezed.dart';
part 'member_vehicles_list_state.dart';

@injectable
class MemberVehiclesListCubit extends Cubit<MemberVehiclesListState> {
  final GetMemberVehicleListUseCase _getMemberVehicleList;
  RequestToken? _getToken;

  MemberVehiclesListCubit(this._getMemberVehicleList) : super(const .initial());

  Future<void> init() async {
    emit(const .loading());
    _getToken?.cancel();
    _getToken = .new();
    final result = await _getMemberVehicleList(
      filter: .initial(),
      token: _getToken,
    );
    result.whenOrNull(
      success: (items) {
        if (items.isEmpty) {
          emit(const .empty());
        } else {
          emit(.loaded(items, defaultPageIndex));
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
    _getToken?.cancel();
    _getToken = .new();
    final result = await _getMemberVehicleList(
      filter: filter,
      token: _getToken,
    );
    result.whenOrNull(
      success: (data) => data.isEmpty
          ? emit(const .empty())
          : emit(.loaded(data, defaultPageIndex)),
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
      orElse: () => defaultPageIndex,
    );

    emit(.loadingMore(items));
    _getToken?.cancel();
    _getToken = .new();
    final newFilter = GetMemberVehicleListParams(
      page: filter.page + 1,
      size: filter.size,
      keyword: filter.keyword,
      time: filter.time,
      type: filter.type,
    );
    final result = await _getMemberVehicleList(
      filter: newFilter,
      token: _getToken,
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

  @override
  Future<void> close() {
    _getToken?.cancel();
    return super.close();
  }
}
