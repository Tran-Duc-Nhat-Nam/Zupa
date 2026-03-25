import 'package:flutter_jailbreak_detection_plus/flutter_jailbreak_detection_plus.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SecurityService {
  Future<bool> get isJailBroken async =>
       FlutterJailbreakDetectionPlus.jailbroken;

  Future<bool> get isDeveloperMode async =>
       FlutterJailbreakDetectionPlus.developerMode;

  Future<bool> get isSecurityVulnerable async {
    final bool jailbroken = await isJailBroken;
    // We could add more checks here later
    return jailbroken;
  }
}
