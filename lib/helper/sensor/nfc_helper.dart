import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/nfc_manager_android.dart';

import '../../widgets/popup/app_toast.dart';

class NfcHelper {
  static void startListenToNfc(BuildContext context) {
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
      NfcManager.instance.checkAvailability().then(
        (value) => value == NfcAvailability.enabled
            ? NfcManager.instance.startSession(
                onDiscovered: (NfcTag tag) async {
                  final MifareClassicAndroid? data = MifareClassicAndroid.from(
                    tag,
                  );
                  if (data == null) {
                    AppToast.showErrorToast(context.tr('error'));
                  } else {
                    context.pushNamed('CheckIn', extra: false);
                  }
                },
                pollingOptions: {NfcPollingOption.iso14443},
              )
            : null,
      );
    }
  }

  static void stopListenToNfc() {
    NfcManager.instance.stopSession();
  }
}
