import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

import 'package:zupa/core/services/storage_service.dart';

@lazySingleton
class BiometricService {
  final LocalAuthentication _auth;
  final StorageService _storageService;

  BiometricService(this._auth, this._storageService);

  Future<bool> get isEnabled async =>
      await _storageService.getBiometricAuth() == true;

  Future<bool> authenticate() async {
    if (!await isEnabled) return false;

    final bool canAuthenticateWithBiometrics = await _auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await _auth.isDeviceSupported();

    if (!canAuthenticate) {
      throw BiometricError(
        code: 'no_hardware',
        message: 'Biometric authentication is not available',
      );
    }

    final List<BiometricType> availableBiometrics = await _auth
        .getAvailableBiometrics();

    if (availableBiometrics.isEmpty) {
      throw BiometricError(
        code: 'no_enrolled',
        message: 'Biometric authentication is not enrolled',
      );
    }

    if (availableBiometrics.contains(BiometricType.weak) ||
        availableBiometrics.contains(BiometricType.strong) ||
        // iOS often returns just 'face' or 'fingerprint' which might map to other types,
        // but typically checking for weak/strong/or merely existing is enough if isDeviceSupported is true.
        // The original code checked explicitly for weak/strong.
        availableBiometrics.isNotEmpty) {
      try {
        final bool didAuthenticate = await _auth.authenticate(
          localizedReason: 'Please authenticate to show account balance',
        );
        return didAuthenticate;
      } on LocalAuthException catch (e) {
        throw BiometricError(code: e.code.toString(), message: e.toString());
      }
    }

    return false;
  }
}

class BiometricError implements Exception {
  final String code;
  final String message;
  BiometricError({required this.code, required this.message});

  @override
  String toString() => message;
}
