import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'; // Changed from cupertino for AppToast/Theme access
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/nfc_manager_android.dart';

import 'package:zupa/core/helper/router/router_helper.gr.dart';
import 'package:zupa/core/widgets/popup/app_toast.dart';
import 'package:zupa/gen/strings.g.dart';

class NfcHelper {
  static Future<void> startListenToNfc(BuildContext context) async {
    // 1. Basic Platform Checks
    if (kIsWeb || (!Platform.isAndroid && !Platform.isIOS)) return;

    // 2. Check Hardware Availability
    final isAvailable = await NfcManager.instance.checkAvailability();
    if (isAvailable != NfcAvailability.enabled) return;

    // 3. Start Session
    NfcManager.instance.startSession(
      // iOS specific alert message
      alertMessageIos: context.mounted
          ? t.error
          : 'Hold your phone near the tag',
      onSessionErrorIos: (error) async {
        // Handle session errors silently or log them
        debugPrint('NFC Session Error: $error');
      },
      onDiscovered: (NfcTag tag) async {
        bool isValidTag = false;

        // 4. Validate Tag Type based on Platform
        if (Platform.isAndroid) {
          // Check for MifareClassic specifically
          final mifare = MifareClassicAndroid.from(tag);
          isValidTag = mifare != null;
        } else if (Platform.isIOS) {
          // iOS does not support "MifareClassicAndroid".
          // It usually reads these as Iso7816 or FeliCa.
          // We assume any detected tag is valid for Check-In on iOS
          // unless you need specific data reading.
          isValidTag = true;
        }

        // 5. Navigate
        if (!context.mounted) return;

        if (isValidTag) {
          // Stop session on iOS immediately after read (Android handles this differently)
          if (Platform.isIOS) NfcManager.instance.stopSession();

          context.pushRoute(CheckInRoute(isCheckOut: true));
        } else {
          // On iOS, invalidate session with error message
          if (Platform.isIOS) {
            await NfcManager.instance.stopSession(
              errorMessageIos: t.error,
            );
          }
          AppToast.showNotify(t.error);
        }
      },
      pollingOptions: {
        NfcPollingOption.iso14443,
        NfcPollingOption.iso15693, // Added for broader tag support
      },
    );
  }

  static void stopListenToNfc() {
    // Safe to call even if no session is active
    NfcManager.instance.stopSession();
  }
}
