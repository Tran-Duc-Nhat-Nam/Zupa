import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/constants/query.dart';
import 'package:zupa/core/models/vehicle_type_model.dart';
import 'package:zupa/features/home/domain/usecases/params/get_ticket_params.dart';

part 'home_filter_model.freezed.dart';
part 'home_filter_model.g.dart';

@freezed
sealed class HomeFilterModel with _$HomeFilterModel {
  const HomeFilterModel._();

  const factory HomeFilterModel({
    @Default(defaultPageIndex) int page,
    @Default(defaultPageSize) int size,
    String? keyword,
    DateTime? time,
    VehicleTypeModel? type,
  }) = _HomeFilterModel;

  factory HomeFilterModel.fromJson(Map<String, dynamic> json) =>
      _$HomeFilterModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();

  GetTicketParams toEntity() => .new(
    page: page,
    size: size,
    keyword: keyword,
    time: time,
    type: type?.toEntity(),
  );

  factory HomeFilterModel.fromEntity(GetTicketParams entity) {
    return .new(
      page: entity.page,
      size: entity.size,
      keyword: entity.keyword,
      time: entity.time,
      type: entity.type != null ? .fromEntity(entity.type!) : null,
    );
  }
}
