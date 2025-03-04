import 'package:flutter/material.dart';

class CustomSearchContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final Color? color;
  const CustomSearchContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.child,
      required this.color});
  @override
  Widget build(Object context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
