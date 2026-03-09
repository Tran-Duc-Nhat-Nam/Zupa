class VersionInfo {
  final String? latestVersion;
  final bool isForcedUpdate;
  final bool isMaintaining;
  final String? message;
  final void Function()? update;

  const VersionInfo({
    required this.isForcedUpdate,
    required this.isMaintaining,
    this.latestVersion,
    this.message,
    this.update,
  });
}
