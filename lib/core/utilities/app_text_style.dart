import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static const String _fontFamily = "NotoSans";
  // <========================= Regular style ==============================>
  static TextStyle regular12 = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 12,
  );
  static TextStyle regular16 = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 16,
  );
  static TextStyle regular20 = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 20,
  );
  static TextStyle regular24 = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 24,
  );

  // <========================= Medium style ==============================>
  static TextStyle medium8 = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 8,
  );
  static TextStyle medium12 = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  static TextStyle medium14 = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );
  static TextStyle medium16 = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  static TextStyle medium20 = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );
  static TextStyle medium24 = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 24,
  );

  // <========================= semi Bold style ==============================>
  static TextStyle semiBold16 = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );
  static TextStyle semiBold20 = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );
  static TextStyle semiBold22 = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 22,
  );
  static TextStyle semiBold24 = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 24,
  );

  // <========================= bold style ==============================>

  static TextStyle bold20 = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  static TextStyle bold24 = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );
  static TextStyle bold28 = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 28,
  );
  static TextStyle bold36 = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 36,
  );
}
