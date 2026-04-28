import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/constants/query.dart';
import 'package:zupa/core/models/vehicle_type_model.dart';
import 'package:zupa/features/member_vehicles/domain/usecases/get_list/params/get_member_vehicle_list_params.dart';

part 'member_vehicles_filter_model.freezed.dart';
part 'member_vehicles_filter_model.g.dart';

@freezed
sealed class MemberVehiclesFilterModel with _$MemberVehiclesFilterModel {
  const MemberVehiclesFilterModel._();

  const factory MemberVehiclesFilterModel({
    @Default(defaultPageIndex) int page,
    @Default(defaultPageSize) int size,
    String? keyword,
    DateTime? time,
    VehicleTypeModel? type,
  }) = _MemberVehiclesFilterModel;

  factory MemberVehiclesFilterModel.fromJson(Map<String, dynamic> json) =>
      _$MemberVehiclesFilterModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();

  GetMemberVehicleListParams toEntity() => .new(
    page: page,
    size: size,
    keyword: keyword,
    time: time,
    type: type?.toEntity(),
  );

  factory MemberVehiclesFilterModel.fromEntity(
    GetMemberVehicleListParams entity,
  ) {
    return .new(
      page: entity.page,
      size: entity.size,
      keyword: entity.keyword,
      time: entity.time,
      type: entity.type != null ? .fromEntity(entity.type!) : null,
    );
  }
}
