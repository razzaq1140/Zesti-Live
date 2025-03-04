import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../common/const/global_variables.dart';

class QRScannerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          MobileScanner(
            overlayBuilder: (context, constraints) {
              return Center(
                child: ClipPath(
                  clipper: ScanningWindowClipper(),
                  child: Container(
                    color: const Color(0x80000000),
                  ),
                ),
              );
            },
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                if (barcode.rawValue != null) {
                  context.pop(barcode.rawValue!);
                  break;
                }
              }
            },
          ),
          Positioned(
            top: 40,
            left: 16,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back,
                      color: colorScheme(context).onPrimary),
                  onPressed: () => context.pop(),
                ),
                Text(
                  'QR Code',
                  style: textTheme(context)
                      .titleSmall
                      ?.copyWith(color: colorScheme(context).onPrimary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ScanningWindowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: 250,
          height: 250,
        ),
        const Radius.circular(8),
      ))
      ..fillType = PathFillType.evenOdd;

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
