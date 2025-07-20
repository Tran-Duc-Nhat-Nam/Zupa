part of 'member_vehicles_filter_cubit.dart';

@freezed
sealed class MemberVehiclesFilterState with _$MemberVehiclesFilterState {
  const factory MemberVehiclesFilterState.initial() = Initial;
  const factory MemberVehiclesFilterState.loading() = Loading;
  const factory MemberVehiclesFilterState.loaded({@Default(MemberVehiclesFilter()) MemberVehiclesFilter filter}) = Loaded;
  const factory MemberVehiclesFilterState.filtering({@Default(MemberVehiclesFilter()) MemberVehiclesFilter filter}) = Filtering;
  const factory MemberVehiclesFilterState.failed(String message) = Failed;
}
