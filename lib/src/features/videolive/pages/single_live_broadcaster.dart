import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_textfield.dart';
import 'package:flutter_application_zestilive/src/features/pk/modals/chatmodal.dart';
import 'package:flutter_application_zestilive/src/features/pk/modals/right_drawer_modal.dart';
import 'package:flutter_application_zestilive/src/features/single_live_stream/provider/single_live_stream_provider.dart';
import 'package:flutter_application_zestilive/src/features/single_live_stream/widgets/carousel_tabbar.dart';
import 'package:flutter_application_zestilive/src/features/single_live_stream/widgets/single_list_icon.dart';
import 'package:flutter_application_zestilive/src/features/videolive/widgets/drawer.dart';
import 'package:flutter_application_zestilive/src/features/videolive/widgets/new_sticker_bottom_sheet.dart';
import 'package:flutter_application_zestilive/src/features/videolive/widgets/waiting_list.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../common/const/global_variables.dart';
import '../../pk/widgets/heart_pop.dart';
import '../../single_live_stream/widgets/multiplevideos.dart';
import '../widgets/singlebroadcaster_header.dart';

class SingleLiveBroadcaster extends StatefulWidget {
  const SingleLiveBroadcaster({super.key});

  @override
  State<SingleLiveBroadcaster> createState() => _SingleLiveBroadcasterState();
}

class _SingleLiveBroadcasterState extends State<SingleLiveBroadcaster> {
  final ValueNotifier<bool> joinedNotifier = ValueNotifier<bool>(false);
  TextEditingController _messageController = TextEditingController();
  late final Future<void> _delayFuture;
  bool showContainer = false;
  bool _hasShownWarning = false;

