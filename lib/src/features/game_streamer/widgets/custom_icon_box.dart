import 'package:flutter/material.dart';

class CircleAssetIconButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;
  final double iconSize;
    final Color? fillColor; // Optional parameter for border color


  final Color? borderColor; // Optional parameter for border color

  const CircleAssetIconButton({
    Key? key,
    required this.imagePath,
    required this.onTap,
    this.borderColor,
        this.fillColor,

    this.iconSize = 28.0, // Default icon size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
     Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:  fillColor != null?  fillColor
         :Theme.of(context).colorScheme.surface 
        , // Circle background color
       border: borderColor != null
            ? Border.all(color: borderColor!) // Apply the border if color is provided
            : null, // No border if color is null
      ),
      padding: const EdgeInsets.all(6),
      child: GestureDetector(
        onTap: onTap,
        child: Image.asset(
          imagePath,
          width: iconSize,
          height: iconSize,
        ),
      ),
    );
  }
}

