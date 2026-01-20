import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/services/storage_service.dart';

import 'package:zupa/core/styles/theme.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
    : super(
        .initial(
          PlatformDispatcher.instance.platformBrightness == .light
              ? appTheme
              : appDarkTheme,
        ),
      );

  final _storageService = getIt<StorageService>();

  Future<void> loadTheme() async {
    emit(.initial(await getIt<StorageService>().getTheme() ? appDarkTheme : appTheme));
  }

  void changeTheme(ThemeData theme) {
    _storageService.setTheme(theme.brightness == .dark);
    emit(.initial(theme));
  }

  void changeBrightness(Brightness? brightness) {
    _storageService.setTheme(
      (brightness ?? PlatformDispatcher.instance.platformBrightness) == .dark,
    );
    emit(
      .initial(
        (brightness ?? PlatformDispatcher.instance.platformBrightness) == .dark
            ? appDarkTheme
            : appTheme,
      ),
    );
  }
}
