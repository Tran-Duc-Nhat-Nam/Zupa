import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/models/vehicle_type_model.dart';
import 'package:zupa/features/revenue/domain/entities/filter/revenue_filter_entity.dart';

part 'revenue_filter_model.freezed.dart';
part 'revenue_filter_model.g.dart';

@freezed
sealed class RevenueFilterModel with _$RevenueFilterModel {
  const RevenueFilterModel._();
  const factory RevenueFilterModel({
    @Default(0) int page,
    @Default(10) int size,
    String? keyword,
    DateTime? time,
    VehicleTypeModel? type,
  }) = _RevenueFilterModel;

  factory RevenueFilterModel.fromJson(Map<String, dynamic> json) =>
      _$RevenueFilterModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();

  RevenueFilterEntity toEntity() =>
      RevenueFilterEntity(
        page: page,
        size: size,
        keyword: keyword,
        time: time,
        type: type?.toEntity(),
      );

  factory RevenueFilterModel.fromEntity(RevenueFilterEntity entity) {
    return RevenueFilterModel(
      page: entity.page,
      size: entity.size,
      keyword: entity.keyword,
      time: entity.time,
      type: entity.type != null
          ? VehicleTypeModel.fromEntity(entity.type!)
          : null,
    );
  }
}
