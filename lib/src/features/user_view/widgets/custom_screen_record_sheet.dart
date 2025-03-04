import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/user_view/widgets/custom_share_sheet.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ScreenRecordSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 222,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        border: Border.all(
          color: AppColor.dividerClr, // Grey border color at the top
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'Screen Recording',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            Divider(
              thickness: 1,
              color: AppColor.dividerClr,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SvgPicture.asset(
                      AppIcons.ss,
                      height: 32.0,
                      width: 32.0,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "ScreenShot",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 70,
                ),
                InkWell(
                  onTap: () {
                        Navigator.pop(context);
                        // new sheet appears
                        showModalBottomSheet(
                    context: context,  
                    builder: (BuildContext context) {
                      return ShareScreenRecordSheet();
                    },
                    isScrollControlled: true,
                  );



                  },
                  child: Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: colorScheme(context).primary, width: 2),
                    ),
                    child: Center(
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorScheme(context).primary,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "click to start 5 to 60 second screen recording!",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: colorScheme(context).outline,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
