import 'package:flutter/material.dart';

abstract class AppColor {
  const AppColor._();

  //! Neutral 색상
  static const int neutral00Hex = 0xFFE1E1E1;
  static const neutral00 = Color(neutral00Hex);

  static const int neutral30Hex = 0xFF5F5F5F;
  static const neutral30 = Color(neutral30Hex);

  static const int neutral40Hex = 0xFF454545;
  static const neutral40 = Color(neutral40Hex);

  static const int neutral60Hex = 0xFF313131;
  static const neutral60 = Color(neutral60Hex);

  static const int neutral80Hex = 0xFF1F1F1F;
  static const neutral80 = Color(neutral80Hex);

  //! Primary 색상
  static const primaryBlueHex = 0xFF2196F3; 
  static const primaryBlue = Color(primaryBlueHex);

  //! Secondary 색상
  static const int secondaryRedHex = 0xFFF44336;
  static const secondaryRed = Color(secondaryRedHex);

  static const int secondaryOrangeHex = 0xFFFF9800;
  static const secondaryOrange = Color(secondaryOrangeHex);

  static const int secondaryYellowHex = 0xFFFFEB3B;
  static const secondaryYellow = Color(secondaryYellowHex);

  static const int secondaryGreenHex = 0xFF4CAF50;
  static const secondaryGreen = Color(secondaryGreenHex);

  static const int secondaryIndigoHex = 0xFF3F51B5;
  static const secondaryIndigo = Color(secondaryIndigoHex);

  static const int secondaryPurpleHex = 0xFF9C27B0;
  static const secondaryPurple = Color(secondaryPurpleHex);
}
