import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SecurityService {
  Future<bool> get isJailBroken async =>
      await FlutterJailbreakDetection.jailbroken;

  Future<bool> get isDeveloperMode async =>
      await FlutterJailbreakDetection.developerMode;

  Future<bool> get isSecurityVulnerable async {
    final bool jailbroken = await isJailBroken;
    // We could add more checks here later
    return jailbroken;
  }
}
