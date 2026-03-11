import 'package:flutter/services.dart';

class VersionInfo {
  final String? latestVersion;
  final bool isForcedUpdate;
  final bool isMaintaining;
  final String? message;
  final Map<TargetPlatform, String?>? updateUrl;
  final void Function()? update;

  const VersionInfo({
    required this.isForcedUpdate,
    required this.isMaintaining,
    this.latestVersion,
    this.updateUrl,
    this.message,
    this.update,
  });
}
