part of 'member_vehicle_detail_cubit.dart';

@freezed
sealed class MemberVehicleDetailState with _$MemberVehicleDetailState {
  const factory MemberVehicleDetailState.initial() = Initial;

  const factory MemberVehicleDetailState.loading() = Loading;

  const factory MemberVehicleDetailState.loaded(MemberVehicleEntity vehicle) =
      Loaded;

  const factory MemberVehicleDetailState.createNew() = CreatNew;

  const factory MemberVehicleDetailState.failed(String? message) = Failed;

  const factory MemberVehicleDetailState.createdSucceed() = CreatedSucceed;

  const factory MemberVehicleDetailState.updatedSucced() = UpdatedSucceed;

  const factory MemberVehicleDetailState.empty() = Empty;
}
