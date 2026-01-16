import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/screens/camera/models/vehicle_type.dart';

part 'revenue_filter.freezed.dart';
part 'revenue_filter.g.dart';

@freezed
sealed class RevenueFilter with _$RevenueFilter {
  const factory RevenueFilter({
    String? keyword,
    DateTime? time,
    VehicleType? type,
  }) = _RevenueFilter;

  factory RevenueFilter.fromJson(Map<String, dynamic> json) =>
      _$RevenueFilterFromJson(json);
}
