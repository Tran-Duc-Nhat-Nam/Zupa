import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:zupa/common/styles/theme.dart';
import 'package:zupa/helper/theme/theme_helper.dart';

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

  Future<void> loadTheme(BuildContext context) async {
    emit(.initial(await ThemeHelper.getTheme() ? appDarkTheme : appTheme));
  }

  void changeTheme(ThemeData theme) {
    ThemeHelper.setTheme(theme.brightness == .dark);
    emit(.initial(theme));
  }

  void changeBrightness(Brightness? brightness) {
    ThemeHelper.setTheme(
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
