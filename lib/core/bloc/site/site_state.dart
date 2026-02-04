part of 'site_cubit.dart';

@freezed
class SiteState with _$SiteState {
  const factory SiteState.initial() = Initial;
  const factory SiteState.loading() = Loading;
  const factory SiteState.loaded({
    @Default({}) dynamic data,
  }) = Loaded;

  const factory SiteState.empty() = Empty;
  const factory SiteState.failed(String message) = Failed;
}