  @override
  void initState() {
    super.initState();
    _delayFuture = Future.delayed(const Duration(seconds: 10));
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        messages.add(ChatMessage(
          username: "You",
          message: _messageController.text,
          isSpecialEvent: false,
        ));
        _messageController.clear();
      });
    }
  }

  List<ChatMessage> messages = [
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
    final GlobalKey<HeartPopWidgetState> heartPopKey =
        GlobalKey<HeartPopWidgetState>();
    final currentPage = context.watch<SingleLiveStreamProvider>().currentPage;

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
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
                            color: colorScheme(context).surface,
                            child: const SingleLiveMultipleVideos())
                        : Image.network(
                            AppNetworkImages.networkOne,
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
                  SingleBroadcasterHeader(scaffoldKey: scaffoldKey),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                            child: SizedBox(
                                width: double.infinity,
                                child: FutureBuilder(
                                  future: _delayFuture,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                            ConnectionState.waiting &&
                                        !_hasShownWarning) {
                                      return Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                          padding: EdgeInsets.only(left: 10),
                                          width: 250,
                                          child: Text(
                                            "We moderate Live Broadcasts. Smoking, Vulgarity, Porn, indecent exposure, or Any copyright infringement is NOT Allowed and will be banned. Live broadcasts are monitored 24 hours a day. Warning. Third-party Top-UP or Recharge is subject to account closure, suspension, or permanent ban.",
                                            style: textTheme(context)
                                                .bodySmall
                                                ?.copyWith(
                                                  color: colorScheme(context)
                                                      .onPrimary,
                                                ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      if (!_hasShownWarning) {
                                        _hasShownWarning = true;
                                      }
                                      return Stack(children: [
                                        SizedBox(
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: messages.length,
                                            itemBuilder: (context, index) {
                                              final message = messages[index];
                                              return Align(
                                                alignment: Alignment.centerLeft,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  margin:
                                                      const EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                      color: message
                                                              .isSpecialEvent
                                                          ? colorScheme(context)
                                                              .primary
                                                          : AppColor.surfaceGrey
                                                              .withOpacity(0.2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: Wrap(children: [
                                                    SvgPicture.asset(
                                                      message.isSpecialEvent
                                                          ? AppIcons.gift
                                                          : AppIcons.starBlue,
                                                    ),
                                                    const SizedBox(width: 4),
                                                    if (!message.isSpecialEvent)
                                                      Text(message.username,
                                                          style: textTheme(context)
                                                              .labelSmall
                                                              ?.copyWith(
                                                                  color: AppColor
                                                                      .appYellow,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 10,
                                                                  letterSpacing:
                                                                      0)),
                                                    const SizedBox(width: 4),
                                                    Text(
                                                      message.message,
                                                      style: textTheme(context)
                                                          .labelSmall
                                                          ?.copyWith(
                                                              fontSize: 10,
                                                              letterSpacing: 0,
                                                              color: colorScheme(
                                                                      context)
                                                                  .onPrimary),
                                                    ),
                                                    const SizedBox(
                                                      width: 2,
                                                    ),
                                                    if (message.isSpecialEvent)
                                                      Icon(
                                                        Icons
                                                            .arrow_forward_ios_rounded,
                                                        size: 16,
                                                        color:
                                                            colorScheme(context)
                                                                .onPrimary,
                                                      )
                                                  ]),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ]);
                                    }
                                  },
                                ))),
                      ],
                    ),
                  ),
                  SizedBox(
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
                                isScrollControlled: true,
                                builder: (context) {
                                  return const NewStickerBottomSheet();
                                },
                              );
                            },
                            icon: SvgPicture.asset(AppIcons.emoji)),

                        IconButton.filled(
                            style: IconButton.styleFrom(
                              backgroundColor:
                                  AppColor.surfaceGrey.withOpacity(0.2),
                            ),
                            onPressed: () {},
                            icon: SvgPicture.asset(AppIcons.cameraoff)),

                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              heartPopKey.currentState?.playAnimation();
                            },
                            icon:
                                SvgPicture.asset(AppIcons.heartAnimationIcon)),
                        showContainer == true
                            ? GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        actions: [
                                          const SizedBox(height: 20),
                                          Text(
                                            "Are you sure you want to disconnect?",
                                            style:
                                                textTheme(context).bodyMedium,
                                          ),
                                          const SizedBox(height: 30),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GestureDetector(
                                                onTap: () =>
                                                    context.pop(context),
                                                child: Text(
                                                  "cancle",
                                                  style: textTheme(context)
                                                      .bodyMedium
                                                      ?.copyWith(
                                                          color: colorScheme(
                                                                  context)
                                                              .primary),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  context.pop(context);

                                                  context.pushNamed(
                                                      AppRoute.liveEnd);
                                                },
                                                child: Text(
                                                  "Confirm",
                                                  style: textTheme(context)
                                                      .bodySmall
                                                      ?.copyWith(
                                                          color: colorScheme(
                                                                  context)
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
                            : ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 12),
                                    backgroundColor:
                                        AppColor.surfaceGrey.withOpacity(0.2)),
                                icon: SvgPicture.asset(
                                  AppIcons.iconSofaSingleLive,
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return WaitingListsBottom(
                                        onTap: () {
                                          context.pop(context);
                                          setState(() {
                                            showContainer = true;
                                          });
                                        },
                                      );
                                    },
                                  );
                                },
                                label: Text(
                                  'Waiting',
                                  style: textTheme(context)
                                      .labelMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color:
                                              colorScheme(context).onPrimary),
                                ),
                              )
                      ],
                    ),
                  )
                ],
              ),
              showContainer == true
                  ? Positioned(
                      right: 5,
                      bottom: 150,
                      width: 100,
                      child: Container(
                        height: 150,
                        width: 100,
                        color: colorScheme(context).onSurface,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(AppImages.profileDp),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "mrs. beautiful",
                              style: textTheme(context).bodySmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme(context).onPrimary),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Connecting...",
                              style: textTheme(context).bodySmall?.copyWith(
                                  color: colorScheme(context).onPrimary),
                            ),
                            const SizedBox(height: 5),
                            SvgPicture.asset(
                              AppIcons.end,
                              height: 19,
                              width: 19,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Vis1245",
                              style: textTheme(context).bodySmall?.copyWith(
                                  color: colorScheme(context).onPrimary),
                            )
                          ],
                        ),
                      ))
                  : Positioned(
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
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 4),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SvgPicture.asset(AppIcons.fireIcon),
                                        const SizedBox(width: 4),
                                        Text(
                                          rightdrawer[index].profileText,
                                          style: textTheme(context)
                                              .bodySmall
                                              ?.copyWith(
                                                color: colorScheme(context)
                                                    .onPrimary,
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
                  right: 25,
                  bottom: 40,
                  child: HeartPopWidget(
                    key: heartPopKey,
                  ))
            ],
          ),
        )),
        endDrawer: const VideoDrawer(),
      ),
    );
  }
}
