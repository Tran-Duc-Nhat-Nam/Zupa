import 'package:flutter/cupertino.dart';
import 'package:zupa/core/services/version_service.dart';
import 'package:zupa/core/widgets/popup/app_dialog.dart';

class VersionHelper {
  static Future<bool> checkUpdate(BuildContext context) async {
    final result = await VersionService.checkVersion();

    if (!context.mounted) return false;

    if (result != null) {
      if (result.isMaintaining) {
        DialogHelper.showMaintenanceDialog(context);
      } else if (result.isForcedUpdate) {
        DialogHelper.showUpdateDialog(
          context,
          version: result.latestVersion ?? '',
          isMandatory: true,
          onUpdate: () => result.update?.call(),
        );
      } else {
        DialogHelper.showUpdateDialog(
          context,
          version: result.latestVersion ?? '',
          isMandatory: false,
          onUpdate: () => result.update?.call(),
        );
      }
    }

    return result != null;
  }
}
