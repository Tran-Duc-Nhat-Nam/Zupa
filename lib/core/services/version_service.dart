import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:ota_update/ota_update.dart';
import 'package:versionarte/versionarte.dart';
import 'package:zupa/core/env/env.dart';
import 'package:zupa/core/helper/debugger/debugger_helper.dart';
import 'package:zupa/core/models/version_info.dart';
import 'package:zupa/core/services/device_service.dart';

class VersionService {
  static Future<VersionInfo?> checkVersion() async {
    final result = await Versionarte.check(
      versionarteProvider: RestfulVersionarteProvider(
        url: Env.gitHubVersionarteJson,
      ),
    );

    DebuggerHelper.talker.info('Versionarte Status: ${result.status}');

    return result.status == .forcedUpdate ||
            result.status == .inactive ||
            result.status == .outdated
        ? VersionInfo(
            isForcedUpdate: result.status == .forcedUpdate,
            isMaintaining: result.status == .inactive,
            latestVersion: result.manifest?.currentPlatform?.version.latest,
            message: result.manifest?.currentPlatform?.status.message?['en'],
            update: result.downloadUrls != null
                ? () => Platform.isAndroid
                      ? doUpdate(
                          result.downloadUrls![TargetPlatform.android] ?? '',
                          result.manifest?.currentPlatform?.version.latest ??
                              '',
                        )
                      : Versionarte.launchDownloadUrl(result.downloadUrls!)
                : null,
          )
        : null;
  }

  static Future<void> doUpdate(String updateUrl, String latestVersion) async {
    try {
      final abi = await DeviceService.getDeviceAbi();

      final finalUrl = updateUrl
          .replaceAll('<version>', latestVersion)
          .replaceAll('<abi>', abi);

      DebuggerHelper.talker.log(
        'Downloading specific APK for architecture: $abi from: $finalUrl',
      );

      OtaUpdate()
          .execute(updateUrl, destinationFilename: 'Zupa_$latestVersion.apk')
          .listen((OtaEvent event) {
            switch (event.status) {
              case OtaStatus.DOWNLOADING:
                DebuggerHelper.talker.log('Download progress: ${event.value}%');
              case OtaStatus.INSTALLING:
                DebuggerHelper.talker.log('Ready to install');
              case OtaStatus.ALREADY_RUNNING_ERROR:
                DebuggerHelper.talker.log('An update is already in progress');
              case OtaStatus.PERMISSION_NOT_GRANTED_ERROR:
                DebuggerHelper.talker.log('User declined permissions');
              default:
                DebuggerHelper.talker.log('Status: ${event.status}');
            }
          });
    } catch (e) {
      DebuggerHelper.talker.log('Failed to update: $e');
    }
  }
}
