import 'dart:convert'; // Import dart:convert for JSON encoding/decoding
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zupa/features/auth/data/models/account_request.dart';

@lazySingleton
class StorageService {
  final SharedPreferencesAsync _sharedPreferences;

  StorageService(this._sharedPreferences);

  /// Save token with a Time-To-Live (TTL).
  /// [duration] determines how long the token remains valid.
  Future<void> setAuth(String accessToken, {Duration duration = const Duration(hours: 1)}) async {
    await _setStringWithTTL('accessToken', accessToken, duration);
  }

  /// Get token. Returns null if the token does not exist OR has expired.
  Future<String?> getAuth() async {
    return await _getStringWithTTL('accessToken');
  }

  Future<void> removeAuth() async {
    await _sharedPreferences.remove('accessToken');
  }

  /// Private helper to save a string with an expiration date
  Future<void> _setStringWithTTL(String key, String value, Duration duration) async {
    final expireDate = DateTime.now().add(duration);

    // Create a wrapper object
    final Map<String, dynamic> data = {
      'val': value,
      'exp': expireDate.toIso8601String(),
    };

    // Save as JSON string
    await _sharedPreferences.setString(key, jsonEncode(data));
  }

  /// Private helper to retrieve a string, checking if it has expired
  Future<String?> _getStringWithTTL(String key) async {
    final String? rawJson = await _sharedPreferences.getString(key);

    if (rawJson == null) return null;

    try {
      // Decode the JSON
      final Map<String, dynamic> data = jsonDecode(rawJson);

      // Check if "exp" key exists and parse it
      if (data.containsKey('exp')) {
        final expireAt = DateTime.parse(data['exp']);

        // If current time is AFTER the expiration date
        if (DateTime.now().isAfter(expireAt)) {
          // It is expired. Remove it and return null.
          await _sharedPreferences.remove(key);
          return null;
        }
      }

      // If valid, return the value
      return data['val'] as String?;
    } catch (e) {
      return null;
    }
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