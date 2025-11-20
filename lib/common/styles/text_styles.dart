import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Private constructor to prevent instantiation, making this a pure utility class.
  AppTextStyles._();

  // Define the base style once to reduce repetitive calls to GoogleFonts.inter()
  // and improve readability when defining derived styles.
  static final _baseTextStyle = GoogleFonts.inter();

  // Headings (W700)
  static final heading1 = _baseTextStyle.copyWith(
    fontWeight: .w700,
    fontSize: 48,
  );

  static final heading2 = _baseTextStyle.copyWith(
    fontWeight: .w700,
    fontSize: 40,
  );

  static final heading3 = _baseTextStyle.copyWith(
    fontWeight: .w700,
    fontSize: 28,
  );

  static final heading4 = _baseTextStyle.copyWith(
    fontWeight: .w700,
    fontSize: 24,
  );

  static final heading5 = _baseTextStyle.copyWith(
    fontWeight: .w700,
    fontSize: 20,
  );

  static final heading6 = _baseTextStyle.copyWith(
    fontWeight: .w700,
    fontSize: 16,
  );

  // Body X-Large (18)
  static final bodyXLargeBold = _baseTextStyle.copyWith(
    fontWeight: .w700,
    fontSize: 18,
  );

  static final bodyXLargeSemibold = _baseTextStyle.copyWith(
    fontWeight: .w600,
    fontSize: 18,
  );

  static final bodyXLargeMedium = _baseTextStyle.copyWith(
    fontWeight: .w500,
    fontSize: 18,
  );

  static final bodyXLargeRegular = _baseTextStyle.copyWith(
    fontWeight: .w400,
    fontSize: 18,
  );

  // Body Large (16)
  static final bodyLargeBold = _baseTextStyle.copyWith(
    fontWeight: .w700,
    fontSize: 16,
  );

  static final bodyLargeSemibold = _baseTextStyle.copyWith(
    fontWeight: .w600,
    fontSize: 16,
  );

  static final bodyLargeMedium = _baseTextStyle.copyWith(
    fontWeight: .w500,
    fontSize: 16,
  );

  static final bodyLargeRegular = _baseTextStyle.copyWith(
    fontWeight: .w400,
    fontSize: 16,
  );

  // Body Medium (14)
  static final bodyMediumBold = _baseTextStyle.copyWith(
    fontWeight: .w700,
    fontSize: 14,
  );

  static final bodyMediumSemibold = _baseTextStyle.copyWith(
    fontWeight: .w600,
    fontSize: 14,
  );

  static final bodyMediumMedium = _baseTextStyle.copyWith(
    fontWeight: .w500,
    fontSize: 14,
  );

  static final bodyMediumRegular = _baseTextStyle.copyWith(
    fontWeight: .w400,
    fontSize: 14,
  );

  // Body Small (12)
  static final bodySmallBold = _baseTextStyle.copyWith(
    fontWeight: .w700,
    fontSize: 12,
  );

  static final bodySmallSemibold = _baseTextStyle.copyWith(
    fontWeight: .w600,
    fontSize: 12,
  );

  static final bodySmallMedium = _baseTextStyle.copyWith(
    fontWeight: .w500,
    fontSize: 12,
  );

  static final bodySmallRegular = _baseTextStyle.copyWith(
    fontWeight: .w400,
    fontSize: 12,
  );
}
