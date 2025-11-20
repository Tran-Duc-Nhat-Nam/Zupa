import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:local_auth/local_auth.dart';

import '../../common/constants/shared_ref.dart';
import '../../data/request/account/account_request.dart';
import '../../widgets/popup/app_toast.dart';

class AuthHelper {
  static Future<void> setAuth(String accessToken) async {
    await sharedPreferences.setString('accessToken', accessToken);
  }

  static Future<String?> getAuth() async {
    return sharedPreferences.getString('accessToken');
  }

  static Future<void> removeAuth() async {
    await sharedPreferences.remove('accessToken');
  }

  static Future<void> saveAccountInfo(AccountRequest info) async {
    await sharedPreferences.setString('accountTenant', info.tenant);
    await sharedPreferences.setString('accountUsername', info.username);
    await sharedPreferences.setString('accountPassword', info.password);
  }

  static Future<AccountRequest> getAccountInfo() async {
    return AccountRequest(
      tenant: await sharedPreferences.getString('accountTenant') ?? '',
      username: await sharedPreferences.getString('accountUsername') ?? '',
      password: await sharedPreferences.getString('accountPassword') ?? '',
    );
  }

  static Future<void> removeAccountInfo() async {
    await sharedPreferences.remove('accountTenant');
    await sharedPreferences.remove('accountUsername');
    await sharedPreferences.remove('accountPassword');
  }

  static Future<void> setBiometricAuth(bool isBiometricAuth) async {
    await sharedPreferences.setBool('isBiometricAuth', isBiometricAuth);
  }

  static Future<bool?> getBiometricAuth() async {
    return sharedPreferences.getBool('isBiometricAuth');
  }

  static Future<bool> biometricCheck(BuildContext context) async {
    if ((await getBiometricAuth()) == true) {
      final auth = LocalAuthentication();
      final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
      final bool canAuthenticate =
          canAuthenticateWithBiometrics || await auth.isDeviceSupported();

      if (canAuthenticate) {
        final List<BiometricType> availableBiometrics = await auth
            .getAvailableBiometrics();

        if (availableBiometrics.isEmpty) {
          return false;
        }

        if (availableBiometrics.contains(BiometricType.weak) ||
            availableBiometrics.contains(BiometricType.strong)) {
          try {
            final bool didAuthenticate = await auth.authenticate(
              localizedReason: 'Please authenticate to show account balance',
            );
            return didAuthenticate;
          } on LocalAuthException catch (e) {
            if (context.mounted) {
              switch (e.code) {
                case .noBiometricsEnrolled:
                  AppToast.showErrorToast(
                    context.tr('Biometric authentication is not enrolled'),
                  );
                case .noBiometricHardware:
                  AppToast.showErrorToast(
                    context.tr('Biometric authentication is not available'),
                  );
                default:
                  AppToast.showErrorToast(
                    context.tr(e.description ?? 'Unknown error'),
                  );
              }
            } else {
              AppToast.showErrorToast('Unknown error');
            }
          }
        }
      }
    }

    return false;
  }
}
