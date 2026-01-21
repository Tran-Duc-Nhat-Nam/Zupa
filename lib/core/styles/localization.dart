import 'dart:ui';

enum AppLocalization { vi, en, ja, followSystem }

extension AppLocalizationExtension on AppLocalization {

  String? getLocaleString() {
    return this == .followSystem ? null : name;
  }

  Locale? getLocale() {
    return this == .followSystem ? null : .new(name);
  }
}
