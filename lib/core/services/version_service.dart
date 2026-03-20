import 'package:injectable/injectable.dart';
import 'package:versionarte/versionarte.dart';
import 'package:zupa/core/env/env.dart';
import 'package:zupa/core/models/version_info.dart';

@lazySingleton
class VersionService {
  Future<VersionInfo?> checkVersion() async {
    final result = await Versionarte.check(
      versionarteProvider: RestfulVersionarteProvider(
        url: Env.gitHubVersionarteJson,
      ),
    );

    return VersionInfo(
      isForcedUpdate: result.status == .forcedUpdate,
      isMaintaining: result.status == .inactive,
      isUpToDate: result.status == .upToDate,
      latestVersion: result.manifest?.currentPlatform?.version.latest,
      message: result.manifest?.currentPlatform?.status.message?['en'],
      updateUrl: result.downloadUrls,
      update: result.downloadUrls != null
          ? () => Versionarte.launchDownloadUrl(result.downloadUrls!)
          : null,
    );
  }
}
