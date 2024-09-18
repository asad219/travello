import 'package:flutter/material.dart';
import 'package:travello/theme/styles.dart';

class ThemeHelper {
  InputDecoration textInputDecoration(
      [String lableText = "",
      String? hintText,
      TextStyle hintStyle = const TextStyle(color: AppColors.primaryColor),
      Color fillColor = Colors.white,
      Color borderColor = const Color.fromRGBO(21, 115, 81, 1),
      Color errorBorder = AppColors.redWarning,
      TextStyle? errorStyle,
      bool isIcon = false,
      Icon icon = const Icon(Icons.calendar_today)]) {
    return InputDecoration(
      filled: true,
      fillColor: fillColor,
      hintStyle: hintStyle,
      hintText: hintText,
      errorStyle: errorStyle,
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: borderColor)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: borderColor)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: errorBorder, width: 2.0)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: errorBorder, width: 2.0)),
      // labelText: 'Username',
      // labelStyle: TextStyle(color: gt.primaryColor),
    );
  }

  BoxDecoration inputBoxDecorationShaddow() {
    return BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 10),
      )
    ]);
  }
}
