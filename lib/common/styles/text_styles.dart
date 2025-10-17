import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Private constructor to prevent instantiation, making this a pure utility class.
  AppTextStyles._();

  // Define the base style once to reduce repetitive calls to GoogleFonts.inter()
  // and improve readability when defining derived styles.
  static final TextStyle _baseTextStyle = GoogleFonts.inter();

  // Headings (W700)
  static final TextStyle heading1 = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 48,
  );

  static final TextStyle heading2 = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 40,
  );

  static final TextStyle heading3 = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 28,
  );

  static final TextStyle heading4 = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 24,
  );

  static final TextStyle heading5 = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 20,
  );

  static final TextStyle heading6 = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );

  // Body X-Large (18)
  static final TextStyle bodyXLargeBold = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 18,
  );

  static final TextStyle bodyXLargeSemibold = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  static final TextStyle bodyXLargeMedium = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );

  static final TextStyle bodyXLargeRegular = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 18,
  );

  // Body Large (16)
  static final TextStyle bodyLargeBold = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );

  static final TextStyle bodyLargeSemibold = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static final TextStyle bodyLargeMedium = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static final TextStyle bodyLargeRegular = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  // Body Medium (14)
  static final TextStyle bodyMediumBold = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );

  static final TextStyle bodyMediumSemibold = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );

  static final TextStyle bodyMediumMedium = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static final TextStyle bodyMediumRegular = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  // Body Small (12)
  static final TextStyle bodySmallBold = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 12,
  );

  static final TextStyle bodySmallSemibold = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w600,
    fontSize: 12,
  );

  static final TextStyle bodySmallMedium = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );

  static final TextStyle bodySmallRegular = _baseTextStyle.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );
}
