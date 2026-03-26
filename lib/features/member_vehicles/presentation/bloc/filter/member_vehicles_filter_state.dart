part of 'member_vehicles_filter_cubit.dart';

@freezed
sealed class MemberVehiclesFilterState with _$MemberVehiclesFilterState {
  const factory MemberVehiclesFilterState.initial() = Initial;

  const factory MemberVehiclesFilterState.loading() = Loading;

  const factory MemberVehiclesFilterState.loaded({
    @Default(
      MemberVehicleFilterEntity(
        page: defaultPageIndex,
        size: defaultPageSize,
        keyword: null,
        time: null,
        type: null,
      ),
    )
    MemberVehicleFilterEntity filter,
  }) = Loaded;

  const factory MemberVehiclesFilterState.filtering({
    @Default(
      MemberVehicleFilterEntity(
        page: defaultPageIndex,
        size: defaultPageSize,
        keyword: null,
        time: null,
        type: null,
      ),
    )
    MemberVehicleFilterEntity filter,
  }) = Filtering;

  const factory MemberVehiclesFilterState.failed(String? message) = Failed;
}
