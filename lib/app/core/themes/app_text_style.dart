import 'package:flutter/material.dart';

/// Font family & weights.
/// Add the font in pubspec.yaml (see README note), or change [family].
class AppFont {
  AppFont._();

  static const String family = 'Poppins';

  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

/// Color-less text styles. Color comes from the theme automatically,
/// so the same style works in both light and dark mode.
class AppTextStyle {
  AppTextStyle._();

  static const TextStyle h1 =
  TextStyle(fontSize: 32, fontWeight: AppFont.bold, height: 1.25);
  static const TextStyle h2 =
  TextStyle(fontSize: 28, fontWeight: AppFont.bold, height: 1.28);
  static const TextStyle h3 =
  TextStyle(fontSize: 24, fontWeight: AppFont.semiBold, height: 1.33);
  static const TextStyle h4 =
  TextStyle(fontSize: 20, fontWeight: AppFont.semiBold, height: 1.4);
  static const TextStyle h5 =
  TextStyle(fontSize: 18, fontWeight: AppFont.semiBold, height: 1.4);
  static const TextStyle h6 =
  TextStyle(fontSize: 16, fontWeight: AppFont.semiBold, height: 1.5);

  static const TextStyle bodyLarge =
  TextStyle(fontSize: 16, fontWeight: AppFont.regular, height: 1.5);
  static const TextStyle bodyMedium =
  TextStyle(fontSize: 14, fontWeight: AppFont.regular, height: 1.5);
  static const TextStyle bodySmall =
  TextStyle(fontSize: 12, fontWeight: AppFont.regular, height: 1.5);

  static const TextStyle button = TextStyle(
      fontSize: 16, fontWeight: AppFont.semiBold, letterSpacing: 0.3);
  static const TextStyle caption =
  TextStyle(fontSize: 12, fontWeight: AppFont.medium, height: 1.4);
  static const TextStyle overline = TextStyle(
      fontSize: 10, fontWeight: AppFont.medium, letterSpacing: 0.8);

  /// Builds a full Material [TextTheme] with correct colors.
  static TextTheme textTheme({
    required Color primary,
    required Color secondary,
  }) {
    return TextTheme(
      displayLarge: h1.copyWith(color: primary),
      displayMedium: h2.copyWith(color: primary),
      displaySmall: h3.copyWith(color: primary),
      headlineLarge: h3.copyWith(color: primary),
      headlineMedium: h4.copyWith(color: primary),
      headlineSmall: h5.copyWith(color: primary),
      titleLarge: h5.copyWith(color: primary),
      titleMedium: h6.copyWith(color: primary),
      titleSmall: bodyMedium.copyWith(
          color: primary, fontWeight: AppFont.semiBold),
      bodyLarge: bodyLarge.copyWith(color: primary),
      bodyMedium: bodyMedium.copyWith(color: primary),
      bodySmall: bodySmall.copyWith(color: secondary),
      labelLarge: button.copyWith(color: primary),
      labelMedium: caption.copyWith(color: secondary),
      labelSmall: overline.copyWith(color: secondary),
    );
  }
}