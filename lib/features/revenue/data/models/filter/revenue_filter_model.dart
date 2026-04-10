import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/constants/vehicle_types.dart';
import 'package:zupa/core/helper/converter/date_time_converter.dart';
import 'package:zupa/features/revenue/domain/usecases/params/get_revenue_params.dart';

part 'revenue_filter_model.freezed.dart';
part 'revenue_filter_model.g.dart';

@freezed
sealed class RevenueFilterModel with _$RevenueFilterModel {
  const RevenueFilterModel._();

  const factory RevenueFilterModel({
    @Default('') String paidByType,
    @Default('') String productTypeValue,
    @DateTimeConverter() required DateTime fromDate,
    @DateTimeConverter() required DateTime toDate,
  }) = _RevenueFilterModel;

  factory RevenueFilterModel.fromJson(Map<String, dynamic> json) =>
      _$RevenueFilterModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();

  GetRevenueParams toEntity() => GetRevenueParams(
    keyword: paidByType,
    type: switch (productTypeValue) {
      'linen' => vehicleTypes[0],
      'uniform' => vehicleTypes[1],
      _ => vehicleTypes[2],
    },
    fromDate: fromDate,
    toDate: toDate,
  );

  factory RevenueFilterModel.fromEntity(GetRevenueParams entity) {
    return RevenueFilterModel(
      paidByType: entity.keyword,
      productTypeValue: switch (entity.type?.name) {
        'motorbike' => 'linen',
        'bike' => 'uniform',
        _ => 'guest',
      },
      fromDate: entity.fromDate,
      toDate: entity.toDate,
    );
  }
}
