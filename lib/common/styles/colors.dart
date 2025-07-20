import 'package:flutter/material.dart';

abstract class BaseColors {
  late final Color primary500;
  late final Color primary400;
  late final Color primary300;
  late final Color primary200;
  late final Color primary100;
  late final Color primary50;

  late final Color warning600;
  late final Color warning500;
  late final Color warning400;
  late final Color warning300;
  late final Color warning200;
  late final Color warning100;
  late final Color warning50;

  late final Color error600;
  late final Color error500;
  late final Color error400;
  late final Color error300;
  late final Color error200;
  late final Color error100;
  late final Color error50;

  late final Color success600;
  late final Color success500;
  late final Color success400;
  late final Color success300;
  late final Color success200;
  late final Color success100;
  late final Color success50;

  late final Color grey1000;
  late final Color grey900;
  late final Color grey800;
  late final Color grey700;
  late final Color grey650;
  late final Color grey600;
  late final Color grey500;
  late final Color grey400;
  late final Color grey300;
  late final Color grey200;
  late final Color grey100;
  late final Color grey50;

  late final Color blueDark;
  late final Color blueLight;
  late final Color grape;
  late final Color white;
}

class AppColors extends BaseColors {
  @override
  final Color primary500 = const Color(0xff4277FF);
  @override
  final Color primary400 = const Color(0xff7199FF);
  @override
  final Color primary300 = const Color(0xffA1BBFF);
  @override
  final Color primary200 = const Color(0xffD0DDFF);
  @override
  final Color primary100 = const Color(0xffE7EEFF);
  @override
  final Color primary50 = const Color(0xffF5F8FF);

  @override
  final Color warning600 = const Color(0xffFFDF6E);
  @override
  final Color warning500 = const Color(0xffFFE58B);
  @override
  final Color warning400 = const Color(0xffFFECA8);
  @override
  final Color warning300 = const Color(0xffFFF2C5);
  @override
  final Color warning200 = const Color(0xffFFF9E2);
  @override
  final Color warning100 = const Color(0xffFFFCF1);
  @override
  final Color warning50 = const Color(0xffFFFCF1);

  @override
  final Color error600 = const Color(0xffF6285F);
  @override
  final Color error500 = const Color(0xffF8537F);
  @override
  final Color error400 = const Color(0xffFA7E9F);
  @override
  final Color error300 = const Color(0xffFBA9BF);
  @override
  final Color error200 = const Color(0xffFDD4DF);
  @override
  final Color error100 = const Color(0xffFEEAEF);
  @override
  final Color error50 = const Color(0xffFEEAEF);

  @override
  final Color success600 = const Color(0xff12A58C);
  @override
  final Color success500 = const Color(0xff41B7A3);
  @override
  final Color success400 = const Color(0xff71C9BA);
  @override
  final Color success300 = const Color(0xffA0DBD1);
  @override
  final Color success200 = const Color(0xffD0EDE8);
  @override
  final Color success100 = const Color(0xffF0F9F8);
  @override
  final Color success50 = const Color(0xffF0F9F8);

  @override
  final Color grey1000 = const Color(0xff111827);
  @override
  final Color grey900 = const Color(0xff061237);
  @override
  final Color grey800 = const Color(0xff1E2848);
  @override
  final Color grey700 = const Color(0xff38415F);
  @override
  final Color grey650 = const Color(0xff4B5563);
  @override
  final Color grey600 = const Color(0xff515973);
  @override
  final Color grey500 = const Color(0xff6A7187);
  @override
  final Color grey400 = const Color(0xff83899B);
  @override
  final Color grey300 = const Color(0xff9BA0AF);
  @override
  final Color grey200 = const Color(0xffC1C4CD);
  @override
  final Color grey100 = const Color(0xffE3E4E8);
  @override
  final Color grey50 = const Color(0xffF7F9FC);

  @override
  final Color blueDark = const Color(0xff1355FF);
  @override
  final Color blueLight = const Color(0xff00B3FF);
  @override
  final Color grape = const Color(0xff7214FF);
  @override
  final Color white = const Color(0xffFFFFFF);
}

class DarkAppColors extends BaseColors {
  @override
  final Color primary500 = const Color(0xffCBA6F7);
  @override
  final Color primary400 = const Color(0xffB490E0);
  @override
  final Color primary300 = const Color(0xff9E7ACA);
  @override
  final Color primary200 = const Color(0xff8865B3);
  @override
  final Color primary100 = const Color(0xff724F9D);
  @override
  final Color primary50 = const Color(0xff5C3A86);

  @override
  final Color warning600 = const Color(0xffFAB387);
  @override
  final Color warning500 = const Color(0xffE09F77);
  @override
  final Color warning400 = const Color(0xffC68B67);
  @override
  final Color warning300 = const Color(0xffAC7757);
  @override
  final Color warning200 = const Color(0xff926347);
  @override
  final Color warning100 = const Color(0xff784F37);
  @override
  final Color warning50 = const Color(0xff5E3B27);

  @override
  final Color error600 = const Color(0xffF38BA8);
  @override
  final Color error500 = const Color(0xffD87C97);
  @override
  final Color error400 = const Color(0xffBD6D86);
  @override
  final Color error300 = const Color(0xffA25E75);
  @override
  final Color error200 = const Color(0xff874F64);
  @override
  final Color error100 = const Color(0xff6C4053);
  @override
  final Color error50 = const Color(0xff513142);

  @override
  final Color success600 = const Color(0xffA6E3A1);
  @override
  final Color success500 = const Color(0xff92CA8D);
  @override
  final Color success400 = const Color(0xff7EB179);
  @override
  final Color success300 = const Color(0xff6A9865);
  @override
  final Color success200 = const Color(0xff567051);
  @override
  final Color success100 = const Color(0xff42573D);
  @override
  final Color success50 = const Color(0xff2E3E29);

  @override
  final Color grey1000 = const Color(0xffFFFFFF);
  @override
  final Color grey900 = const Color(0xffF4F6F8);
  @override
  final Color grey800 = const Color(0xffE6EAF0);
  @override
  final Color grey700 = const Color(0xffCDD6F4);
  @override
  final Color grey650 = const Color(0xffB8C2E0);
  @override
  final Color grey600 = const Color(0xffA2ACC8);
  @override
  final Color grey500 = const Color(0xff8E98B4);
  @override
  final Color grey400 = const Color(0xff7A849E);
  @override
  final Color grey300 = const Color(0xff656E85);
  @override
  final Color grey200 = const Color(0xff50586C);
  @override
  final Color grey100 = const Color(0xff3A4254);
  @override
  final Color grey50 = const Color(0xff313244);

  @override
  final Color blueDark = const Color(0xff8839EF); // Sapphire from Catppuccin Mocha
  @override
  final Color blueLight = const Color(0xffB4BEFE); // Sky from Catppuccin Mocha
  @override
  final Color grape = const Color(0xff74c7ec); // Lavender from Catppuccin Mocha

  @override
  final Color white = const Color(0xff181825);
}
