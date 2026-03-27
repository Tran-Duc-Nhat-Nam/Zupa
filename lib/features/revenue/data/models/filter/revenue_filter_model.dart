import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/features/revenue/domain/entities/filter/revenue_filter_entity.dart';

part 'revenue_filter_model.freezed.dart';
part 'revenue_filter_model.g.dart';

@freezed
sealed class RevenueFilterModel with _$RevenueFilterModel {
  const RevenueFilterModel._();

  const factory RevenueFilterModel({
    @Default('') String paidByType,
    @Default('') String productTypeValue,
    required DateTime fromDate,
    required DateTime toDate,
  }) = _RevenueFilterModel;

  factory RevenueFilterModel.fromJson(Map<String, dynamic> json) =>
      _$RevenueFilterModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();

  RevenueFilterEntity toEntity() => RevenueFilterEntity(
    keyword: paidByType,
    type: switch (productTypeValue) {
      'linen' => vehicleTypes[0],
      'uniform' => vehicleTypes[1],
      _ => vehicleTypes[2],
    },
    fromDate: fromDate,
    toDate: toDate,
  );

  factory RevenueFilterModel.fromEntity(RevenueFilterEntity entity) {
    return RevenueFilterModel(
      paidByType: entity.keyword,
      productTypeValue: entity.type.name,
      fromDate: entity.fromDate,
      toDate: entity.toDate,
    );
  }
}
