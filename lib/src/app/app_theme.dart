import 'package:flutter/material.dart';
import 'package:life_goals_pdm/src/app/app_colors.dart';

mixin CustomTheme {
  static final theme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      isDense: true,
      contentPadding: EdgeInsets.only(bottom: 0, top: 5),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shadowColor: AppColors.shadow,
        elevation: 0,
        primary: AppColors.primary,
        minimumSize: const Size.fromHeight(40),
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      toolbarHeight: 90,
      backgroundColor: AppColors.white,
      elevation: 0,
    ),
  );
}
