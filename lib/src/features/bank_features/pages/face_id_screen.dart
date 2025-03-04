import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../common/const/app_images.dart';

class FaceIdScreen extends StatelessWidget {
  const FaceIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(10, 10),
                  ),
                ),
                child: Icon(Icons.keyboard_arrow_left),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 120),
              child: Column(
                children: [
                  SvgPicture.asset(
                    AppIcons.faceId,
                    height: 100,
                    width: 100,
                  ),
                  SizedBox(height: 20),
                  Text("Fcae ID",
                      style: TextStyle(
                          fontSize: 27, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("Verify it's You",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500)),
                  SizedBox(height: 20),
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(60, 60)),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Turn your face to the camera",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
