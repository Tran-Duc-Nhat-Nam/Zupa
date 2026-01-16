import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/models/account_request.dart';

@lazySingleton
class StorageService {
  final SharedPreferencesAsync _sharedPreferences;

  StorageService(this._sharedPreferences);

  Future<void> setAuth(String accessToken) async {
    await _sharedPreferences.setString('accessToken', accessToken);
  }

  Future<String?> getAuth() async {
    return _sharedPreferences.getString('accessToken');
  }

  Future<void> removeAuth() async {
    await _sharedPreferences.remove('accessToken');
  }

  Future<void> saveAccountInfo(AccountRequest info) async {
    await _sharedPreferences.setString('accountTenant', info.tenant);
    await _sharedPreferences.setString('accountUsername', info.username);
    await _sharedPreferences.setString('accountPassword', info.password);
  }

  Future<AccountRequest> getAccountInfo() async {
    return AccountRequest(
      tenant: await _sharedPreferences.getString('accountTenant') ?? '',
      username: await _sharedPreferences.getString('accountUsername') ?? '',
      password: await _sharedPreferences.getString('accountPassword') ?? '',
    );
  }

  Future<void> removeAccountInfo() async {
    await _sharedPreferences.remove('accountTenant');
    await _sharedPreferences.remove('accountUsername');
    await _sharedPreferences.remove('accountPassword');
  }

  Future<void> setBiometricAuth(bool isBiometricAuth) async {
    await _sharedPreferences.setBool('isBiometricAuth', isBiometricAuth);
  }

  Future<bool?> getBiometricAuth() async {
    return _sharedPreferences.getBool('isBiometricAuth');
  }
}
