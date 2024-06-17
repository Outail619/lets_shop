import 'package:flutter/material.dart';
import 'package:lets_shop/core/theme/app_colors.dart';
import 'package:lets_shop/core/theme/app_spacings.dart';

class AppThemes {
  AppThemes._();

  static final light = ThemeData(
    fontFamily: "Mitr",
    scaffoldBackgroundColor: Colors.white,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: const WidgetStatePropertyAll(
          Colors.white,
        ),
        backgroundColor: WidgetStateColor.resolveWith(
          (states) => states.contains(WidgetState.disabled)
              ? AppColors.primaryColor.withOpacity(0.3)
              : AppColors.primaryColor,
        ),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
        ),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: AppSpacings.md,
            horizontal: AppSpacings.xl,
          ),
        ),
        textStyle: const WidgetStatePropertyAll(
          TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
      selectionColor: AppColors.primaryColor,
      selectionHandleColor: AppColors.primaryColor,
    ),
  );
}
