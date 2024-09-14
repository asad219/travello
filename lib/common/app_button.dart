import 'package:flutter/material.dart';
import 'package:travello/common/loading_widget.dart';
import 'package:travello/theme/styles.dart';

enum ButtonState { idle, loading, disabled }

class AppButton extends StatefulWidget {
  final String title;
  final TextStyle? titleStyle;
  final ButtonState state;
  final Widget? leadingIcon;
  final List<Color>? gradiant;
  final Function()? onTap;
  final Color? titleColor;
  final double? buttonRadius;
  final double? fontSize = 14;

  AppButton({
    Key? key,
    required this.title,
    this.titleStyle,
    this.state = ButtonState.idle,
    this.leadingIcon,
    this.gradiant,
    required this.onTap,
    this.titleColor,
    this.buttonRadius,
  }) : super(key: key);

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    final defaultColor =
        widget.gradiant ?? [AppColors.primaryColor, AppColors.secondaryColor];
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: defaultColor.length < 2 ? defaultColor.first : null,
            borderRadius: BorderRadius.circular(widget.buttonRadius!),
            gradient: defaultColor.length > 1
                ? LinearGradient(
                    colors: defaultColor,
                  )
                : null),
        child: widget.state == ButtonState.loading
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: LoadingWidget(),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        color: widget.titleColor, fontSize: widget.fontSize),
                  ),
                  if (widget.leadingIcon != null)
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: widget.leadingIcon,
                    ),
                ],
              ),
      ),
    );
  }
}
