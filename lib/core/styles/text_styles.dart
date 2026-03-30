import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Private constructor to prevent instantiation, making this a pure utility class.
  AppTextStyles._();

  // Define the base styles for the two primary fonts used in the design system.
  // Outfit is used for prominent display and headline roles.
  // Inter is used for content-heavy roles like titles, body, and labels.
  static final _displayFont = GoogleFonts.outfit();
  static final _bodyFont = GoogleFonts.robotoFlex();

  // --- Display (Outfit) ---
  // Large, short-form text with a high emphasis.
  static final displayLarge = _displayFont.copyWith(
    fontSize: 57,
    fontWeight: .w400,
    letterSpacing: -0.25,
  );

  static final displayMedium = _displayFont.copyWith(
    fontSize: 45,
    fontWeight: .w400,
    letterSpacing: 0,
  );

  static final displaySmall = _displayFont.copyWith(
    fontSize: 36,
    fontWeight: .w400,
    letterSpacing: 0,
  );

  // --- Headline (Outfit) ---
  // High-emphasis text that guides the user.
  static final headlineLarge = _displayFont.copyWith(
    fontSize: 32,
    fontWeight: .w400,
    letterSpacing: 0,
  );

  static final headlineMedium = _displayFont.copyWith(
    fontSize: 28,
    fontWeight: .w400,
    letterSpacing: 0,
  );

  static final headlineSmall = _displayFont.copyWith(
    fontSize: 24,
    fontWeight: .w400,
    letterSpacing: 0,
  );

  // --- Title (Inter) ---
  // Medium-emphasis text used for specific sections and UI elements.
  static final titleLarge = _bodyFont.copyWith(
    fontSize: 22,
    fontWeight: .w400,
    letterSpacing: 0,
  );

  static final titleMedium = _bodyFont.copyWith(
    fontSize: 16,
    fontWeight: .w500,
    letterSpacing: 0.15,
  );

  static final titleSmall = _bodyFont.copyWith(
    fontSize: 14,
    fontWeight: .w500,
    letterSpacing: 0.1,
  );

  // --- Body (Inter) ---
  // Default text for content and long-form reading.
  static final bodyLarge = _bodyFont.copyWith(
    fontSize: 16,
    fontWeight: .w400,
    letterSpacing: 0.5,
  );

  static final bodyMedium = _bodyFont.copyWith(
    fontSize: 14,
    fontWeight: .w400,
    letterSpacing: 0.25,
  );

  static final bodySmall = _bodyFont.copyWith(
    fontSize: 12,
    fontWeight: .w400,
    letterSpacing: 0.4,
  );

  // --- Label (Inter) ---
  // Small, high-emphasis text for UI components (buttons, badges).
  static final labelLarge = _bodyFont.copyWith(
    fontSize: 14,
    fontWeight: .w500,
    letterSpacing: 0.1,
  );

  static final labelMedium = _bodyFont.copyWith(
    fontSize: 12,
    fontWeight: .w500,
    letterSpacing: 0.5,
  );

  static final labelSmall = _bodyFont.copyWith(
    fontSize: 11,
    fontWeight: .w500,
    letterSpacing: 0.5,
  );

  // --- Weight Variations and Legacy Mapping Helpers ---
  // These provide quick access to common weight variants for body and title text.

  // Body Large Variations
  static final bodyLargeBold = bodyLarge.copyWith(fontWeight: .w700);
  static final bodyLargeSemibold = bodyLarge.copyWith(fontWeight: .w600);
  static final bodyLargeMedium = bodyLarge.copyWith(fontWeight: .w500);
  static final bodyLargeRegular = bodyLarge;

  // Body Medium Variations
  static final bodyMediumBold = bodyMedium.copyWith(fontWeight: .w700);
  static final bodyMediumSemibold = bodyMedium.copyWith(fontWeight: .w600);
  static final bodyMediumMedium = bodyMedium.copyWith(fontWeight: .w500);
  static final bodyMediumRegular = bodyMedium;

  // Body Small Variations
  static final bodySmallBold = bodySmall.copyWith(fontWeight: .w700);
  static final bodySmallSemibold = bodySmall.copyWith(fontWeight: .w600);
  static final bodySmallMedium = bodySmall.copyWith(fontWeight: .w500);
  static final bodySmallRegular = bodySmall;

  // Title Variations (useful for headers that were previously bodyXLarge)
  static final titleLargeBold = titleLarge.copyWith(fontWeight: .w700);
  static final titleLargeSemibold = titleLarge.copyWith(fontWeight: .w600);
  static final titleLargeMedium = titleLarge.copyWith(fontWeight: .w500);

  // Headline variations (bold is often used for top-level headers)
  static final displayMediumBold = displayMedium.copyWith(fontWeight: .w700);
  static final displayLargeBold = displayLarge.copyWith(fontWeight: .w700);
  static final headlineLargeBold = headlineLarge.copyWith(fontWeight: .w700);
  static final headlineMediumBold = headlineMedium.copyWith(fontWeight: .w700);
  static final headlineSmallBold = headlineSmall.copyWith(fontWeight: .w700);
  static final titleMediumBold = titleMedium.copyWith(fontWeight: .w700);
  static final titleSmallBold = titleSmall.copyWith(fontWeight: .w700);
}
