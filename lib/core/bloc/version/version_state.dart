part of 'version_cubit.dart';

@freezed
sealed class VersionState with _$VersionState {
  const factory VersionState.initial() = Initial;

  const factory VersionState.standby() = Standby;

  const factory VersionState.checking(bool isShow) = Checking;

  const factory VersionState.upToDate(VersionInfo info) = UpToDate;

  const factory VersionState.maintaining() = Maintaining;

  const factory VersionState.updateAvailable(VersionInfo info) =
      UpdateAvailable;

  const factory VersionState.downloading(
    Stream<int> progress,
    VersionInfo info,
  ) = Downloading;

  const factory VersionState.downloadSuccess() = DownloadSuccess;

  const factory VersionState.downloadFailed(String message, VersionInfo info) =
      DownloadFailed;

  const factory VersionState.installing() = Installing;

  const factory VersionState.installSucceed() = InstallSucceed;

  const factory VersionState.installFailed() = InstallFailed;
}

extension VersionStateExtension on VersionState {
  bool get isChecking => switch (this) {
    Checking() => true,
    _ => false,
  };

  VersionInfo? get info => switch (this) {
    UpToDate(:final info) => info,
    UpdateAvailable(:final info) => info,
    Downloading(:final info) => info,
    DownloadFailed(:final info) => info,
    _ => null,
  };
}
