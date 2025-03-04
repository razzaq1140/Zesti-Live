import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/pages/live_audio_chat_expanded/view/custom_users_bottom_sheet.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LiveAudioChatHeader extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const LiveAudioChatHeader({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      color: Colors.transparent,
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Container(
                      height: 36,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: AppColor.surfaceGrey.withOpacity(0.2),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(width: 40),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Jeannette King',
                                  style: textTheme(context)
                                      .labelSmall
                                      ?.copyWith(
                                          letterSpacing: 0,
                                          color: colorScheme(context).onPrimary,
                                          fontSize: 10),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.person,
                                      size: 9,
                                      color: colorScheme(context).onPrimary,
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      '139',
                                      style: textTheme(context)
                                          .labelSmall
                                          ?.copyWith(
                                              color: colorScheme(context)
                                                  .onPrimary,
                                              letterSpacing: 0,
                                              fontSize: 9),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Icon(
                              Icons.add_circle,
                              size: 18,
                              color: AppColor.textGrey,
                            ),
                          ],
                        ),
                      )),
                  CircleAvatar(
                      backgroundColor: Colors.transparent,
                      foregroundImage: const AssetImage(AppImages.goldlevel1),
                      radius: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: const Image(
                                image: AssetImage(AppImages.addTask))),
                      )),
                ],
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return HourlyBottomSheet();
                      },
                    );
                  },
                  icon: SvgPicture.asset(AppIcons.useric)),
              IconButton(
                  onPressed: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                  icon: SvgPicture.asset(AppIcons.eyeIcon)),
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: SvgPicture.asset(AppIcons.closeicon),
              )
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 3,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 22,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: AppColor.surfaceGrey.withOpacity(0.2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(AppIcons.volum),
                      const SizedBox(width: 6),
                      Text(
                        'Eid Mubarak',
                        style: textTheme(context).labelSmall?.copyWith(
                            letterSpacing: 1,
                            wordSpacing: 1,
                            color: colorScheme(context).onPrimary),
                      ),
                      const SizedBox(width: 6),
                      SvgPicture.asset(AppIcons.heart),
                      const SizedBox(width: 6),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InviteBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme(context).onPrimary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Invite",
                style: textTheme(context)
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              )),
          TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text(
                        "Are you sure to disconnect and close this seat? ",
                        style: textTheme(context).bodyMedium,
                      ),
                      actions: [
                        SizedBox(
                          height: 35,
                          child: TextButton(
                            child: Text(
                              "Cancel",
                              style: textTheme(context).bodySmall?.copyWith(
                                  color: colorScheme(context).primary),
                            ),
                            onPressed: () {
                              // Handle action here
                              Navigator.of(context).pop(); // Closes the dialog
                            },
                          ),
                        ),
                        SizedBox(
                          height: 35,
                          child: TextButton(
                            child: Text(
                              "Sure",
                              style: textTheme(context).bodySmall?.copyWith(
                                  color: colorScheme(context).primary),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                "Close",
                style: textTheme(context)
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              )),
          TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(
                "Cancel",
                style: textTheme(context).bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold, color: AppColor.tagRed),
              )),
        ],
      ),
    );
  }
}
