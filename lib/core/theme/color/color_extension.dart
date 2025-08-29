import 'package:flutter/material.dart';
import 'package:list_fm/core/theme/color/app_colors.dart';
import 'package:list_fm/core/theme/theme_extension.dart';

extension ColorExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  // Cores do tema principal e secundario
  Color get primaryColor => colorScheme.primary;
  Color get onPrimaryColor => colorScheme.onPrimary;
  Color get secondaryColor => colorScheme.secondary;
  Color get onSecondaryColor => colorScheme.onSecondary;

  Color get surfaceColor => colorScheme.surface;
  Color get onSurfaceColor => colorScheme.onSurface;

  Color get whiteColor => Colors.white;
  Color get blackColor => Colors.black;

  Color get errorColor => colorScheme.error;
  Color get onErrorColor => colorScheme.onError;

  Color get greyColor => isDarkMode ? AppColors.darkGrey : AppColors.grey;

  Color get lightGreyColor => isDarkMode ? AppColors.darkGrey : AppColors.lightGrey;

  Color getTextColor(Set<WidgetState> states, {bool isPrimary = true}) {
    if (states.contains(WidgetState.disabled)) {
      return AppColors.grey.withValues(alpha: 0.6);
    }
    return isPrimary ? onPrimaryColor : onSecondaryColor;
  }
}
