part of 'version_cubit.dart';

@freezed
sealed class VersionState with _$VersionState {
  const factory VersionState.initial() = Initial;
  const factory VersionState.standby() = Standby;
  const factory VersionState.checking() = Checking;
  const factory VersionState.upToDate() = UpToDate;
  const factory VersionState.maintaining() = Maintaining;
  const factory VersionState.updateAvailable(VersionInfo info) = UpdateAvailable;
  const factory VersionState.downloading(Stream<int> progress, VersionInfo info) = Downloading;
  const factory VersionState.downloadSuccess() = DownloadSuccess;
  const factory VersionState.downloadFailed(String message, VersionInfo info) = DownloadFailed;
  const factory VersionState.installing() = Installing;
  const factory VersionState.installSucceed() = InstallSucceed;
  const factory VersionState.installFailed() = InstallFailed;
}
