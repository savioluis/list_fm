// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:list_fm/core/theme/color/app_colors.dart';

class TextFieldThemeData {
  static InputDecorationTheme lightTheme(ColorScheme colorScheme) {
    return InputDecorationTheme(
      filled: false,
      fillColor: Colors.transparent,
      labelStyle: TextStyle(color: colorScheme.primary),
      floatingLabelStyle: TextStyle(color: colorScheme.primary),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12 , vertical: 18),
      hintStyle: TextStyle(fontSize: 16, color: AppColors.lightGrey.withOpacity(0.5)),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(width: 0.4, color: AppColors.primary),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(width: 0.4, color: Colors.orange),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(width: 0.4, color: AppColors.lightGrey),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          width: 0.4,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(width: 0.4, color: AppColors.error),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(width: 0.4, color: AppColors.error),
      ),
    );
  }

  static InputDecorationTheme darkTheme(ColorScheme colorScheme) {
    return InputDecorationTheme(
      filled: false,
      fillColor: Colors.transparent,
      labelStyle: TextStyle(color: colorScheme.primary),
      floatingLabelStyle: TextStyle(color: colorScheme.primary),
      hintStyle: TextStyle(fontSize: 16, color: AppColors.darkLightGrey.withOpacity(0.5)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12 , vertical: 18),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(width: 0.4, color: AppColors.darkPrimary),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(width: 0.4, color: Colors.orange),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(width: 0.4, color: AppColors.darkLightGrey),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          width: 0.4,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(width: 0.4, color: AppColors.darkError),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(width: 0.4, color: AppColors.darkError),
      ),
    );
  }
}