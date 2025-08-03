import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jiffy/jiffy.dart';

import '../../common/styles/theme.dart';
import '../../helper/theme/theme_helper.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(ThemeState.initial(
            PlatformDispatcher.instance.platformBrightness == Brightness.light
                ? appTheme
                : appDarkTheme));

  Future<void> loadTheme(BuildContext context) async {
    emit(ThemeState.initial(
        await ThemeHelper.getTheme() ? appDarkTheme : appTheme));
  }

  void changeTheme(ThemeData theme) {
    ThemeHelper.setTheme(theme.brightness == Brightness.dark);
    emit(ThemeState.initial(theme));
  }

  void changeBrightness(Brightness? brightness) {
    ThemeHelper.setTheme(
      (brightness ?? PlatformDispatcher.instance.platformBrightness) ==
          Brightness.dark,
    );
    emit(
      ThemeState.initial(
        (brightness ?? PlatformDispatcher.instance.platformBrightness) ==
                Brightness.dark
            ? appDarkTheme
            : appTheme,
      ),
    );
  }
}
