import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import '../../../common/const/app_images.dart';
import '../../../common/const/global_variables.dart';
import '../modal/popular_modal.dart';

class DialogClass {
  static Future<void> showCustomDialog({
    required BuildContext context,
    required Widget content,
    double borderRadius = 20.0,
    bool isDismissible = true,
    Widget? topImage,
    double dialogWidth = 300,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: SizedBox(
            width: dialogWidth,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: content,
                ),
                if (topImage != null)
                  Positioned(
                    top: -30,
                    child: topImage,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<void> showCheckInDialog({
    required BuildContext context,
    required CheckInData checkInData,
    double dialogWidth = 300,
  }) {
    return showCustomDialog(
      context: context,
      topImage: Image.asset(AppImages.ribon),
      dialogWidth: dialogWidth,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              showGiftDialog(context: context, checkInData: checkInData);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                AppImages.wheel,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'You have checked in ${checkInData.checkedInDays} days',
            textAlign: TextAlign.center,
            style: textTheme(context).titleSmall,
          ),
          const SizedBox(height: 10),
          Text(
            'Aristocrat user enjoy more check-in rewards',
            textAlign: TextAlign.center,
            style: textTheme(context)
                .bodySmall
                ?.copyWith(color: AppColor.textGrey),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  static Future<void> showGiftDialog({
    required BuildContext context,
    required CheckInData checkInData,
    double dialogWidth = 300,
  }) {
    return showCustomDialog(
      context: context,
      topImage: Image.asset(AppImages.ribon),
      dialogWidth: dialogWidth,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Text(
            "Congrats",
            style: textTheme(context).titleSmall?.copyWith(
                color: colorScheme(context).onSurface,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 30),
          Center(
            child: SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: checkInData.gifts.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final gift = checkInData.gifts[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Image.asset(
                          gift.image,
                          height: 50,
                          width: 50,
                        ),
                        const SizedBox(height: 10),
                        Text('x${gift.count}'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme(context).primary),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Submit',
              style: textTheme(context)
                  .labelLarge
                  ?.copyWith(color: colorScheme(context).onPrimary),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Flying gifts/comments will be put in your cart',
            textAlign: TextAlign.center,
            style: textTheme(context).bodySmall?.copyWith(
                  color: Colors.grey,
                ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
