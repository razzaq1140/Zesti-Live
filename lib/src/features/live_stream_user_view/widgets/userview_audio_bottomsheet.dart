import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/pk/widgets/heart_pop.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/const/app_colors.dart';
import '../../../common/const/app_images.dart';
import '../../../common/const/global_variables.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../../audio_live/pages/live_audio_chat_expanded/view/custom_stickers.dart';
import '../../pk/widgets/screenshot_bottomsheet.dart';
import '../../single_live_stream/widgets/single_list_icon.dart';

class UserViewAudioBottomSheet extends StatelessWidget {
  const UserViewAudioBottomSheet({
    super.key,
    required this.showChatAndCircles,
    required this.heartpopkey,
  });

  final bool showChatAndCircles;
  final GlobalKey<HeartPopWidgetState> heartpopkey;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: AppColor.surfaceGrey.withOpacity(0.2),
            ),
            onPressed: () {
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
            icon: SvgPicture.asset(AppIcons.iconmessageSinglelivestream)),
        //listicon
        IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: AppColor.surfaceGrey.withOpacity(0.2),
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) {
                  return const SingleListIcons();
                },
              );
            },
            icon: SvgPicture.asset(AppIcons.iconlistSingleLiveStream)),
        IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: AppColor.surfaceGrey.withOpacity(0.2),
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const CaptureModalContent();
                },
              );
            },
            icon: SvgPicture.asset(AppIcons.screenshotSingleLiveStream)),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return const StickerBottomSheet();
              },
            );
          },
          child: SvgPicture.asset(AppIcons.giftSticker),
        ),
        StartAnimationButton(onPressed: () {
          heartpopkey.currentState?.playAnimation();
        }),
        if (showChatAndCircles)
          GestureDetector(onTap: () {}, child: SvgPicture.asset(AppIcons.join))
        else
          GestureDetector(
              onTap: () {}, child: SvgPicture.asset(AppIcons.callbutton))
      ],
    );
  }
}
