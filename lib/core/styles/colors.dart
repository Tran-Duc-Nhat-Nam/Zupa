import 'package:flutter/material.dart';

abstract class BaseColors {
  final Color primary500;
  final Color primary400;
  final Color primary300;
  final Color primary200;
  final Color primary100;
  final Color primary50;

  final Color warning600;
  final Color warning500;
  final Color warning400;
  final Color warning300;
  final Color warning200;
  final Color warning100;
  final Color warning50;

  final Color error600;
  final Color error500;
  final Color error400;
  final Color error300;
  final Color error200;
  final Color error100;
  final Color error50;

  final Color success600;
  final Color success500;
  final Color success400;
  final Color success300;
  final Color success200;
  final Color success100;
  final Color success50;

  final Color grey1000;
  final Color grey900;
  final Color grey800;
  final Color grey700;
  final Color grey650;
  final Color grey600;
  final Color grey500;
  final Color grey400;
  final Color grey300;
  final Color grey200;
  final Color grey100;
  final Color grey50;

  final Color blueDark;
  final Color blueLight;
  final Color grape;
  final Color white;

  const BaseColors({
    required this.primary500,
    required this.primary400,
    required this.primary300,
    required this.primary200,
    required this.primary100,
    required this.primary50,
    required this.warning600,
    required this.warning500,
    required this.warning400,
    required this.warning300,
    required this.warning200,
    required this.warning100,
    required this.warning50,
    required this.error600,
    required this.error500,
    required this.error400,
    required this.error300,
    required this.error200,
    required this.error100,
    required this.error50,
    required this.success600,
    required this.success500,
    required this.success400,
    required this.success300,
    required this.success200,
    required this.success100,
    required this.success50,
    required this.grey1000,
    required this.grey900,
    required this.grey800,
    required this.grey700,
    required this.grey650,
    required this.grey600,
    required this.grey500,
    required this.grey400,
    required this.grey300,
    required this.grey200,
    required this.grey100,
    required this.grey50,
    required this.blueDark,
    required this.blueLight,
    required this.grape,
    required this.white,
  });
}

class AppColors extends BaseColors {
  const AppColors()
    : super(
        primary500: const .new(0xff4277FF),
        primary400: const .new(0xff7199FF),
        primary300: const .new(0xffA1BBFF),
        primary200: const .new(0xffD0DDFF),
        primary100: const .new(0xffE7EEFF),
        primary50: const .new(0xffF5F8FF),
        warning600: const .new(0xffFFDF6E),
        warning500: const .new(0xffFFE58B),
        warning400: const .new(0xffFFECA8),
        warning300: const .new(0xffFFF2C5),
        warning200: const .new(0xffFFF9E2),
        warning100: const .new(0xffFFFCF1),
        warning50: const .new(0xffFFFCF1),
        error600: const .new(0xffF6285F),
        error500: const .new(0xffF8537F),
        error400: const .new(0xffFA7E9F),
        error300: const .new(0xffFBA9BF),
        error200: const .new(0xffFDD4DF),
        error100: const .new(0xffFEEAEF),
        error50: const .new(0xffFEEAEF),
        success600: const .new(0xff12A58C),
        success500: const .new(0xff41B7A3),
        success400: const .new(0xff71C9BA),
        success300: const .new(0xffA0DBD1),
        success200: const .new(0xffD0EDE8),
        success100: const .new(0xffF0F9F8),
        success50: const .new(0xffF0F9F8),
        grey1000: const .new(0xff111827),
        grey900: const .new(0xff061237),
        grey800: const .new(0xff1E2848),
        grey700: const .new(0xff38415F),
        grey650: const .new(0xff4B5563),
        grey600: const .new(0xff515973),
        grey500: const .new(0xff6A7187),
        grey400: const .new(0xff83899B),
        grey300: const .new(0xff9BA0AF),
        grey200: const .new(0xffC1C4CD),
        grey100: const .new(0xffE3E4E8),
        grey50: const .new(0xffF7F9FC),
        blueDark: const .new(0xff1355FF),
        blueLight: const .new(0xff00B3FF),
        grape: const .new(0xff7214FF),
        white: const .new(0xffFFFFFF),
      );
}

class DarkAppColors extends BaseColors {
  const DarkAppColors()
    : super(
        primary500: const .new(0xffCBA6F7),
        primary400: const .new(0xffB490E0),
        primary300: const .new(0xff9E7ACA),
        primary200: const .new(0xff8865B3),
        primary100: const .new(0xff724F9D),
        primary50: const .new(0xff5C3A86),
        warning600: const .new(0xffFAB387),
        warning500: const .new(0xffE09F77),
        warning400: const .new(0xffC68B67),
        warning300: const .new(0xffAC7757),
        warning200: const .new(0xff926347),
        warning100: const .new(0xff784F37),
        warning50: const .new(0xff5E3B27),
        error600: const .new(0xffF38BA8),
        error500: const .new(0xffD87C97),
        error400: const .new(0xffBD6D86),
        error300: const .new(0xffA25E75),
        error200: const .new(0xff874F64),
        error100: const .new(0xff6C4053),
        error50: const .new(0xff513142),
        success600: const .new(0xffA6E3A1),
        success500: const .new(0xff92CA8D),
        success400: const .new(0xff7EB179),
        success300: const .new(0xff6A9865),
        success200: const .new(0xff567051),
        success100: const .new(0xff42573D),
        success50: const .new(0xff2E3E29),
        grey1000: const .new(0xffFFFFFF),
        grey900: const .new(0xffF4F6F8),
        grey800: const .new(0xffE6EAF0),
        grey700: const .new(0xffCDD6F4),
        grey650: const .new(0xffB8C2E0),
        grey600: const .new(0xffA2ACC8),
        grey500: const .new(0xff8E98B4),
        grey400: const .new(0xff7A849E),
        grey300: const .new(0xff656E85),
        grey200: const .new(0xff50586C),
        grey100: const .new(0xff3A4254),
        grey50: const .new(0xff313244),
        blueDark: const .new(0xff8839EF),
        blueLight: const .new(0xffB4BEFE),
        grape: const .new(0xff74c7ec),
        white: const .new(0xff181825),
      );
}
