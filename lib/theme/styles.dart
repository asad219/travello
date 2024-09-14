import 'package:flutter/material.dart';

class AppColors {
  //primary Background
  static const Color primaryBackground = Color(0XFFF8F8F8);

  //secondary Background
  static const Color secondaryBackground = Color(0XFF151515);

  //primary color
  static const Color primaryColor = Color(0XFF157351);

  //secondary color
  static const Color secondaryColor = Color(0XFFFFCF49);

  //text light color
  static const Color textLight = Color(0XFFACACAC);

  //text white color
  static const Color textWhite = Color(0XFFFFFFFF);

  //text dark color
  static const Color textDark = Color(0XFF151515);
}

TextStyle h1(Color textColor) {
  return TextStyle(
      fontSize: 28.83, color: textColor, fontWeight: FontWeight.w600);
}

TextStyle h2(Color textColor) {
  return TextStyle(
      fontSize: 25.63, color: textColor, fontWeight: FontWeight.w600);
}

TextStyle h3(Color textColor) {
  return TextStyle(
      fontSize: 22.78, color: textColor, fontWeight: FontWeight.w600);
}

TextStyle h4(Color textColor) {
  return TextStyle(fontSize: 16, color: textColor, fontWeight: FontWeight.w600);
}

TextStyle normalText1(Color textColor) {
  return TextStyle(fontSize: 16, color: textColor, fontWeight: FontWeight.w600);
}

TextStyle normalText2(Color textColor) {
  return TextStyle(
      fontSize: 14.22, color: textColor, fontWeight: FontWeight.w600);
}

TextStyle smallText1(Color textColor) {
  return TextStyle(
      fontSize: 12.64, color: textColor, fontWeight: FontWeight.w600);
}

TextStyle smallText2(Color textColor) {
  return TextStyle(
      fontSize: 11.24, color: textColor, fontWeight: FontWeight.w600);
}
