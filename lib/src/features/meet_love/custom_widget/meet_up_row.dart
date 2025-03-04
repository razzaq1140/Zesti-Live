import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';

class MeetUpRow extends StatelessWidget {
  final Widget centerWidget ;
  final VoidCallback? onTap ;
  final Color? containerColor ;
  final List<BoxShadow>? boxShadow ;
  final double? height ;
  final double? width ;

  const MeetUpRow({super.key, required this.centerWidget, this.onTap,  this.containerColor, this.boxShadow, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height:height?? 70,width:width?? 70,
        child: Center(
          child: centerWidget,
        ),
        decoration: BoxDecoration(
          color: containerColor?? colorScheme(context).surface ,
          shape: BoxShape.circle,
          boxShadow:boxShadow?? [
            BoxShadow(
              offset: Offset(0, 4),
              color: colorScheme(context).onSurface.withOpacity(.1) ,
              blurRadius: 20,
            )
          ]
        ),
      ),
    );
  }
}
