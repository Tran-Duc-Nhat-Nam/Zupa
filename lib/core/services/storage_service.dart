import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zupa/core/bloc/usecases/theme/set/params/set_theme_params.dart';
import 'package:zupa/core/bloc/usecases/ui_settings/set/params/set_ui_settings_params.dart';
import 'package:zupa/core/constants/localization.dart';
import 'package:zupa/core/data/models/user/user.dart';
import 'package:zupa/core/data/request/account/account_request.dart';
import 'package:zupa/core/entities/theme_settings_entity.dart';
import 'package:zupa/core/entities/ui_settings_entity.dart';
import 'package:zupa/features/general_config/domain/entities/general_config_entity.dart';
import 'package:zupa/features/general_config/domain/usecases/set/params/set_general_config_params.dart';

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
    Duration duration = const .new(hours: 1),
  }) async => _setSecureStringWithTTL('accessToken', accessToken, duration);

  /// Get token from Secure Storage. Returns null if expired or missing.
  Future<String?> getAuth() async => _getSecureStringWithTTL('accessToken');

  Future<void> removeAuth() async => _secureStorage.delete(key: 'accessToken');

  // ===========================================================================
  // ACCOUNT INFO (SECURE STORAGE)
  // ===========================================================================

  Future<void> saveAccountInfo(
    String tenant,
    String username,
    String password,
  ) async => (
    _secureStorage.write(key: 'accountTenant', value: tenant),
    _secureStorage.write(key: 'accountUsername', value: username),
    _secureStorage.write(key: 'accountPassword', value: password),
  ).wait;

  Future<AccountRequest> getAccountInfo() async {
    final (tenant, username, password) = await (
      _secureStorage.read(key: 'accountTenant'),
      _secureStorage.read(key: 'accountUsername'),
      _secureStorage.read(key: 'accountPassword'),
    ).wait;
    return AccountRequest(
      tenant: tenant ?? '',
      username: username ?? '',
      password: password ?? '',
    );
  }

  Future<void> removeAccountInfo() async => (
    _secureStorage.delete(key: 'accountTenant'),
    _secureStorage.delete(key: 'accountUsername'),
    _secureStorage.delete(key: 'accountPassword'),
  ).wait;

  // ===========================================================================
  // USER INFO (SECURE STORAGE)
  // ===========================================================================

  Future<void> setUser(User user) async =>
      _secureStorage.write(key: 'user', value: jsonEncode(user.toJson()));

  Future<User?> getUser() async {
    final String? rawJson = await _secureStorage.read(key: 'user');
    if (rawJson == null) return null;
    try {
      return User.fromJson(jsonDecode(rawJson));
    } catch (e) {
      return null;
    }
  }

  Future<void> removeUser() async => _secureStorage.delete(key: 'user');

  // ===========================================================================
  // APP PREFERENCES (SHARED PREFERENCES)
  // Non-sensitive data is kept in SharedPrefs for performance.
  // ===========================================================================

  Future<void> setBiometricAuth(bool isBiometricAuth) async =>
      _sharedPreferences.setBool('isBiometricAuth', isBiometricAuth);

  Future<bool?> getBiometricAuth() async =>
      _sharedPreferences.getBool('isBiometricAuth');

  Future<void> setTheme({required SetThemeParams params}) async {
    (
      _sharedPreferences.setInt('themeMode', params.themeMode.index),
      _sharedPreferences.setInt('colorSource', params.colorSource.index),
    ).wait;
    if (params.seedColorValue != null) {
      await _sharedPreferences.setInt('seedColorValue', params.seedColorValue!);
    } else {
      await _sharedPreferences.remove('seedColorValue');
    }
  }

  Future<ThemeSettingsEntity> getTheme() async {
    final (themeModeIndex, colorSourceIndex, seedColorValue) = await (
      _sharedPreferences.getInt('themeMode'),
      _sharedPreferences.getInt('colorSource'),
      _sharedPreferences.getInt('seedColorValue'),
    ).wait;

    return .new(
      themeMode: themeModeIndex != null ? .values[themeModeIndex] : .system,
      colorSource: colorSourceIndex != null
          ? .values[colorSourceIndex]
          : .brand,
      seedColorValue: seedColorValue,
    );
  }

  Future<void> setLocalization(AppLocalization mode) async {
    final value = mode.getLocaleString();
    value == null
        ? await _sharedPreferences.remove('locale')
        : await _sharedPreferences.setString('locale', value);
  }

  Future<AppLocalization> getLocalization() async {
    final value = await _sharedPreferences.getString('locale');
    return .values.firstWhere(
      (element) => element.name == value,
      orElse: () => .followSystem,
    );
  }

  Future<void> setDebuggerMode(bool isOn) async =>
      _sharedPreferences.setBool('isDebuggerMode', isOn);

  Future<bool> getDebuggerMode() async =>
      await _sharedPreferences.getBool('isDebuggerMode') ?? false;

  Future<void> setWarningCapacity(SetGeneralConfigParams params) async => (
    _sharedPreferences.setBool('isWarningCapacity', params.isWarningCapacity),
    _sharedPreferences.setInt(
      'warningCapacityThreshold',
      params.warningCapacityThreshold,
    ),
  ).wait;

  Future<GeneralConfigEntity> getWarningCapacity() async {
    final (isWarningCapacity, warningCapacityThreshold) = await (
      _sharedPreferences.getBool('isWarningCapacity'),
      _sharedPreferences.getInt('warningCapacityThreshold'),
    ).wait;
    return GeneralConfigEntity(
      isWarning: isWarningCapacity ?? false,
      warningThreshold: warningCapacityThreshold ?? 0,
    );
  }

  Future<void> setAnimation(bool isOn) async =>
      _sharedPreferences.setBool('isAnimation', isOn);

  Future<bool> getAnimation() async =>
      await _sharedPreferences.getBool('isAnimation') ?? true;

  Future<void> setUISettings(SetUISettingsParams params) async => (
    _sharedPreferences.setBool('isFloatingNavbar', params.isFloatingNavbar),
    _sharedPreferences.setBool('isShowNavbarLabel', params.isShowNavbarLabel),
    _sharedPreferences.setBool('isGlassmorphism', params.isGlassmorphism),
  ).wait;

  Future<UISettingsEntity> getUISettings() async {
    final (isFloatingNavbar, isShowNavbarLabel, isGlassmorphism) = await (
      _sharedPreferences.getBool('isFloatingNavbar'),
      _sharedPreferences.getBool('isShowNavbarLabel'),
      _sharedPreferences.getBool('isGlassmorphism'),
    ).wait;
    return .new(
      isFloatingNavbar: isFloatingNavbar ?? false,
      isShowNavbarLabel: isShowNavbarLabel ?? false,
      isGlassmorphism: isGlassmorphism ?? false,
    );
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
