import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_brief.freezed.dart';
part 'user_brief.g.dart';

@freezed
sealed class UserBrief with _$UserBrief {
  const factory UserBrief({
    @Default(0) int id,
    @Default('') String tenantId,
    @Default('') String name,
  }) = _UserBrief;

  factory UserBrief.fromJson(Map<String, dynamic> json) =>
      _$UserBriefFromJson(json);
}