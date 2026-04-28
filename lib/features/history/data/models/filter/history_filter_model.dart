import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/constants/query.dart';
import 'package:zupa/core/models/vehicle_type_model.dart';
import 'package:zupa/features/history/domain/usecases/params/get_history_params.dart';

part 'history_filter_model.freezed.dart';
part 'history_filter_model.g.dart';

@freezed
sealed class HistoryFilterModel with _$HistoryFilterModel {
  const HistoryFilterModel._();

  const factory HistoryFilterModel({
    @Default(defaultPageIndex) int page,
    @Default(defaultPageSize) int size,
    String? keyword,
    DateTime? time,
    VehicleTypeModel? type,
  }) = _HistoryFilterModel;

  factory HistoryFilterModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryFilterModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();

  GetHistoryParams toEntity() => .new(
    page: page,
    size: size,
    keyword: keyword,
    time: time,
    type: type?.toEntity(),
  );

  factory HistoryFilterModel.fromEntity(GetHistoryParams entity) {
    return .new(
      page: entity.page,
      size: entity.size,
      keyword: entity.keyword,
      time: entity.time,
      type: entity.type != null ? .fromEntity(entity.type!) : null,
    );
  }
}
