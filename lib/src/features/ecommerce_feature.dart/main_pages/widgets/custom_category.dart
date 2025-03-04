import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';

class CategoryWidget extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback ontap;

  const CategoryWidget({
    Key? key,
    required this.imagePath,
    required this.label,
    required this.ontap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Column(
          children: [
            Container(
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
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 4,
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
      ),
    );
  }
}
