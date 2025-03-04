import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';

class CustomCircle extends StatelessWidget {
  final Widget child;
  final VoidCallback ontap;

  const CustomCircle({
    super.key,
    required this.ontap,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      child: IconButton.filled(
        onPressed: ontap,
        style: IconButton.styleFrom(
          backgroundColor: colorScheme(context).onPrimary.withOpacity(0.2),
        ),
        icon: child,
      ),
    );
  }
}
