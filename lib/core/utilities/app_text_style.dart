import 'package:flutter/material.dart';
import 'package:kira/core/utilities/App_colors.dart';

abstract class AppTextStyle {
  static const String _fontFamily = "NotoSansArabic";
  // <========================= Regular style ==============================>
  static const TextStyle regular12 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 12,
  );
  static const TextStyle regular16 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 16,
  );
  static const TextStyle regular20 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 20,
  );
  static const TextStyle regular24 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 24,
  );

  // <========================= Medium style ==============================>
  static const TextStyle medium8 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 8,
  );
  static const TextStyle medium12 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  static const TextStyle medium14 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );
  static const TextStyle medium16 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  static const TextStyle medium20 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );
  static const TextStyle medium24 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 24,
  );

  // <========================= semi Bold style ==============================>
  static const TextStyle semiBold12 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 12,

  );
  static const TextStyle semiBold16 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );
  static const TextStyle semiBold18 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );
  static const TextStyle semiBold20 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );
  static const TextStyle semiBold22 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 22,
  );
  static const TextStyle semiBold24 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 24,
  );

  // <========================= bold style ==============================>

  static const TextStyle bold12 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );
  static const TextStyle bold20 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  static const TextStyle bold24 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );
  static const TextStyle bold28 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 28,
  );
  static const TextStyle bold36 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 36,
  );
  static const TextStyle bold46 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    letterSpacing: 11.5,
    color: AppColors.primary,
    fontSize: 46,
  );

  // <========================= extra bold style ==============================>
  static const TextStyle extraBold14 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w800,
    fontSize: 14,
    color: AppColors.line,
  );
}
