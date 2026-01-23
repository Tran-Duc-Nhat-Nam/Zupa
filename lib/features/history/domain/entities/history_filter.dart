import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:zupa/core/models/vehicle_type.dart';

part 'history_filter.freezed.dart';
part 'history_filter.g.dart';

@freezed
sealed class HistoryFilter with _$HistoryFilter {
  const factory HistoryFilter({
    String? keyword,
    DateTime? time,
    VehicleType? type,
  }) = _HistoryFilter;

  factory HistoryFilter.fromJson(Map<String, dynamic> json) =>
      _$HistoryFilterFromJson(json);
}
