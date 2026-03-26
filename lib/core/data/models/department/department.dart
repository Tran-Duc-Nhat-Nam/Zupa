import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/data/models/user_brief/user_brief.dart';
import 'package:zupa/core/helper/converter/date_time_converter.dart';

part 'department.freezed.dart';
part 'department.g.dart';

@freezed
sealed class Department with _$Department {
  const factory Department({
    @Default(0) int id,
    @Default(0) int tenantId,
    @DateTimeConverter() DateTime? dateCreated,
    @DateTimeConverter() DateTime? lastUpdated,
    UserBrief? modifiedBy,
    UserBrief? createdBy,
    @Default('') String code,
    @Default('') String name,
    String? note,
    @Default(true) bool active,
    String? phoneNumber,
    String? blockForTimesheet,
  }) = _Department;

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);
}
