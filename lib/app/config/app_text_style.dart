import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/config/app_color.dart';

abstract class AppTextStyle {
  AppTextStyle(Color primaryBlue);

  static TextStyle headlineLarge([Color color = AppColor.neutral00]) =>
      TextStyle(
        fontFamily: 'PretendardVariable',
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: color,
        letterSpacing: -0.2,
      );

  static TextStyle headlineMedium([Color color = AppColor.neutral00]) =>
      TextStyle(
        fontFamily: 'PretendardVariable',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: color,
        letterSpacing: 0,
      );

  static TextStyle titleLarge([Color color = AppColor.neutral00]) => TextStyle(
        fontFamily: 'PretendardVariable',
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: color,
        letterSpacing: 0,
      );

  static TextStyle bodyLarge([Color color = AppColor.neutral00]) => TextStyle(
        fontFamily: 'PretendardVariable',
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: color,
        letterSpacing: 0,
      );

  static TextStyle bodyMedium([Color color = AppColor.neutral00]) => TextStyle(
        fontFamily: 'PretendardVariable',
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: color,
        letterSpacing: 0,
      );

  static TextStyle bodyLight([Color color = AppColor.neutral00]) => TextStyle(
        fontFamily: 'PretendardVariable',
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: color,
        letterSpacing: 0,
      );
}
