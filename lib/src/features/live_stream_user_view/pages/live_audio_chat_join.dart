import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_textfield.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/pages/live_audio_chat_expanded/view/custom_bottom_sheet.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/pages/live_audio_chat_expanded/view/custom_header.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/pages/live_audio_chat_expanded/view/screen_shot.dart';
import 'package:flutter_application_zestilive/src/features/live_stream_user_view/widgets/sticker_sheet.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../pk/widgets/heart_pop.dart';
import '../models/images_model.dart';

class LiveAudioChatJoin extends StatefulWidget {
  const LiveAudioChatJoin({super.key});

  @override
  State<LiveAudioChatJoin> createState() => _LiveAudioChatJoinState();
}

class _LiveAudioChatJoinState extends State<LiveAudioChatJoin> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.userViewBackground),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            width: double.infinity,
            child: Column(
              children: [
                LiveAudioChatHeader(scaffoldKey: _scaffoldKey),
                SizedBox(
                  height: height * 0.04,
                ),
                SizedBox(
                    height: height * 0.3,
                    width: width,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 30.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: userimages.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (userimages[index].isSvg!) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const AlertDialog(
                                        title: Text(" Hi there "),
                                        actions: [
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Text("Invite any user"))
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              _buildOptionItem(context, "Mute"),
                                              _buildOptionItem(
                                                  context, "Kick Out"),
                                              _buildOptionItem(
                                                  context, "Set as admin"),
                                              _buildOptionItem(
                                                  context, "Report"),
                                              _buildOptionItem(
                                                  context, "Cancel",
                                                  isCancel: true),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                              child: Container(
                                height: height * 0.07,
                                width: width * 0.1,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: userimages[index].isSvg!
                                      ? null
                                      : DecorationImage(
                                          image: AssetImage(
                                              userimages[index].image!),
                                          fit: BoxFit.cover,
                                        ),
                                  border: Border.all(color: Colors.white),
                                ),
                                child: userimages[index].isSvg!
                                    ? Center(
                                        child: SvgPicture.asset(
                                          userimages[index].image!,
                                          height: 10,
                                          width: 10,
                                          fit: BoxFit.contain,
                                        ),
                                      )
                                    : null, // Show SVG image if it's an SVG
                              ),
                            ),
                            Text(
                              "${index + 1}",
                              style: textTheme(context).bodySmall?.copyWith(
                                  color: colorScheme(context).onPrimary),
                            )
                          ],
                        );
                      },
                    )),
              ],
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 20.0,
            right: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
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
                                child:
                                    SvgPicture.asset(AppIcons.keyboardPrefix),
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
                    child: SvgPicture.asset(AppIcons.chatting)),
                GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(25)),
                        ),
                        isScrollControlled: true,
                        builder: (context) {
                          return WaitingListBottomSheet();
                        },
                      );
                    },
                    child: SvgPicture.asset(AppIcons.list)),
                GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const ScreenShotContent();
                        },
                      );
                    },
                    child: SvgPicture.asset(AppIcons.screenshot1)),
                GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return StickerSheet();
                        },
                      );
                    },
                    child: SvgPicture.asset(AppIcons.giftSticker)),
                GestureDetector(
                    onTap: () {
                     
                    },
                    child: SvgPicture.asset(AppIcons.love1)),
                GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            actions: [
                              const SizedBox(height: 20),
                              Text(
                                "Are you sure you want to disconnect?",
                                style: textTheme(context).bodyMedium,
                              ),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () => context.pop(context),
                                    child: Text(
                                      "cancle",
                                      style: textTheme(context)
                                          .bodyMedium
                                          ?.copyWith(
                                              color:
                                                  colorScheme(context).primary),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context.pop(context);

                                      context.pushNamed(AppRoute.liveEnd);
                                    },
                                    child: Text(
                                      "Confirm",
                                      style: textTheme(context)
                                          .bodySmall
                                          ?.copyWith(
                                              color:
                                                  colorScheme(context).primary),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: SvgPicture.asset(AppIcons.callend))
              ],
            ),
          ),
          const Positioned(right: 25, bottom: 50, child: HeartPopWidget())
        ],
      ),
    );
  }
}

Widget _buildOptionItem(BuildContext context, String text,
    {bool isCancel = false}) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pop();
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Text(text, style: textTheme(context).bodyMedium),
    ),
  );
}
