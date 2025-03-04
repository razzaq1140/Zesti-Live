import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_svg/svg.dart';

class BottomCategory extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback ontap;

  const BottomCategory({
    Key? key,
    required this.imagePath,
    required this.label,
    required this.ontap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: ontap,
            child: Container(
              width: 62, // Adjust width as needed
              height: 62, // Adjust height as needed
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(
                  imagePath, // Replace with your SVG file path
                  fit: BoxFit.fill, // Adjust to fill the container
                ),
            
                     
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            label,
            textAlign: TextAlign.center, // Align the text in the center

            style: textTheme(context).bodySmall?.copyWith(
                  fontSize: 12,
                  color: colorScheme(context).primary, // Visible color
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}
