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
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(6),
        ),
        foregroundColor: AppColors.white,
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
