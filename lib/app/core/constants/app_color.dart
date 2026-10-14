import 'package:flutter/material.dart';

class AppColor {
  AppColor._(); // Prevent instantiation

  // ───────────────────────── Brand ─────────────────────────
  static const Color primary = Color(0xFF2563EB);
  static const Color primaryLight = Color(0xFF60A5FA);
  static const Color primaryDark = Color(0xFF1E40AF);
  static const Color primarySurface = Color(0xFFEFF6FF); // light tint bg

  static const Color secondary = Color(0xFF7C3AED);
  static const Color secondaryLight = Color(0xFFA78BFA);
  static const Color secondaryDark = Color(0xFF5B21B6);

  static const Color accent = Color(0xFFF59E0B);
  static const Color accentLight = Color(0xFFFCD34D);
  static const Color accentDark = Color(0xFFB45309);

  // ───────────────────────── Light Theme ─────────────────────────
  static const Color background = Color(0xFFF9FAFB);
  static const Color scaffold = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF3F4F6);
  static const Color card = Color(0xFFFFFFFF);
  static const Color appBar = Color(0xFFFFFFFF);
  static const Color bottomNav = Color(0xFFFFFFFF);
  static const Color inputFill = Color(0xFFF3F4F6);

  // ───────────────────────── Dark Theme ─────────────────────────
  static const Color darkBackground = Color(0xFF0F172A);
  static const Color darkScaffold = Color(0xFF020617);
  static const Color darkSurface = Color(0xFF1E293B);
  static const Color darkSurfaceVariant = Color(0xFF334155);
  static const Color darkCard = Color(0xFF1E293B);
  static const Color darkAppBar = Color(0xFF0F172A);
  static const Color darkBottomNav = Color(0xFF0F172A);
  static const Color darkInputFill = Color(0xFF1E293B);

  // ───────────────────────── Text (Light) ─────────────────────────
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF4B5563);
  static const Color textTertiary = Color(0xFF6B7280);
  static const Color textHint = Color(0xFF9CA3AF);
  static const Color textDisabled = Color(0xFFD1D5DB);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textOnSecondary = Color(0xFFFFFFFF);
  static const Color textOnDark = Color(0xFFFFFFFF);
  static const Color textLink = Color(0xFF2563EB);

  // ───────────────────────── Text (Dark) ─────────────────────────
  static const Color darkTextPrimary = Color(0xFFF8FAFC);
  static const Color darkTextSecondary = Color(0xFFCBD5E1);
  static const Color darkTextTertiary = Color(0xFF94A3B8);
  static const Color darkTextHint = Color(0xFF64748B);
  static const Color darkTextDisabled = Color(0xFF475569);

  // ───────────────────────── Status ─────────────────────────
  static const Color success = Color(0xFF16A34A);
  static const Color successLight = Color(0xFFDCFCE7);
  static const Color successDark = Color(0xFF166534);

  static const Color warning = Color(0xFFF59E0B);
  static const Color warningLight = Color(0xFFFEF3C7);
  static const Color warningDark = Color(0xFF92400E);

  static const Color error = Color(0xFFDC2626);
  static const Color errorLight = Color(0xFFFEE2E2);
  static const Color errorDark = Color(0xFF991B1B);

  static const Color info = Color(0xFF0EA5E9);
  static const Color infoLight = Color(0xFFE0F2FE);
  static const Color infoDark = Color(0xFF075985);

  // ───────────────────────── Neutral / Grey Scale ─────────────────────────
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey50 = Color(0xFFF9FAFB);
  static const Color grey100 = Color(0xFFF3F4F6);
  static const Color grey200 = Color(0xFFE5E7EB);
  static const Color grey300 = Color(0xFFD1D5DB);
  static const Color grey400 = Color(0xFF9CA3AF);
  static const Color grey500 = Color(0xFF6B7280);
  static const Color grey600 = Color(0xFF4B5563);
  static const Color grey700 = Color(0xFF374151);
  static const Color grey800 = Color(0xFF1F2937);
  static const Color grey900 = Color(0xFF111827);

  // ───────────────────────── Border / Divider ─────────────────────────
  static const Color border = Color(0xFFE5E7EB);
  static const Color borderFocused = primary;
  static const Color borderError = error;
  static const Color divider = Color(0xFFE5E7EB);
  static const Color darkBorder = Color(0xFF334155);
  static const Color darkDivider = Color(0xFF334155);

  // ───────────────────────── Buttons ─────────────────────────
  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = secondary;
  static const Color buttonDisabled = Color(0xFFE5E7EB);
  static const Color buttonDisabledText = Color(0xFF9CA3AF);
  static const Color buttonOutline = primary;

  // ───────────────────────── Icons ─────────────────────────
  static const Color icon = Color(0xFF4B5563);
  static const Color iconActive = primary;
  static const Color iconInactive = Color(0xFF9CA3AF);
  static const Color iconOnPrimary = Color(0xFFFFFFFF);

  // ───────────────────────── Rating / Badge / Chip ─────────────────────────
  static const Color rating = Color(0xFFFBBF24);
  static const Color badge = Color(0xFFEF4444);
  static const Color chipBackground = Color(0xFFEFF6FF);
  static const Color chipSelected = primary;
  static const Color online = Color(0xFF22C55E);
  static const Color offline = Color(0xFF9CA3AF);

  // ───────────────────────── Shimmer / Skeleton ─────────────────────────
  static const Color shimmerBase = Color(0xFFE5E7EB);
  static const Color shimmerHighlight = Color(0xFFF9FAFB);
  static const Color darkShimmerBase = Color(0xFF1E293B);
  static const Color darkShimmerHighlight = Color(0xFF334155);

  // ───────────────────────── Overlay / Shadow ─────────────────────────
  static const Color transparent = Colors.transparent;
  static const Color overlay = Color(0x80000000); // 50% black
  static const Color overlayLight = Color(0x33000000); // 20% black
  static const Color shadow = Color(0x1A000000); // 10% black
  static const Color shadowDark = Color(0x40000000); // 25% black
  static const Color ripple = Color(0x1F2563EB);

  // ───────────────────────── Social ─────────────────────────
  static const Color facebook = Color(0xFF1877F2);
  static const Color google = Color(0xFFDB4437);
  static const Color apple = Color(0xFF000000);
  static const Color twitter = Color(0xFF1DA1F2);
  static const Color linkedin = Color(0xFF0A66C2);
  static const Color whatsapp = Color(0xFF25D366);
  static const Color instagram = Color(0xFFE4405F);
  static const Color youtube = Color(0xFFFF0000);
  static const Color telegram = Color(0xFF229ED9);

  // ───────────────────────── Gradients ─────────────────────────
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryLight, primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondaryLight, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient successGradient = LinearGradient(
    colors: [Color(0xFF4ADE80), success],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient darkGradient = LinearGradient(
    colors: [darkBackground, darkScaffold],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // ───────────────────────── Helpers ─────────────────────────
  /// Returns a color with custom opacity (0.0 - 1.0)
  static Color withOpacity(Color color, double opacity) =>
      color.withValues(alpha: opacity);

  /// Material swatch from primary color (for legacy `primarySwatch`)
  static const MaterialColor primarySwatch = MaterialColor(
    0xFF2563EB,
    <int, Color>{
      50: Color(0xFFEFF6FF),
      100: Color(0xFFDBEAFE),
      200: Color(0xFFBFDBFE),
      300: Color(0xFF93C5FD),
      400: Color(0xFF60A5FA),
      500: Color(0xFF3B82F6),
      600: Color(0xFF2563EB),
      700: Color(0xFF1D4ED8),
      800: Color(0xFF1E40AF),
      900: Color(0xFF1E3A8A),
    },
  );
}