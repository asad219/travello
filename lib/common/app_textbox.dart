import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travello/theme/styles.dart';

class AppTextBox extends StatelessWidget {
  AppTextBox(
      {super.key,
      required this.label,
      required this.hintText,
      required this.controller,
      this.validator,
      this.suffixFunc,
      this.textInputType,
      this.enabled = true,
      this.obscureText = false,
      required this.isSuffixIcon,
      this.iconName,
      this.customWidget});

  final String label;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? Function(String?)? suffixFunc;
  final TextInputType? textInputType;

  final bool? enabled;
  final bool obscureText;
  final bool isSuffixIcon;
  final String? iconName;
  final Widget? customWidget;

  Widget build(BuildContext context) {
    return TextFormField(
        style: const TextStyle(fontSize: 13),
        obscureText: obscureText ? true : false,
        validator: (value) {},
        keyboardType: TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.primaryColor.withOpacity(.1),
            suffixIcon: customWidget,
            suffixIconConstraints: const BoxConstraints(
              minHeight: 24,
              minWidth: 24,
            ),
            hintStyle: const TextStyle(color: AppColors.textDark, fontSize: 13),
            hintText: hintText,
            contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            border: textBoxOutlineInputBorder,
            enabledBorder: textBoxOutlineInputBorder,
            focusedBorder: textBoxOutlineInputBorder.copyWith(
                borderSide: const BorderSide(color: AppColors.primaryColor))));
  }
}

const textBoxOutlineInputBorder = OutlineInputBorder(
  //borderSide: BorderSide(color: AppColors.primaryColor),
  borderSide: BorderSide.none,
  borderRadius: BorderRadius.all(Radius.circular(30)),
);
