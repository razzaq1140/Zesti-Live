import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_textfield.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/pages/live_audio_chat_expanded/model/images_model.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/pages/live_audio_chat_expanded/view/audio_drawer.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/pages/live_audio_chat_expanded/view/custom_bottom_sheet.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/pages/live_audio_chat_expanded/view/custom_header.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/pages/live_audio_chat_expanded/view/custom_stickers.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/pages/live_audio_chat_expanded/view/screen_shot.dart';
import 'package:flutter_application_zestilive/src/features/pk/modals/chatmodal.dart';
import 'package:flutter_application_zestilive/src/features/pk/widgets/heart_pop.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LiveAudioChatExpand extends StatefulWidget {
  const LiveAudioChatExpand({super.key});

  @override
  State<LiveAudioChatExpand> createState() => _LiveAudioChatExpandState();
}

class _LiveAudioChatExpandState extends State<LiveAudioChatExpand> {
  TextEditingController _messageController = TextEditingController();
  bool showChatAndCircles = true; // State to toggle view
  bool isBottomIconClicked = false; // State to toggle the icon
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); // GlobalKey for Scaffold

  List<ChatMessage> Chats = [
    ChatMessage(
        username: "Ramesh", message: "joined the LIVE", isSpecialEvent: true),
    ChatMessage(
        username: "Ankush", message: 'joined the live', isSpecialEvent: false),
    ChatMessage(
        username: "chahat fateh",
        message: "Joined the live",
        isSpecialEvent: false),
    ChatMessage(
        username: "Sumit",
        message: "the boradcaster invites you to join the live",
        isSpecialEvent: true),
  ];
  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        Chats.add(ChatMessage(
          username: "You",
          message: _messageController.text.toString(),
          isSpecialEvent: false,
        ));
        _messageController.clear();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
  }

  final ValueNotifier<bool> joinedNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    joinedNotifier.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<HeartPopWidgetState> heartPopKey =
        GlobalKey<HeartPopWidgetState>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: PageView(
          scrollDirection: Axis.horizontal,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: height,
                  width: width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.audiolivebakground),
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
                      if (showChatAndCircles)
                        SizedBox(
                          child: Column(
                            children: [
                              Wrap(
                                spacing: 10.0,
                                runSpacing: 10.0,
                                children: List.generate(12, (index) {
                                  return SizedBox(
                                    height: height * 0.05,
                                    width: width * 0.08,
                                    child:
                                        SvgPicture.asset(AppIcons.smallCircle),
                                  );
                                }),
                              ),
                              SizedBox(height: height * 0.2),
                            ],
                          ),
                        ),
                      if (!showChatAndCircles)
                        SizedBox(
                            height: height * 0.35,
                            width: width,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 20.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 1.0,
                              ),
                              itemCount: images.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (images[index].isSvg!) {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return const AlertDialog(
                                                title: Text(" Hi there "),
                                                actions: [
                                                  Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                          "Invite any user"))
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
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 20),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      _buildOptionItem(
                                                          context, "Mute"),
                                                      _buildOptionItem(
                                                          context, "Kick Out"),
                                                      _buildOptionItem(context,
                                                          "Set as admin"),
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
                                        height: height * 0.066,
                                        width: width * 0.1,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: images[index].isSvg!
                                              ? null
                                              : DecorationImage(
                                                  image: AssetImage(
                                                      images[index].image!),
                                                  fit: BoxFit.cover,
                                                ),
                                          border:
                                              Border.all(color: Colors.white),
                                        ),
                                        child: images[index].isSvg!
                                            ? Center(
                                                child: SvgPicture.asset(
                                                  images[index].image!,
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
                                      style: textTheme(context)
                                          .bodySmall
                                          ?.copyWith(
                                              color: colorScheme(context)
                                                  .onPrimary),
                                    )
                                  ],
                                );
                              },
                            )),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isBottomIconClicked =
                                  !isBottomIconClicked; // Toggle icon
                              showChatAndCircles =
                                  !showChatAndCircles; // Toggle view
                            });
                          },
                          child: SvgPicture.asset(
                            isBottomIconClicked
                                ? AppIcons.iconTop
                                : AppIcons.bottom,
                          ),
                        ),
                      ),
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
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom,
                                  ),
                                  child: CustomTextFormField(
                                    controller: _messageController,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    fillColor: colorScheme(context).surface,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                          AppIcons.keyboardPrefix),
                                    ),
                                    keyboardType: TextInputType.text,
                                    hint: 'Enter message here',
                                    suffixIcon: IconButton(
                                        onPressed: _sendMessage,
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
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25)),
                              ),
                              isScrollControlled: true,
                              builder: (context) {
                                return WaitingListBottomSheet();
                              },
                            );
                          },
                          child: SvgPicture.asset(AppIcons.list)),
                      SvgPicture.asset(AppIcons.emoji),
                      SvgPicture.asset(AppIcons.mic),
                      SvgPicture.asset(AppIcons.drawing),
                      const SizedBox(width: 10),
                      GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return Container(
                                  padding: const EdgeInsets.all(10),
                                  height: height * 0.34,
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      SizedBox(height: height * 0.05),
                                      Wrap(
                                        spacing: 10,
                                        runSpacing: 10,
                                        children: [
                                          Column(
                                            children: [
                                              SvgPicture.asset(
                                                  AppIcons.document),
                                              SizedBox(height: height * 0.01),
                                              Text(
                                                "Introduction",
                                                style: textTheme(context)
                                                    .bodySmall
                                                    ?.copyWith(
                                                        color:
                                                            AppColor.textGrey),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              SvgPicture.asset(
                                                  AppIcons.atmosphere),
                                              SizedBox(height: height * 0.01),
                                              Text(
                                                "Atmosphere",
                                                style: textTheme(context)
                                                    .bodySmall
                                                    ?.copyWith(
                                                        color:
                                                            AppColor.textGrey),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              GestureDetector(
                                                  onTap: () {
                                                    context.pop(context);
                                                    context.pushNamed(AppRoute
                                                        .musicListSelectall);
                                                  },
                                                  child: SvgPicture.asset(
                                                      AppIcons.music)),
                                              SizedBox(height: height * 0.01),
                                              Text(
                                                "Music",
                                                style: textTheme(context)
                                                    .bodySmall
                                                    ?.copyWith(
                                                        color:
                                                            AppColor.textGrey),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              SvgPicture.asset(
                                                  AppIcons.speakmode),
                                              SizedBox(height: height * 0.01),
                                              Text(
                                                "Speak Mode",
                                                style: textTheme(context)
                                                    .bodySmall
                                                    ?.copyWith(
                                                        color:
                                                            AppColor.textGrey),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              SvgPicture.asset(
                                                  AppIcons.icScreenshot),
                                              SizedBox(height: height * 0.01),
                                              Text(
                                                "Capture",
                                                style: textTheme(context)
                                                    .bodySmall
                                                    ?.copyWith(
                                                        color:
                                                            AppColor.textGrey),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              SvgPicture.asset(AppIcons.share),
                                              SizedBox(height: height * 0.01),
                                              Text(
                                                "Share",
                                                style: textTheme(context)
                                                    .bodySmall
                                                    ?.copyWith(
                                                        color:
                                                            AppColor.textGrey),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: SvgPicture.asset(AppIcons.callbutton)),
                    ],
                  ),
                ),
                if (showChatAndCircles)
                  Positioned(
                    bottom: 80.0,
                    left: 20.0,
                    right: 20.0,
                    child: SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: Chats.length,
                        itemBuilder: (context, index) {
                          final messages = Chats[index];
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              margin: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: messages.isSpecialEvent
                                      ? colorScheme(context).primary
                                      : AppColor.surfaceGrey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Wrap(children: [
                                SvgPicture.asset(
                                  messages.isSpecialEvent
                                      ? AppIcons.gift
                                      : AppIcons.starBlue,
                                ),
                                const SizedBox(width: 4),
                                if (!messages.isSpecialEvent)
                                  Text(messages.username,
                                      style: textTheme(context)
                                          .labelSmall
                                          ?.copyWith(
                                              color: AppColor.appYellow,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10,
                                              letterSpacing: 0)),
                                const SizedBox(width: 4),
                                Text(
                                  messages.message,
                                  style: textTheme(context)
                                      .labelSmall
                                      ?.copyWith(
                                          fontSize: 10,
                                          letterSpacing: 0,
                                          color:
                                              colorScheme(context).onPrimary),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                if (messages.isSpecialEvent)
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 16,
                                    color: colorScheme(context).onPrimary,
                                  )
                              ]),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                if (!showChatAndCircles)
                  Positioned(
                    bottom: 80,
                    left: 20.0,
                    right: 20.0,
                    child: Container(
                      height: 100.0,
                      width: width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Center(
                          child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          Text(
                            "We moderate Live Broadcasts. Smoking,Vulgarity, Porn, indecent exposure or Any copyright infringement is NOT Allowed and will be banned. Live broadcasts are monitored 24 hours a day.Warning. Third party Top-UP or Recharge is subject to account closure, suspension, or permanent ban.",
                            style: textTheme(context).bodySmall?.copyWith(
                                color: colorScheme(context).onPrimary),
                          )
                        ],
                      )),
                    ),
                  ),
              ],
            ),
            Stack(
              children: [
                Container(
                  height: height,
                  width: width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.audiolivebakground),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  width: double.infinity,
                  child: Column(
                    children: [
                      LiveAudioChatHeader(
                          scaffoldKey:
                              _scaffoldKey), // Pass GlobalKey to Header
                      SizedBox(
                        height: height * 0.04,
                      ),

                      SizedBox(
                          height: height * 0.35,
                          width: width,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 20.0,
                              mainAxisSpacing: 10.0,
                              // childAspectRatio: 1.0,
                            ),
                            itemCount: images.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (images[index].isSvg!) {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return const AlertDialog(
                                              title: Text(" Hi there "),
                                              actions: [
                                                Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child:
                                                        Text("Invite any user"))
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 20),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    _buildOptionItem(
                                                        context, "Mute"),
                                                    _buildOptionItem(
                                                        context, "Kick Out"),
                                                    _buildOptionItem(context,
                                                        "Set as admin"),
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
                                      height: height * 0.066,
                                      width: width * 0.1,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: images[index].isSvg!
                                            ? null
                                            : DecorationImage(
                                                image: AssetImage(
                                                    images[index].image!),
                                                fit: BoxFit.cover,
                                              ),
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: images[index].isSvg!
                                          ? Center(
                                              child: SvgPicture.asset(
                                                images[index].image!,
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
                                    style: textTheme(context)
                                        .bodySmall
                                        ?.copyWith(
                                            color:
                                                colorScheme(context).onPrimary),
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
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom,
                                  ),
                                  child: CustomTextFormField(
                                    controller: _messageController,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    fillColor: colorScheme(context).surface,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                          AppIcons.keyboardPrefix),
                                    ),
                                    keyboardType: TextInputType.text,
                                    hint: 'Enter message here',
                                    suffixIcon: IconButton(
                                        onPressed: _sendMessage,
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
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25)),
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
                                return const StickerBottomSheet();
                              },
                            );
                          },
                          child: SvgPicture.asset(AppIcons.giftSticker)),
                      StartAnimationButton(onPressed: () {
                        heartPopKey.currentState?.playAnimation();
                      }),
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
                                            "Cancel",
                                            style: textTheme(context)
                                                .bodyMedium
                                                ?.copyWith(
                                                    color: colorScheme(context)
                                                        .primary),
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
                                                    color: colorScheme(context)
                                                        .primary),
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
                Positioned(
                  right: 30,
                  bottom: 50,
                  child: IgnorePointer(
                    child: HeartPopWidget(
                      key: heartPopKey,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        endDrawer: const AudioLiveDrawer(),
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
