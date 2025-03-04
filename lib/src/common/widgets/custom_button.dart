import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color textColor;
  final double width;
  final double height;
  final double borderRadius;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.width = 325,
    this.height = 48,
    this.borderRadius = 25,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? colorScheme(context).primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: textStyle ??
              TextStyle(
                fontSize: 18,
                color: textColor,
              ),
        ),
      ),
    );
  }
}
