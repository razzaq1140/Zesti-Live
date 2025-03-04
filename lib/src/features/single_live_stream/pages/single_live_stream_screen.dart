import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_textfield.dart';
import 'package:flutter_application_zestilive/src/features/pk/modals/chatmodal.dart';
import 'package:flutter_application_zestilive/src/features/pk/modals/right_drawer_modal.dart';
import 'package:flutter_application_zestilive/src/features/pk/widgets/gift_tabbar_bottomsheet.dart';
import 'package:flutter_application_zestilive/src/features/pk/widgets/screenshot_bottomsheet.dart';
import 'package:flutter_application_zestilive/src/features/single_live_stream/provider/single_live_stream_provider.dart';
import 'package:flutter_application_zestilive/src/features/single_live_stream/widgets/carousel_tabbar.dart';
import 'package:flutter_application_zestilive/src/features/single_live_stream/widgets/recharge_dialog.dart';
import 'package:flutter_application_zestilive/src/features/single_live_stream/widgets/single_list_icon.dart';
import 'package:flutter_application_zestilive/src/features/single_live_stream/widgets/single_live_drawer.dart';
import 'package:flutter_application_zestilive/src/features/single_live_stream/widgets/single_live_stream_header.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../common/const/global_variables.dart';
import '../../pk/widgets/heart_pop.dart';
import '../widgets/multiplevideos.dart';

class SIngleLiveStreamScreen extends StatefulWidget {
  const SIngleLiveStreamScreen({super.key});

  @override
  State<SIngleLiveStreamScreen> createState() => _SIngleLiveStreamScreenState();
}

class _SIngleLiveStreamScreenState extends State<SIngleLiveStreamScreen> {
  final GlobalKey<HeartPopWidgetState> heartPopKey =
      GlobalKey<HeartPopWidgetState>();
  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    Timer(const Duration(seconds: 2), () {
      FirstDialog.show(context);
    });
  }

  final ValueNotifier<bool> joinedNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    joinedNotifier.dispose();
    _messageController.dispose();
    super.dispose();
  }

  TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        message.add(ChatMessage(
          username: "You",
          message: _messageController.text.toString(),
          isSpecialEvent: false,
        ));
        _messageController.clear();
      });
    }
  }

  List<ChatMessage> message = [
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
  @override
  Widget build(BuildContext context) {
    final currentPage = context.watch<SingleLiveStreamProvider>().currentPage;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        body: SizedBox(
            child: Center(
          child: Stack(
            children: [
              ValueListenableBuilder<bool>(
                valueListenable: joinedNotifier,
                builder: (context, joined, child) {
                  return Positioned.fill(
                    child: joined
                        ? Container(
                            color: AppColor.surfaceGrey,
                            child: const SingleLiveMultipleVideos(),
                          )
                        : Image.asset(
                            AppImages.singleLiveScreen,
                            fit: BoxFit.fill,
                          ),
                  );
                },
              ),
              Positioned(
                right: 10,
                top: 50,
                child: SizedBox(
                  height: 65,
                  width: 43,
                  child: Column(
                    children: [
                      Expanded(
                        child: CarouselSlider.builder(
                          itemCount: 3,
                          itemBuilder: (context, index, realIndex) {
                            return SizedBox(
                                width: 42,
                                child: GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return const CarosuelTabBarBottomSheet();
                                        },
                                      );
                                    },
                                    child: Image.asset(
                                        AppImages.singleLiveWheel)));
                          },
                          options: CarouselOptions(
                            height: 50,
                            autoPlay: true,
                            viewportFraction: 1.0,
                            onPageChanged: (index, reason) {
                              context
                                  .read<SingleLiveStreamProvider>()
                                  .setCurrentPage(index);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      SmoothPageIndicator(
                        controller: PageController(initialPage: currentPage),
                        count: 3,
                        effect: WormEffect(
                          dotHeight: 4,
                          dotWidth: 4,
                          spacing: 2,
                          activeDotColor: colorScheme(context).surface,
                          dotColor:
                              colorScheme(context).surface.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  SIngleLiveStreamHeader(scaffoldKey: _scaffoldKey),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: message.length,
                                      itemBuilder: (context, index) {
                                        final messages = message[index];
                                        return Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            padding: const EdgeInsets.all(4),
                                            margin: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                color: messages.isSpecialEvent
                                                    ? colorScheme(context)
                                                        .primary
                                                    : AppColor.surfaceGrey
                                                        .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
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
                                                            color: AppColor
                                                                .appYellow,
                                                            fontWeight:
                                                                FontWeight.w600,
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
                                                            colorScheme(context)
                                                                .onPrimary),
                                              ),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              if (messages.isSpecialEvent)
                                                Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  size: 16,
                                                  color: colorScheme(context)
                                                      .onPrimary,
                                                )
                                            ]),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    height: 60,
                    child: Row(
                      children: [
                        IconButton.filled(
                            style: IconButton.styleFrom(
                              backgroundColor:
                                  AppColor.surfaceGrey.withOpacity(0.2),
                            ),
                            onPressed: () {
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
                                      contentPadding:
                                          const EdgeInsets.symmetric(
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
                            icon: SvgPicture.asset(
                                AppIcons.iconmessageSinglelivestream)),
                        //listicon
                        IconButton.filled(
                            style: IconButton.styleFrom(
                              backgroundColor:
                                  AppColor.surfaceGrey.withOpacity(0.2),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20)),
                                ),
                                builder: (context) {
                                  return const SingleListIcons();
                                },
                              );
                            },
                            icon: SvgPicture.asset(
                                AppIcons.iconlistSingleLiveStream)),
                        IconButton.filled(
                            style: IconButton.styleFrom(
                              backgroundColor:
                                  AppColor.surfaceGrey.withOpacity(0.2),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return const CaptureModalContent();
                                },
                              );
                            },
                            icon: SvgPicture.asset(
                                AppIcons.screenshotSingleLiveStream)),
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) =>
                                      const GiftTabBarBottomSheet());
                            },
                            icon: SvgPicture.asset(AppIcons.giftScreenIcon)),
                        const Spacer(),
                        StartAnimationButton(onPressed: () {
                          heartPopKey.currentState?.playAnimation();
                        }),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 12),
                              backgroundColor:
                                  AppColor.surfaceGrey.withOpacity(0.2)),
                          icon: SvgPicture.asset(
                            AppIcons.iconSofaSingleLive,
                          ),
                          onPressed: () {
                            joinedNotifier.value = !joinedNotifier.value;
                          },
                          label: Text(
                            'Join',
                            style: textTheme(context).labelMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme(context).onPrimary),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                right: 5,
                bottom: 60,
                width: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 30,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: AppColor.surfaceGrey,
                              backgroundImage: const NetworkImage(
                                  AppImages.allPopularScreen),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 100,
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    rightdrawer[index].profileImageUrl),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(AppIcons.fireIcon),
                                  const SizedBox(width: 4),
                                  Text(
                                    rightdrawer[index].profileText,
                                    style: textTheme(context)
                                        .bodySmall
                                        ?.copyWith(
                                          color: colorScheme(context).onPrimary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  right: 10,
                  bottom: 50,
                  child: IgnorePointer(
                    child: HeartPopWidget(
                      key: heartPopKey,
                    ),
                  )),
            ],
          ),
        )),
        endDrawer: const SingleLiveDrawer(),
      ),
    );
  }
}
