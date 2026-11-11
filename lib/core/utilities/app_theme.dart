import 'package:flutter/material.dart';
import 'package:kira/core/utilities/App_colors.dart';

abstract class AppTheme {
  // <=========================Light Theme==============================>

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,

    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      secondary: AppColors.secondary,
      onSecondary: Colors.blueAccent,
      error: AppColors.error,
      onError: AppColors.white,
      surface: AppColors.background,

      onSurface: AppColors.black,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        disabledForegroundColor: AppColors.primary,
        // disabledBackgroundColor: AppColors.accent,
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
        foregroundColor: AppColors.white,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

        backgroundColor: AppColors.white,
        side: const BorderSide(
          color: AppColors.primary,
          width: 2.5,
          strokeAlign: 0,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.primary,
    ),

    //   dropdownMenuTheme: DropdownMenuThemeData(
    //     inputDecorationTheme: InputDecorationTheme(
    //       filled: true,
    //       fillColor: AppColors.surface,
    //       contentPadding: const EdgeInsets.symmetric(
    //         horizontal: 16,
    //         vertical: 14,
    //       ),
    //       border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(12),
    //         borderSide: const BorderSide(color: AppColors.greyMedium300),
    //       ),
    //       enabledBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(12),
    //         borderSide: const BorderSide(color: AppColors.greyMedium300),
    //       ),
    //       focusedBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(12),
    //         borderSide: const BorderSide(color: AppColors.primary, width: 2),
    //       ),
    //       hintStyle: const TextStyle(color: AppColors.greyMedium500),
    //     ),
    //   ),
  );
  // <=========================Dark Theme==============================>
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      secondary: AppColors.secondary,
      onSecondary: AppColors.white,
      error: AppColors.error,
      onError: AppColors.white,
      surface: AppColors.darkGreen,
      onSurface: AppColors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
        foregroundColor: AppColors.white,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.primary,
    ),
  );
}
