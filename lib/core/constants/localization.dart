import 'dart:ui';

import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/services/storage_service.dart';

enum AppLocalization { vi, en, ja, followSystem }

extension AppLocalizationExtension on AppLocalization {
  static final _storageService = getIt<StorageService>();
  String? getLocaleString() {
    return this == .followSystem ? null : name;
  }

  Locale getLocale() {
    return this == .followSystem ? PlatformDispatcher.instance.locale : .new(name);
  }

  static Future<AppLocalization> getSelectedLocale() async {
    return _storageService.getLocalization();
  }

  static void changeLocale(AppLocalization mode) {
    _storageService.setLocalization(mode);
  }

  static AppLocalization fromLocale(String code) {
    return AppLocalization.values.firstWhere(
      (element) => element.name == code,
      orElse: () => .followSystem,
    );
  }
}
