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
        primary500: const Color(0xff8839EF),
        primary400: const Color(0xff9F60F2),
        primary300: const Color(0xffB788F5),
        primary200: const Color(0xffCEAFF9),
        primary100: const Color(0xffE6D7FC),
        primary50: const Color(0xffF3EBFE),
        warning600: const Color(0xffC87D15),
        warning500: const Color(0xffDF8E1D),
        warning400: const Color(0xffE5A54A),
        warning300: const Color(0xffEBBb77),
        warning200: const Color(0xffF1D2A4),
        warning100: const Color(0xffF7E8D1),
        warning50: const Color(0xffFBF4E8),
        error600: const Color(0xffBD0D33),
        error500: const Color(0xffD20F39),
        error400: const Color(0xffDB3F61),
        error300: const Color(0xffE46F88),
        error200: const Color(0xffED9FB0),
        error100: const Color(0xffF6CFD7),
        error50: const Color(0xffFBE7EB),
        success600: const Color(0xff399026),
        success500: const Color(0xff40A02B),
        success400: const Color(0xff66B355),
        success300: const Color(0xff8CC680),
        success200: const Color(0xffB3D9AA),
        success100: const Color(0xffD9ECD5),
        success50: const Color(0xffECF6EA),
        grey1000: const Color(0xff4C4F69), // Text
        grey900: const Color(0xff5C5F77), // Subtext 1
        grey800: const Color(0xff6C6F85), // Subtext 0
        grey700: const Color(0xff7C7F93), // Overlay 2
        grey650: const Color(0xff85889A), // Mid-tone
        grey600: const Color(0xff8C8FA1), // Overlay 1
        grey500: const Color(0xff9CA0B0), // Overlay 0
        grey400: const Color(0xffACB0BE), // Surface 2
        grey300: const Color(0xffBCC0CC), // Surface 1
        grey200: const Color(0xffCCD0DA), // Surface 0
        grey100: const Color(0xffDCE0E8), // Crust
        grey50: const Color(0xffEFF1F5), // Base
        blueDark: const Color(0xff1E66F5), // Latte Blue
        blueLight: const Color(0xff04A5E5), // Latte Sky
        grape: const Color(0xff7287FD), // Latte Lavender
        white: const Color(0xffFFFFFF), // Pure White (or use Base #EFF1F5)
      );
}

class DarkAppColors extends BaseColors {
  const DarkAppColors()
    : super(
        primary500: const Color(0xffCBA6F7),
        primary400: const Color(0xffB490E0),
        primary300: const Color(0xff9E7ACA),
        primary200: const Color(0xff8865B3),
        primary100: const Color(0xff724F9D),
        primary50: const Color(0xff5C3A86),
        warning600: const Color(0xffFAB387),
        warning500: const Color(0xffE09F77),
        warning400: const Color(0xffC68B67),
        warning300: const Color(0xffAC7757),
        warning200: const Color(0xff926347),
        warning100: const Color(0xff784F37),
        warning50: const Color(0xff5E3B27),
        error600: const Color(0xffF38BA8),
        error500: const Color(0xffD87C97),
        error400: const Color(0xffBD6D86),
        error300: const Color(0xffA25E75),
        error200: const Color(0xff874F64),
        error100: const Color(0xff6C4053),
        error50: const Color(0xff513142),
        success600: const Color(0xffA6E3A1),
        success500: const Color(0xff92CA8D),
        success400: const Color(0xff7EB179),
        success300: const Color(0xff6A9865),
        success200: const Color(0xff567051),
        success100: const Color(0xff42573D),
        success50: const Color(0xff2E3E29),
        grey1000: const Color(0xffFFFFFF),
        grey900: const Color(0xffF4F6F8),
        grey800: const Color(0xffE6EAF0),
        grey700: const Color(0xffCDD6F4),
        grey650: const Color(0xffB8C2E0),
        grey600: const Color(0xffA2ACC8),
        grey500: const Color(0xff8E98B4),
        grey400: const Color(0xff7A849E),
        grey300: const Color(0xff656E85),
        grey200: const Color(0xff50586C),
        grey100: const Color(0xff3A4254),
        grey50: const Color(0xff313244),
        blueDark: const Color(0xff8839EF),
        blueLight: const Color(0xffB4BEFE),
        grape: const Color(0xff74c7ec),
        white: const Color(0xff181825),
      );
}
