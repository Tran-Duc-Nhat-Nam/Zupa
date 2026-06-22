import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:safe_device/safe_device.dart';
import 'package:usb_debug_checker/usb_debug_checker.dart';

@lazySingleton
class SecurityService {
  Future<SecurityResult> get isSecurityVulnerable async {
    if (await UsbDebugChecker.isUsbDebuggingEnabled()) {
      return const VulnerableSecurityResult(reason: .usbDebugging);
    }
    if (await SafeDevice.isJailBroken) {
      return VulnerableSecurityResult(
        reason: Platform.isAndroid ? .rooted : .jailbroken,
      );
    }
    if (!(await SafeDevice.isRealDevice)) {
      return const VulnerableSecurityResult(reason: .emulator);
    }
    if (await SafeDevice.isDevelopmentModeEnable) {
      return const SafeSecurityResult(note: .developerMode);
    }
    return const SafeSecurityResult();
  }
}

sealed class SecurityResult {
  const SecurityResult();
}

class SafeSecurityResult<T> extends SecurityResult {
  const SafeSecurityResult({this.note});

  final SecurityViolationReason? note;
}

class VulnerableSecurityResult<T> extends SecurityResult {
  const VulnerableSecurityResult({required this.reason});

  final SecurityViolationReason reason;
}

enum SecurityViolationReason { rooted, jailbroken, developerMode, usbDebugging, emulator }
