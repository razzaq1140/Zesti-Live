import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/pages/audio_live.dart';
import 'package:flutter_application_zestilive/src/features/pay_feature/widgets/bottom_category_widget.dart';
import 'package:flutter_application_zestilive/src/features/pay_feature/widgets/custom_painter.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class PayPageOne extends StatefulWidget {
  const PayPageOne({super.key});

  @override
  State<PayPageOne> createState() => _PayPageOneState();
}

class _PayPageOneState extends State<PayPageOne> {
  double _bottomSheetHeight =
      0.30; // Default height as a fraction of the screen

  void _toggleBottomSheetHeight() {
    setState(() {
      // Toggle between expanded height and reduced height
      _bottomSheetHeight = _bottomSheetHeight == 0.30 ? 0.1 : 0.30;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
       AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorScheme(context).primary,
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_outlined,
                    color: colorScheme(context).surface,
                    size: 14, // Adjust icon size to fit
                  ),
                ),
              ),
            ),
            Text(
              "Pay",
              style: textTheme(context).bodyMedium?.copyWith(
                  color: colorScheme(context)
                      .outline
                      .withOpacity(0.7), // Contrast color
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
            GestureDetector(
              onTap: () {
                // Navigation Handle
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorScheme(context).primary,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 8, top: 8, bottom: 8),
                    child: SvgPicture.asset(
                      AppIcons
                          .galleryIcon, // Replace with the path to your SVG file
                      height: 20, // Adjust size as needed
                      width: 20, // Adjust size as needed
                      color: Colors.white, // Optional: Apply a color to the SVG
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    
    
      body: GestureDetector(
        onTap: _toggleBottomSheetHeight, // Toggle height on tap
        child: Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              color: AppColor.greyText.withOpacity(0.5),
              child: Column(children: [
                const SizedBox(
                  height: 150,
                ),
                Stack(
                  children: [
                    // White Container
                    Container(
                      height: 200,
                      width: 200,
                      color: Colors.white,
                    ),
                    // Green Corner Borders
                    Positioned(
                      top: 0,
                      left: 0,
                      child: CustomPaint(
                        size: const Size(40, 40),
                        painter: CornerPainter(isTopLeft: true),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: -40,
                      child: CustomPaint(
                        size: const Size(40, 40),
                        painter: CornerPainter(isTopRight: true),
                      ),
                    ),
                    Positioned(
                      bottom: -40,
                      left: 0,
                      child: CustomPaint(
                        size: const Size(40, 40),
                        painter: CornerPainter(isBottomLeft: true),
                      ),
                    ),
                    Positioned(
                      bottom: -40,
                      right: -40,
                      child: CustomPaint(
                        size: const Size(40, 40),
                        painter: CornerPainter(isBottomRight: true),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Text(
                  "Scan the code using your camera",
                  style: textTheme(context).bodyMedium?.copyWith(
                      color: colorScheme(context).surface, // Contrast color
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                )
              ]),
            ),
            DraggableScrollableSheet(
              initialChildSize:
                  _bottomSheetHeight, // Initial height of the sheet
              minChildSize: 0.1, // Minimum height
              maxChildSize: 0.5, // Maximum height
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      const SizedBox(height: 10),
                      Center(
                        child: Container(
                          width: 50,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pay And Send",
                              style: textTheme(context).bodyMedium?.copyWith(
                                  color: colorScheme(context)
                                      .outline
                                      .withOpacity(0.6), // Contrast color
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BottomCategory(
                                  ontap: () {},
                                  imagePath: AppIcons.telephone,
                                  label: 'To a Phone\nNumber',
                                ),
                                BottomCategory(
                                  ontap: () {
                                    context.pushNamed(AppRoute.payPageTwo);
                                  },
                                  imagePath: AppIcons.bank,
                                  label: 'To a Bank\nAccount',
                                ),
                                BottomCategory(
                                  ontap: () {},
                                  imagePath: AppIcons.barcode,
                                  label: 'Use Code\n',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
