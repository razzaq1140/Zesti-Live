import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';

class UsersImages extends StatelessWidget {
  final Widget? stackWidget;
  final Color? borderColor;

  final String image;

  const UsersImages(
      {super.key, this.stackWidget, this.borderColor, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        SizedBox(
          height: 40,
          child: Center(
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: borderColor ?? AppColor.appYellow,
                  ),
                  image: DecorationImage(
                      image: AssetImage(
                        image,
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0, bottom: 8),
          child: CircleAvatar(
            radius: 6,
            backgroundColor: borderColor ?? AppColor.appYellow,
            child: stackWidget ??
                Image.asset(
                  AppImages.gifters,
                  height: 8,
                ),
          ),
        )
      ],
    );
  }
}
