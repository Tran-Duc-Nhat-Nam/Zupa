import 'package:freezed_annotation/freezed_annotation.dart';

part 'site.freezed.dart';
part 'site.g.dart';

@freezed
sealed class Site with _$Site {
  const factory Site({
    @Default(0) int id,
    @Default('') String code,
    @Default('') String name,
    @Default('') String fullName,
    String? logo,
    String? logoFullSizeUrl,
    @Default('') String address,
    String? phoneNumber,
    @Default('') String email,
    @Default('') String currency,
  }) = _Site;

  factory Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();
}
