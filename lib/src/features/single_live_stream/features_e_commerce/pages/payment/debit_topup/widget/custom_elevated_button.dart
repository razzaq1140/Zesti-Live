import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? text;
  final double? width;
  final double? height;
  final Color? buttonColor;
  final Color? textColor;
  final Color? iconColor;
  final Color? iconContainerColor; // New parameter for icon container color
  final bool showIcon; // Toggle the icon display
  final IconData? icon; // New parameter for customizable icon
  final VoidCallback? onPressed;
  final double? borderRadius; // Parameter for customizable borderRadius
  final Color? outlineBorderColor; // New parameter for outline border color

  const CustomElevatedButton({
    Key? key,
    this.text,
    this.width,
    this.height,
    this.buttonColor,
    this.textColor,
    this.iconColor,
    this.iconContainerColor = Colors.white, // Default icon container color
    this.showIcon = true, // Default to true to show the icon
    this.icon = Icons.arrow_forward, // Default icon
    this.onPressed,
    this.borderRadius = 25.0, // Default borderRadius
    this.outlineBorderColor, // Outline border color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width ?? 300, // Default width
        child: ElevatedButton(
          onPressed: onPressed ??
              () {
                // Default action if onPressed is not provided
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const EditSellerProfile(),
                //   ),
                // );
              },
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor ?? const Color.fromARGB(255, 22, 35, 179),
            minimumSize: Size(double.infinity, height ?? 50), // Set height
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 25.0),
              side: BorderSide(
                color: outlineBorderColor ?? Colors.transparent, // Set outline color
                width: 2.0, // Set outline width
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  text ?? 'Continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              // Show icon only if showIcon is true
              if (showIcon)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: iconContainerColor, // Use the customizable container color
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon, // Use the customizable icon here
                      color: iconColor ?? const Color.fromARGB(255, 22, 35, 179),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}