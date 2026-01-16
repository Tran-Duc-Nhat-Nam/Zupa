import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:zupa/core/models/vehicle_type.dart';

part 'home_filter.freezed.dart';
part 'home_filter.g.dart';

@freezed
sealed class HomeFilter with _$HomeFilter {
  const factory HomeFilter({
    String? keyword,
    DateTime? time,
    VehicleType? type,
  }) = _HomeFilter;

  factory HomeFilter.fromJson(Map<String, dynamic> json) =>
      _$HomeFilterFromJson(json);
}
