part of 'site_cubit.dart';

@freezed
sealed class SiteState with _$SiteState {
  const factory SiteState.initial() = Initial;

  const factory SiteState.loading() = Loading;

  const factory SiteState.loaded({
    required List<SiteEntity> siteList,
    SiteEntity? currentSite,
  }) = Loaded;

  const factory SiteState.empty() = Empty;

  const factory SiteState.failed(String? message) = Failed;
}

extension SiteStateExtension on SiteState {
  SiteEntity? get currentSite => switch (this) {
    Loaded(:final currentSite) => currentSite,
    _ => null,
  };

  List<SiteEntity> get siteList => switch (this) {
    Loaded(:final siteList) => siteList,
    _ => [],
  };
}
