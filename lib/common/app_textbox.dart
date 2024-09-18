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
      this.textInputType,
      this.enabled = true,
      this.obscureText = false,
      this.isSuffixIcon = false,
      this.suffixIcon});

  final String label;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;

  final bool? enabled;
  final bool obscureText;
  final bool? isSuffixIcon;
  final String? suffixIcon;

  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText ? true : false,
        validator: (value) {},
        keyboardType: TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
            suffix: isSuffixIcon!
                ? SvgPicture.asset(
                    suffixIcon!,
                    height: 25,
                  )
                : Container(),
            hintStyle: TextStyle(color: AppColors.textDark),
            hintText: hintText,
            labelText: label,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            border: textBoxOutlineInputBorder,
            enabledBorder: textBoxOutlineInputBorder,
            focusedBorder: textBoxOutlineInputBorder.copyWith(
                borderSide: const BorderSide(color: AppColors.primaryColor))));
  }
}

const textBoxOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: AppColors.secondaryColor),
  borderRadius: BorderRadius.all(Radius.circular(30)),
);
