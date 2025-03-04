import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_svg/svg.dart';

class UserviewBottomsheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),
        
        border: Border.all(
          
          color: AppColor.dividerClr, // Grey border color at the top
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Basic Features',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
            ),

           
            SizedBox(
              height: 50,
              width: 50,
              child: Image.asset(
                AppImages.star,
              ),
            ),
            Text(
              'Subscriber',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColor.textGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
            ),

            Text(
              'Others',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlackContainer(
                    text: "Whisper", imagePath: AppIcons.whisper, onTap: () {}),
                const SizedBox(
                  width: 16,
                ),
                BlackContainer(
                    text: "Dislike", imagePath: AppIcons.dislike, onTap: () {}),
                const SizedBox(
                  width: 16,
                ),
                BlackContainer(
                    text: "Setting", imagePath: AppIcons.setting, onTap: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BlackContainer extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;
  final double iconSize;
  final String text;

  const BlackContainer({
    Key? key,
    required this.text,
    required this.imagePath,
    required this.onTap,
    this.iconSize = 28.0, // Default icon size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 52,
          width: 52,
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .onSurface, // Circle background color
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(12),
          child: GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset(
              imagePath, // Use SvgPicture for SVG images
              width: iconSize,
              height: iconSize,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          text,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColor.textGrey,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}
