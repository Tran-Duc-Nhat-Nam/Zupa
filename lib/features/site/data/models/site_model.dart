import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/features/site/domain/entities/site_entity.dart';

part 'site_model.freezed.dart';
part 'site_model.g.dart';

@freezed
sealed class SiteModel with _$SiteModel {
  const SiteModel._();

  const factory SiteModel({
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
  }) = _SiteModel;

  factory SiteModel.fromJson(Map<String, dynamic> json) =>
      _$SiteModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();

  SiteEntity toEntity() => SiteEntity(
    id: id,
    code: code,
    name: name,
    fullName: fullName,
    logo: logo,
    logoFullSizeUrl: logoFullSizeUrl,
    address: address,
    phoneNumber: phoneNumber,
    email: email,
    currency: currency,
  );
}
