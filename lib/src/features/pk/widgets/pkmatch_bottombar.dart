import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/pk/widgets/heart_pop.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../common/const/app_colors.dart';
import '../../../common/const/app_images.dart';
import '../../../common/const/global_variables.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../../../router/go_route.dart';
import '../../yeah_home/providers/share_provider.dart';
import 'gift_tabbar_bottomsheet.dart';
import 'screenshot_bottomsheet.dart';

class PkMatchBottomBar extends StatelessWidget {
  final GlobalKey<HeartPopWidgetState> heartpopkey;
  const PkMatchBottomBar({
    super.key,
    required this.heartpopkey,
  });

  @override
  Widget build(BuildContext context) {
    const videoUrl = "https://youtu.be/VYUPMFu4fR8";

    return BottomAppBar(
      height: 70,
      padding: const EdgeInsets.all(4),
      child: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 85,
              height: 36,
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: CustomTextFormField(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          fillColor: colorScheme(context).surface,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(AppIcons.keyboardPrefix),
                          ),
                          keyboardType: TextInputType.text,
                          hint: 'Enter message here',
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.send_rounded,
                                color: AppColor.surfaceGrey,
                              )),
                        ),
                      );
                    },
                  );
                },
                child: AbsorbPointer(
                  child: CustomTextFormField(
                    readOnly: true,
                    borderColor: colorScheme(context).outline.withOpacity(0.2),
                    borderRadius: 18,
                    hint: 'Say Hi to everyone',
                    filled: false,
                    hintColor: AppColor.textGrey,
                    hintSize: 13,
                  ),
                ),
              ),
            ),
            IconButton.outlined(
              style: IconButton.styleFrom(
                  side: BorderSide(
                      color: colorScheme(context).outline.withOpacity(0.2))),
              onPressed: () {
                context.pushNamed(AppRoute.chatScreen);
              },
              icon: SvgPicture.asset(
                AppIcons.chat,
              ),
            ),
            Consumer<ShareProvider>(
              builder: (context, shareProvider, child) {
                return IconButton.outlined(
                  style: IconButton.styleFrom(
                      side: BorderSide(
                          color:
                              colorScheme(context).outline.withOpacity(0.2))),
                  onPressed: () {
                    shareProvider.shareVideo(videoUrl);
                  },
                  icon: SvgPicture.asset(
                    AppIcons.shareMatchIcon,
                  ),
                );
              },
            ),
            IconButton.outlined(
              style: IconButton.styleFrom(
                  side: BorderSide(
                      color: colorScheme(context).outline.withOpacity(0.2))),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const CaptureModalContent();
                  },
                );
              },
              icon: SvgPicture.asset(
                AppIcons.screenshot,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return const GiftTabBarBottomSheet();
                  },
                );
              },
              icon: SvgPicture.asset(AppIcons.giftScreenIcon),
            ),
            StartAnimationButton(onPressed: () {
              heartpopkey.currentState?.playAnimation();
            })
          ],
        ),
      ),
    );
  }
}
