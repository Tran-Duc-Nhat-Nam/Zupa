import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zupa/core/constants/localization.dart';
import 'package:zupa/core/styles/theme.dart';
import 'package:zupa/features/auth/data/models/account_request.dart';

@lazySingleton
class StorageService {
  final SharedPreferencesAsync _sharedPreferences;
  final FlutterSecureStorage _secureStorage;

  // Ensure you register FlutterSecureStorage in your DI module
  StorageService(this._sharedPreferences, this._secureStorage);

  // ===========================================================================
  // AUTH TOKEN (SECURE STORAGE)
  // ===========================================================================

  /// Save token with a Time-To-Live (TTL) into Secure Storage.
  Future<void> setAuth(
    String accessToken, {
    Duration duration = const Duration(hours: 1),
  }) async {
    await _setSecureStringWithTTL('accessToken', accessToken, duration);
  }

  /// Get token from Secure Storage. Returns null if expired or missing.
  Future<String?> getAuth() async {
    return _getSecureStringWithTTL('accessToken');
  }

  Future<void> removeAuth() async {
    await _secureStorage.delete(key: 'accessToken');
  }

  // ===========================================================================
  // ACCOUNT INFO (SECURE STORAGE)
  // ===========================================================================

  /// Account info contains passwords, so we MUST use Secure Storage.
  Future<void> saveAccountInfo(AccountRequest info) async {
    await _secureStorage.write(key: 'accountTenant', value: info.tenant);
    await _secureStorage.write(key: 'accountUsername', value: info.username);
    await _secureStorage.write(key: 'accountPassword', value: info.password);
  }

  Future<AccountRequest> getAccountInfo() async {
    return AccountRequest(
      tenant: await _secureStorage.read(key: 'accountTenant') ?? '',
      username: await _secureStorage.read(key: 'accountUsername') ?? '',
      password: await _secureStorage.read(key: 'accountPassword') ?? '',
    );
  }

  Future<void> removeAccountInfo() async {
    await _secureStorage.delete(key: 'accountTenant');
    await _secureStorage.delete(key: 'accountUsername');
    await _secureStorage.delete(key: 'accountPassword');
  }

  // ===========================================================================
  // APP PREFERENCES (SHARED PREFERENCES)
  // Non-sensitive data is kept in SharedPrefs for performance.
  // ===========================================================================

  Future<void> setBiometricAuth(bool isBiometricAuth) async {
    await _sharedPreferences.setBool('isBiometricAuth', isBiometricAuth);
  }

  Future<bool?> getBiometricAuth() async {
    return _sharedPreferences.getBool('isBiometricAuth');
  }

  Future<void> setTheme(AppThemeMode mode) async {
    mode == AppThemeMode.followSystem
        ? await _sharedPreferences.remove('brightnessMode')
        : mode == AppThemeMode.light
        ? await _sharedPreferences.setBool('brightnessMode', true)
        : await _sharedPreferences.setBool('brightnessMode', false);
  }

  Future<AppThemeMode> getTheme() async {
    final value = await _sharedPreferences.getBool('brightnessMode');
    return value == null
        ? AppThemeMode.followSystem
        : value
        ? AppThemeMode.light
        : AppThemeMode.dark;
  }

  Future<void> setLocalization(AppLocalization mode) async {
    final value = mode.getLocaleString();
    value == null
        ? await _sharedPreferences.remove('locale')
        : await _sharedPreferences.setString('locale', value);
  }

  Future<AppLocalization> getLocalization() async {
    final value = await _sharedPreferences.getString('locale');
    return AppLocalization.values.firstWhere(
      (element) => element.name == value,
      orElse: () => AppLocalization.followSystem,
    );
  }

  Future<void> setDebuggerMode(bool isOn) async {
    await _sharedPreferences.setBool('isDebuggerMode', isOn);
  }

  Future<bool> getDebuggerMode() async {
    return await _sharedPreferences.getBool('isDebuggerMode') == true;
  }

  Future<void> setWarningCapacityThreshold(int value) {
    return _sharedPreferences.setInt('isWarningCapacityThreshold', value);
  }

  Future<int> getWarningCapacityThreshold() async {
    return await _sharedPreferences.getInt('isWarningCapacityThreshold') ?? -1;
  }

  // ===========================================================================
  // PRIVATE HELPERS (SECURE STORAGE + TTL)
  // ===========================================================================

  /// Helper to save a string with an expiration date into Secure Storage
  Future<void> _setSecureStringWithTTL(
    String key,
    String value,
    Duration duration,
  ) async {
    final expireDate = DateTime.now().add(duration);

    final Map<String, dynamic> data = {
      'val': value,
      'exp': expireDate.toIso8601String(),
    };

    // Use write instead of setString
    await _secureStorage.write(key: key, value: jsonEncode(data));
  }

  /// Helper to retrieve a string from Secure Storage, checking expiration
  Future<String?> _getSecureStringWithTTL(String key) async {
    // Use read instead of getString
    final String? rawJson = await _secureStorage.read(key: key);

    if (rawJson == null) return null;

    try {
      final Map<String, dynamic> data = jsonDecode(rawJson);

      if (data.containsKey('exp')) {
        final expireAt = DateTime.parse(data['exp']);

        if (DateTime.now().isAfter(expireAt)) {
          // Expired: delete from secure storage
          await _secureStorage.delete(key: key);
          return null;
        }
      }

      return data['val'] as String?;
    } catch (e) {
      // If JSON is corrupted, clear it
      await _secureStorage.delete(key: key);
      return null;
    }
  }
}
