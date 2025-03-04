import 'package:flutter/material.dart';

class CustomButtonWithIcon extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color textColor;

  const CustomButtonWithIcon({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.onTap,
    this.backgroundColor = const Color(0xFFEFEFEF), // Default background color
    this.textColor = Colors.black, // Default text color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor, // Customizable background color
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              // Image on the left
              Image.asset(
                imagePath,
                height: 24,
              ),
              const SizedBox(width: 32), // Space between image and text
              // Text on the right
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  color: textColor, // Customizable text color
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
