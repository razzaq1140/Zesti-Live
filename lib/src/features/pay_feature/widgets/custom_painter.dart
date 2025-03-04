import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';


class CornerPainter extends CustomPainter {
  final bool isTopLeft;
  final bool isTopRight;
  final bool isBottomLeft;
  final bool isBottomRight;

  CornerPainter({
    this.isTopLeft = false,
    this.isTopRight = false,
    this.isBottomLeft = false,
    this.isBottomRight = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColor.tagRed
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    if (isTopLeft) {
      // Top-left corner
      canvas.drawLine(Offset(0, 0), Offset(size.width, 0), paint);
      canvas.drawLine(Offset(0, 0), Offset(0, size.height), paint);
    }
    if (isTopRight) {
      // Top-right corner
      canvas.drawLine(Offset(0, 0), Offset(-size.width, 0), paint);
      canvas.drawLine(Offset(0, 0), Offset(0, size.height), paint);
    }
    if (isBottomLeft) {
      // Bottom-left corner
      canvas.drawLine(Offset(0, 0), Offset(size.width, 0), paint);
      canvas.drawLine(Offset(0, 0), Offset(0, -size.height), paint);
    }
    if (isBottomRight) {
      // Bottom-right corner
      canvas.drawLine(Offset(0, 0), Offset(-size.width, 0), paint);
      canvas.drawLine(Offset(0, 0), Offset(0, -size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
