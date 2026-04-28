import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zupa/core/bloc/usecases/ui_settings/set/params/set_ui_settings_params.dart';
import 'package:zupa/core/constants/localization.dart';
import 'package:zupa/core/data/models/user/user.dart';
import 'package:zupa/core/data/request/account/account_request.dart';
import 'package:zupa/core/entities/ui_settings_entity.dart';
import 'package:zupa/core/models/form/theme/theme_settings_form.dart';
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

  Future<void> saveAccountInfo(
    String tenant,
    String username,
    String password,
  ) async {
    await _secureStorage.write(key: 'accountTenant', value: tenant);
    await _secureStorage.write(key: 'accountUsername', value: username);
    await _secureStorage.write(key: 'accountPassword', value: password);
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
  // USER INFO (SECURE STORAGE)
  // ===========================================================================

  Future<void> setUser(User user) async {
    await _secureStorage.write(key: 'user', value: jsonEncode(user.toJson()));
  }

  Future<User?> getUser() async {
    final String? rawJson = await _secureStorage.read(key: 'user');
    if (rawJson == null) return null;
    try {
      return User.fromJson(jsonDecode(rawJson));
    } catch (e) {
      return null;
    }
  }

  Future<void> removeUser() async {
    await _secureStorage.delete(key: 'user');
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

  Future<void> setTheme(ThemeSettings settings) async {
    await _sharedPreferences.setInt('themeMode', settings.themeMode.index);
    await _sharedPreferences.setInt('colorSource', settings.colorSource.index);
    if (settings.seedColorValue != null) {
      await _sharedPreferences.setInt(
        'seedColorValue',
        settings.seedColorValue!,
      );
    } else {
      await _sharedPreferences.remove('seedColorValue');
    }
  }

  Future<ThemeSettings> getTheme() async {
    final themeModeIndex = await _sharedPreferences.getInt('themeMode');
    final colorSourceIndex = await _sharedPreferences.getInt('colorSource');
    final seedColorValue = await _sharedPreferences.getInt('seedColorValue');

    return ThemeSettings(
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
    return AppLocalization.values.firstWhere(
      (element) => element.name == value,
      orElse: () => .followSystem,
    );
  }

  Future<void> setDebuggerMode(bool isOn) async {
    await _sharedPreferences.setBool('isDebuggerMode', isOn);
  }

  Future<bool> getDebuggerMode() async {
    return await _sharedPreferences.getBool('isDebuggerMode') == true;
  }

  Future<void> setWarningCapacity(SetGeneralConfigParams params) async {
    await _sharedPreferences.setBool(
      'isWarningCapacity',
      params.isWarningCapacity,
    );
    await _sharedPreferences.setInt(
      'warningCapacityThreshold',
      params.warningCapacityThreshold,
    );
  }

  Future<GeneralConfigEntity> getWarningCapacity() async {
    final isWarningCapacity =
        await _sharedPreferences.getBool('isWarningCapacity') ?? false;
    final warningCapacityThreshold =
        await _sharedPreferences.getInt('warningCapacityThreshold') ?? 0;
    return GeneralConfigEntity(
      isWarning: isWarningCapacity,
      warningThreshold: warningCapacityThreshold,
    );
  }

  Future<void> setAnimation(bool isOn) async {
    await _sharedPreferences.setBool('isAnimation', isOn);
  }

  Future<bool> getAnimation() async {
    return await _sharedPreferences.getBool('isAnimation') ?? true;
  }

  Future<void> setUISettings(SetUISettingsParams params) async {
    await _sharedPreferences.setBool(
      'isFloatingNavbar',
      params.isFloatingNavbar,
    );
    await _sharedPreferences.setBool(
      'isShowNavbarLabel',
      params.isShowNavbarLabel,
    );
    await _sharedPreferences.setBool('isGlassmorphism', params.isGlassmorphism);
  }

  Future<UISettingsEntity> getUISettings() async {
    return UISettingsEntity(
      isFloatingNavbar:
          await _sharedPreferences.getBool('isFloatingNavbar') ?? false,
      isShowNavbarLabel:
          await _sharedPreferences.getBool('isShowNavbarLabel') ?? false,
      isGlassmorphism:
          await _sharedPreferences.getBool('isGlassmorphism') ?? false,
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
