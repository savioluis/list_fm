import 'package:flutter/material.dart';
import 'package:list_fm/core/theme/color/app_colors.dart';
import 'package:list_fm/core/theme/text_field/text_field_theme_data.dart';

class AppTheme {
  static ThemeData lightTheme() {
    final baseTheme = ThemeData.light();
    const colorScheme = ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
      error: AppColors.error,
      onError: AppColors.onError,
    );

    return baseTheme.copyWith(
      scaffoldBackgroundColor: AppColors.surface,
      colorScheme: colorScheme,
      inputDecorationTheme: TextFieldThemeData.lightTheme(colorScheme),
    );
  }

  static ThemeData darkTheme() {
    final baseTheme = ThemeData.dark();
    const colorScheme = ColorScheme.dark(
      primary: AppColors.darkPrimary,
      onPrimary: AppColors.darkOnPrimary,
      secondary: AppColors.darkSecondary,
      onSecondary: AppColors.darkOnSecondary,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkOnSurface,
      error: AppColors.darkError,
      onError: AppColors.darkOnError,
    );

    return baseTheme.copyWith(
      scaffoldBackgroundColor: AppColors.darkSurface,
      colorScheme: colorScheme,
      inputDecorationTheme: TextFieldThemeData.darkTheme(colorScheme),
    );
  }
}