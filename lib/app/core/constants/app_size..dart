import 'package:flutter/material.dart';

/// All spacing, sizes, radius, elevation & durations live here.
/// Never hard-code numbers inside widgets, use these instead.
class AppSize {
  AppSize._();

  // ── Spacing ──
  static const double xxs = 2;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double xxxl = 32;
  static const double huge = 48;
  static const double massive = 64;

  // ── Screen padding ──
  static const double screenHorizontal = 16;
  static const double screenVertical = 16;
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: screenHorizontal,
    vertical: screenVertical,
  );
  static const EdgeInsets cardPadding = EdgeInsets.all(16);

  // ── Icon sizes ──
  static const double iconXs = 14;
  static const double iconSm = 18;
  static const double iconMd = 24;
  static const double iconLg = 32;
  static const double iconXl = 48;

  // ── Component heights ──
  static const double buttonHeight = 52;
  static const double buttonHeightSm = 40;
  static const double inputHeight = 52;
  static const double appBarHeight = 56;
  static const double bottomNavHeight = 64;
  static const double avatarSm = 32;
  static const double avatarMd = 48;
  static const double avatarLg = 72;

  // ── Elevation ──
  static const double elevationNone = 0;
  static const double elevationSm = 1;
  static const double elevationMd = 3;
  static const double elevationLg = 8;

  // ── Border width ──
  static const double borderThin = 1;
  static const double borderThick = 1.5;
}

/// Corner radius values.
class AppRadius {
  AppRadius._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double full = 100;

  static const BorderRadius circularXs = BorderRadius.all(Radius.circular(xs));
  static const BorderRadius circularSm = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius circularMd = BorderRadius.all(Radius.circular(md));
  static const BorderRadius circularLg = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius circularXl = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius circularFull =
  BorderRadius.all(Radius.circular(full));

  static const BorderRadius topSheet = BorderRadius.only(
    topLeft: Radius.circular(xl),
    topRight: Radius.circular(xl),
  );
}

/// Ready-made SizedBox gaps: `AppGap.h16`, `AppGap.w8`
class AppGap {
  AppGap._();

  static const SizedBox h4 = SizedBox(height: 4);
  static const SizedBox h8 = SizedBox(height: 8);
  static const SizedBox h12 = SizedBox(height: 12);
  static const SizedBox h16 = SizedBox(height: 16);
  static const SizedBox h20 = SizedBox(height: 20);
  static const SizedBox h24 = SizedBox(height: 24);
  static const SizedBox h32 = SizedBox(height: 32);
  static const SizedBox h48 = SizedBox(height: 48);

  static const SizedBox w4 = SizedBox(width: 4);
  static const SizedBox w8 = SizedBox(width: 8);
  static const SizedBox w12 = SizedBox(width: 12);
  static const SizedBox w16 = SizedBox(width: 16);
  static const SizedBox w24 = SizedBox(width: 24);
}

/// Animation durations & curves.
class AppDuration {
  AppDuration._();

  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration splash = Duration(seconds: 2);
  static const Curve curve = Curves.easeInOut;
}