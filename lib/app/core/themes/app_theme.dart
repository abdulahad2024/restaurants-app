import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurants_app/app/core/constants/app_color.dart';
import 'package:restaurants_app/app/core/constants/app_size..dart';

import 'app_text_style.dart';


class AppTheme {


  AppTheme._();

  static ThemeData get light => _build(Brightness.light);
  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;

    // ── Palette picked by mode ──
    final Color bg = isDark ? AppColor.darkScaffold : AppColor.scaffold;
    final Color surface = isDark ? AppColor.darkSurface : AppColor.surface;
    final Color surfaceVariant =
    isDark ? AppColor.darkSurfaceVariant : AppColor.surfaceVariant;
    final Color textPrimary =
    isDark ? AppColor.darkTextPrimary : AppColor.textPrimary;
    final Color textSecondary =
    isDark ? AppColor.darkTextSecondary : AppColor.textSecondary;
    final Color textHint = isDark ? AppColor.darkTextHint : AppColor.textHint;
    final Color border = isDark ? AppColor.darkBorder : AppColor.border;
    final Color inputFill =
    isDark ? AppColor.darkInputFill : AppColor.inputFill;

    final ColorScheme colorScheme = ColorScheme(
      brightness: brightness,
      primary: AppColor.primary,
      onPrimary: AppColor.textOnPrimary,
      primaryContainer: isDark ? AppColor.primaryDark : AppColor.primarySurface,
      onPrimaryContainer: isDark ? AppColor.white : AppColor.primaryDark,
      secondary: AppColor.secondary,
      onSecondary: AppColor.textOnSecondary,
      tertiary: AppColor.accent,
      onTertiary: AppColor.black,
      error: AppColor.error,
      onError: AppColor.white,
      errorContainer: AppColor.errorLight,
      onErrorContainer: AppColor.errorDark,
      surface: surface,
      onSurface: textPrimary,
      onSurfaceVariant: textSecondary,
      surfaceContainerHighest: surfaceVariant,
      outline: border,
      outlineVariant: isDark ? AppColor.darkDivider : AppColor.divider,
      shadow: AppColor.shadow,
    );

    OutlineInputBorder inputBorder(Color color, {double width = 1}) =>
        OutlineInputBorder(
          borderRadius: AppRadius.circularMd,
          borderSide: BorderSide(color: color, width: width),
        );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      fontFamily: AppFont.family,
      scaffoldBackgroundColor: bg,
      primaryColor: AppColor.primary,
      splashColor: AppColor.ripple,
      highlightColor: AppColor.transparent,
      dividerColor: colorScheme.outlineVariant,
      disabledColor: AppColor.textDisabled,
      textTheme: AppTextStyle.textTheme(
        primary: textPrimary,
        secondary: textSecondary,
      ),

      // ── AppBar ──
      appBarTheme: AppBarTheme(
        backgroundColor: isDark ? AppColor.darkAppBar : AppColor.appBar,
        foregroundColor: textPrimary,
        elevation: AppSize.elevationNone,
        scrolledUnderElevation: AppSize.elevationSm,
        centerTitle: true,
        toolbarHeight: AppSize.appBarHeight,
        titleTextStyle: AppTextStyle.h5.copyWith(color: textPrimary),
        iconTheme: IconThemeData(color: textPrimary, size: AppSize.iconMd),
        systemOverlayStyle: isDark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
      ),

      // ── Buttons ──
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.buttonPrimary,
          foregroundColor: AppColor.textOnPrimary,
          disabledBackgroundColor: AppColor.buttonDisabled,
          disabledForegroundColor: AppColor.buttonDisabledText,
          minimumSize: const Size.fromHeight(AppSize.buttonHeight),
          elevation: AppSize.elevationNone,
          textStyle: AppTextStyle.button,
          shape: const RoundedRectangleBorder(
              borderRadius: AppRadius.circularMd),
        ),
      ),


      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(AppSize.buttonHeight),
          textStyle: AppTextStyle.button,
          shape: const RoundedRectangleBorder(
              borderRadius: AppRadius.circularMd),
        ),
      ),


      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColor.primary,
          minimumSize: const Size.fromHeight(AppSize.buttonHeight),
          side: const BorderSide(
              color: AppColor.buttonOutline, width: AppSize.borderThick),
          textStyle: AppTextStyle.button,
          shape: const RoundedRectangleBorder(
              borderRadius: AppRadius.circularMd),
        ),
      ),


      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColor.primary,
          textStyle: AppTextStyle.button,
          shape: const RoundedRectangleBorder(
              borderRadius: AppRadius.circularSm),
        ),
      ),


      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(foregroundColor: textPrimary),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.white,
        elevation: AppSize.elevationMd,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.circularLg),
      ),

      // ── Input fields ──
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: inputFill,
        isDense: true,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintStyle: AppTextStyle.bodyMedium.copyWith(color: textHint),
        labelStyle: AppTextStyle.bodyMedium.copyWith(color: textSecondary),
        errorStyle: AppTextStyle.caption.copyWith(color: AppColor.error),
        prefixIconColor: textHint,
        suffixIconColor: textHint,
        border: inputBorder(border),
        enabledBorder: inputBorder(border),
        focusedBorder:
        inputBorder(AppColor.borderFocused, width: AppSize.borderThick),
        errorBorder: inputBorder(AppColor.borderError),
        focusedErrorBorder:
        inputBorder(AppColor.borderError, width: AppSize.borderThick),
        disabledBorder: inputBorder(border.withValues(alpha: 0.5)),
      ),

      // ── Card / Dialog / Sheets ──
      cardTheme: CardThemeData(
        color: isDark ? AppColor.darkCard : AppColor.card,
        elevation: AppSize.elevationNone,
        margin: EdgeInsets.zero,
        shadowColor: AppColor.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.circularLg,
          side: BorderSide(color: border),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: surface,
        elevation: AppSize.elevationLg,
        titleTextStyle: AppTextStyle.h5.copyWith(color: textPrimary),
        contentTextStyle:
        AppTextStyle.bodyMedium.copyWith(color: textSecondary),
        shape: const RoundedRectangleBorder(
            borderRadius: AppRadius.circularXl),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: surface,
        modalBackgroundColor: surface,
        showDragHandle: true,
        dragHandleColor: border,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.topSheet),
      ),

      // ── Navigation ──
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor:
        isDark ? AppColor.darkBottomNav : AppColor.bottomNav,
        selectedItemColor: AppColor.iconActive,
        unselectedItemColor: AppColor.iconInactive,
        type: BottomNavigationBarType.fixed,
        elevation: AppSize.elevationLg,
        selectedLabelStyle: AppTextStyle.caption,
        unselectedLabelStyle: AppTextStyle.caption,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor:
        isDark ? AppColor.darkBottomNav : AppColor.bottomNav,
        height: AppSize.bottomNavHeight,
        indicatorColor: AppColor.primary.withValues(alpha: 0.12),
        labelTextStyle: WidgetStatePropertyAll(AppTextStyle.caption),
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: AppColor.primary,
        unselectedLabelColor: textHint,
        indicatorColor: AppColor.primary,
        dividerColor: colorScheme.outlineVariant,
        labelStyle: AppTextStyle.button.copyWith(fontSize: 14),
        unselectedLabelStyle: AppTextStyle.button.copyWith(fontSize: 14),
      ),

      // ── Chips / Switch / Checkbox / Radio ──
      chipTheme: ChipThemeData(
        backgroundColor: isDark ? AppColor.darkSurfaceVariant : AppColor.chipBackground,
        selectedColor: AppColor.chipSelected,
        labelStyle: AppTextStyle.caption.copyWith(color: textPrimary),
        secondaryLabelStyle:
        AppTextStyle.caption.copyWith(color: AppColor.white),
        side: BorderSide.none,
        shape: const RoundedRectangleBorder(
            borderRadius: AppRadius.circularFull),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) =>
        states.contains(WidgetState.selected)
            ? AppColor.white
            : AppColor.grey400),
        trackColor: WidgetStateProperty.resolveWith((states) =>
        states.contains(WidgetState.selected)
            ? AppColor.primary
            : (isDark ? AppColor.grey700 : AppColor.grey200)),
        trackOutlineColor: const WidgetStatePropertyAll(AppColor.transparent),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) =>
        states.contains(WidgetState.selected)
            ? AppColor.primary
            : AppColor.transparent),
        checkColor: const WidgetStatePropertyAll(AppColor.white),
        side: BorderSide(color: border, width: AppSize.borderThick),
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.circularXs),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) =>
        states.contains(WidgetState.selected)
            ? AppColor.primary
            : AppColor.grey400),
      ),

      // ── Misc ──
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: AppSize.borderThin,
        space: AppSize.borderThin,
      ),
      listTileTheme: ListTileThemeData(
        iconColor: textSecondary,
        textColor: textPrimary,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: AppSize.lg),
        shape: const RoundedRectangleBorder(
            borderRadius: AppRadius.circularMd),
      ),
      iconTheme: IconThemeData(color: textSecondary, size: AppSize.iconMd),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColor.primary,
        linearTrackColor: AppColor.grey200,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: isDark ? AppColor.grey700 : AppColor.grey900,
        contentTextStyle:
        AppTextStyle.bodyMedium.copyWith(color: AppColor.white),
        shape: const RoundedRectangleBorder(
            borderRadius: AppRadius.circularMd),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColor.grey800,
          borderRadius: AppRadius.circularSm,
        ),
        textStyle: AppTextStyle.caption.copyWith(color: AppColor.white),
      ),
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: const FadeForwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}