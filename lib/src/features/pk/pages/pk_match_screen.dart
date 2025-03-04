import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/pk/clipper/timeclipper.dart';
import 'package:flutter_application_zestilive/src/features/pk/modals/matchmodal.dart';
import 'package:flutter_application_zestilive/src/features/pk/modals/giftsrecievemodel.dart';
import 'package:flutter_application_zestilive/src/features/pk/modals/chatmodal.dart';
import 'package:flutter_application_zestilive/src/features/pk/provider/pk_match_screen_provider.dart';
import 'package:flutter_application_zestilive/src/features/pk/widgets/heart_pop.dart';
import 'package:flutter_application_zestilive/src/features/pk/widgets/right_swipe_container.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/fans_bottom_sheet.dart';
import '../widgets/pkmatch_bottombar.dart';

class PkMatchScreen extends StatefulWidget {
  final int index;
  const PkMatchScreen({super.key, required this.index});

  @override
  State<PkMatchScreen> createState() => PkMatchScreenState();
}

class PkMatchScreenState extends State<PkMatchScreen> {
  late int endTime;

  @override
  void initState() {
    super.initState();
    endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 10;
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<HeartPopWidgetState> heartPopKey =
        GlobalKey<HeartPopWidgetState>();
    final double width = MediaQuery.of(context).size.width;
    final pkMatchProvider = Provider.of<PkMatchProvider>(context, listen: true);
    final matchup = matchups[widget.index];
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: [
            Column(children: [
              SizedBox(
                height: 360,
                child: Stack(
                  children: [
                    Container(
                      height: 100,
                      padding: const EdgeInsets.all(8),
                      width: double.infinity,
                      color: colorScheme(context).primary,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                child: Stack(
                                  children: [
                                    Container(
                                        height: 36,
                                        width: 140,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: AppColor.appYellow,
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const SizedBox(width: 40),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Jeannette King',
                                                    style: textTheme(context)
                                                        .labelSmall
                                                        ?.copyWith(
                                                            letterSpacing: 0,
                                                            fontSize: 10),
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Icon(Icons.person,
                                                          size: 9),
                                                      const SizedBox(
                                                        width: 2,
                                                      ),
                                                      Text(
                                                        'Level 139',
                                                        style: textTheme(
                                                                context)
                                                            .labelSmall
                                                            ?.copyWith(
                                                                letterSpacing:
                                                                    0,
                                                                fontSize: 9),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const Icon(
                                                Icons.add_circle,
                                                size: 18,
                                              ),
                                            ],
                                          ),
                                        )),
                                    CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        foregroundImage: const AssetImage(
                                            AppImages.goldlevel),
                                        radius: 20,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: Image.network(
                                                AppImages.allPopularScreen,
                                                fit: BoxFit.cover,
                                              )),
                                        )),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        foregroundImage: const AssetImage(
                                            AppImages.groupFrameOne),
                                        radius: 17,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: Image.network(
                                                  AppImages.allPopularScreen)),
                                        )),
                                    CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        foregroundImage: const AssetImage(
                                            AppImages.groupFrameTwo),
                                        radius: 17,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: Image.network(
                                                  AppImages.allPopularScreen)),
                                        )),
                                    CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        foregroundImage: const AssetImage(
                                            AppImages.groupFrameThree),
                                        radius: 17,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: Image.network(
                                                  AppImages.allPopularScreen)),
                                        )),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                  padding: const EdgeInsets.all(0),
                                  onPressed: () {
                                    _scaffoldKey.currentState!.openEndDrawer();
                                  },
                                  icon: SvgPicture.asset(AppIcons.eyeIcon)),
                              IconButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () {
                                  GoRouter.of(context).pop();
                                },
                                icon: SvgPicture.asset(AppIcons.closeicon),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return const FansTabbarBottomSheet();
                                    },
                                  );
                                },
                                child: Container(
                                  height: 22,
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: AppColor.appYellow,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SvgPicture.asset(AppIcons.zircon),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        '4523653',
                                        style: textTheme(context)
                                            .labelSmall
                                            ?.copyWith(letterSpacing: 0),
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      const Icon(
                                        Icons.arrow_upward_rounded,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Container(
                                padding: const EdgeInsets.all(4),
                                height: 22,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: AppColor.appYellow,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SvgPicture.asset(AppIcons.starBlue),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      '45 stars',
                                      style: textTheme(context)
                                          .labelSmall
                                          ?.copyWith(letterSpacing: 0),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    //video screens
                    Positioned(
                      top: 100,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        height: 236,
                        child: Row(
                          children: [
                            SizedBox(
                                height: 240,
                                width: width / 2,
                                child: Image.network(
                                  matchup.leftUserImage,
                                  fit: BoxFit.cover,
                                )),
                            SizedBox(
                                height: 240,
                                width: width / 2,
                                child: Image.network(
                                  matchup.rightUserImage,
                                  fit: BoxFit.cover,
                                ))
                          ],
                        ),
                      ),
                    ),
                    //egg slider
                    Positioned(
                      right: 10,
                      top: 70,
                      child: SizedBox(
                        height: 65,
                        width: 43,
                        child: Column(
                          children: [
                            // PageView.builder
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) =>
                                        FansTabbarBottomSheet(),
                                  );
                                },
                                child: PageView.builder(
                                  controller: pkMatchProvider.pageController,
                                  itemCount: 3,
                                  onPageChanged: (index) {
                                    pkMatchProvider.setCurrentPage(index);
                                  },
                                  itemBuilder: (_, index) {
                                    return SizedBox(
                                      height: 60,
                                      width: 42,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            AppImages.eggSlider,
                                            height: 37,
                                            width: 34,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                color: AppColor.tagBlue),
                                            child: Center(
                                              child: Text(
                                                'Lv $index',
                                                style: textTheme(context)
                                                    .labelSmall
                                                    ?.copyWith(
                                                        color:
                                                            colorScheme(context)
                                                                .onPrimary,
                                                        fontSize: 8,
                                                        letterSpacing: 0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            // SmoothPageIndicator
                            SmoothPageIndicator(
                              controller: pkMatchProvider.pageController,
                              count: 3,
                              effect: WormEffect(
                                dotHeight: 6,
                                dotWidth: 6,
                                spacing: 4,
                                activeDotColor: colorScheme(context).surface,
                                dotColor: colorScheme(context)
                                    .surface
                                    .withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //person tag
                    Positioned(
                        left: (width / 2) + 10,
                        top: 120,
                        child: Container(
                          height: 22,
                          width: 80,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: colorScheme(context).surface,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(AppIcons.fireIcon),
                              const SizedBox(
                                width: 3,
                              ),
                              SizedBox(
                                width: 40,
                                child: Text(
                                  'Rocky ashashaus',
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme(context)
                                      .labelSmall
                                      ?.copyWith(letterSpacing: 0),
                                ),
                              ),
                              const Spacer(),
                              const SizedBox(
                                width: 3,
                              ),
                              Icon(
                                Icons.add_circle_rounded,
                                size: 14,
                                color: colorScheme(context).primary,
                              ),
                            ],
                          ),
                        )),
                    // left framed persons
                    Positioned(
                      bottom: 35,
                      left: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                foregroundImage:
                                    const AssetImage(AppImages.groupFrameFive),
                                radius: 17,
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                          AppImages.allPopularScreen)),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                foregroundImage:
                                    const AssetImage(AppImages.groupFrameFour),
                                radius: 17,
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                          AppImages.allPopularScreen)),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                foregroundImage:
                                    const AssetImage(AppImages.groupFrameThree),
                                radius: 17,
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                          AppImages.allPopularScreen)),
                                )),
                          ),
                        ],
                      ),
                    ),
                    //right framed persons
                    Positioned(
                      bottom: 35,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                foregroundImage:
                                    const AssetImage(AppImages.groupFrameTwo),
                                radius: 17,
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                          AppImages.allPopularScreen)),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                foregroundImage:
                                    const AssetImage(AppImages.groupFrameFive),
                                radius: 17,
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                          AppImages.allPopularScreen)),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                foregroundImage:
                                    const AssetImage(AppImages.groupFrameSix),
                                radius: 17,
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                          AppImages.allPopularScreen)),
                                )),
                          ),
                        ],
                      ),
                    ), //timer
                    //time clipper
                    Positioned(
                        left: (width / 2) - 37,
                        bottom: 28,
                        child: ClipPath(
                          clipper: TimerClipper(),
                          child: Container(
                            width: 78,
                            height: 22,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15))),
                            child: Center(
                              child: CountdownTimer(
                                endWidget: Text(
                                  'Time up',
                                  style: textTheme(context).labelSmall,
                                ),
                                endTime: endTime,
                                onEnd: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Time is up!'),
                                      content: const Text(
                                          'The countdown has finished.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            context.pop();
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                textStyle: const TextStyle(
                                    fontSize: 10, color: Colors.red),
                              ),
                            ),
                          ),
                        )),
                    //star counts
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AppIcons.starYellow),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                '${matchup.leftUserVotes.toInt()}',
                                style: textTheme(context)
                                    .labelSmall
                                    ?.copyWith(letterSpacing: 0.25),
                              ),
                            ],
                          ),
                          Container(
                            height: 24,
                            width: 234,
                            decoration: BoxDecoration(
                                color: AppColor.tagBlue,
                                borderRadius: const BorderRadius.vertical(
                                    bottom: Radius.circular(30))),
                            child: Center(
                                child: Text(
                              'Lose punishmnet set by winner',
                              style: textTheme(context).labelSmall?.copyWith(
                                  letterSpacing: 0,
                                  color: colorScheme(context).onPrimary),
                            )),
                          ),
                          Row(
                            children: [
                              Text(
                                '${matchup.rightUserVotes.toInt()}',
                                style: textTheme(context)
                                    .labelSmall
                                    ?.copyWith(letterSpacing: 0.25),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              SvgPicture.asset(AppIcons.starBlue),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //slider indicator
                    Positioned(
                      height: 15,
                      width: width,
                      bottom: 18,
                      child: Consumer<PkMatchProvider>(
                        builder: (context, pkMatchProvider, child) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: (pkMatchProvider.sliderValue * 1000)
                                        .round(),
                                    child: Container(
                                      height: 6,
                                      decoration: BoxDecoration(
                                          color: AppColor.lightgreenslider),
                                    ),
                                  ),
                                  Expanded(
                                    flex: ((1 - pkMatchProvider.sliderValue) *
                                            1000)
                                        .round(),
                                    child: Container(
                                      height: 6,
                                      decoration: BoxDecoration(
                                          color: AppColor.darkgreenslider),
                                    ),
                                  ),
                                ],
                              ),
                              // Slider Thumb
                              Positioned(
                                left:
                                    (width * pkMatchProvider.sliderValue) - 10,
                                child: CircleAvatar(
                                  radius: 6,
                                  backgroundColor: colorScheme(context).surface,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                              // Lottie Animation
                              Positioned(
                                left:
                                    (width * pkMatchProvider.sliderValue) - 30,
                                child: Lottie.asset(
                                  AppAnimations.shineAnimation,
                                  width: 50,
                                  height: 100,
                                  repeat: true,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          color: colorScheme(context).surface,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              SizedBox(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: messages.length,
                                  itemBuilder: (context, index) {
                                    final message = messages[index];
                                    return Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        margin: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            color: message.isSpecialEvent
                                                ? colorScheme(context).primary
                                                : AppColor.surfaceGrey,
                                            borderRadius:
                                                BorderRadius.circular(8)),
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
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 10,
                                                        letterSpacing: 0)),
                                          const SizedBox(width: 2),
                                          Text(message.message,
                                              style: textTheme(context)
                                                  .labelSmall
                                                  ?.copyWith(
                                                      fontSize: 10,
                                                      letterSpacing: 0,
                                                      color: message
                                                              .isSpecialEvent
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .onSurface
                                                              .withOpacity(
                                                                  0.6))),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          if (message.isSpecialEvent)
                                            Icon(
                                              Icons.arrow_forward_ios_rounded,
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
                              Positioned(
                                right: 10,
                                width: 46,
                                child: SizedBox(
                                  child: ListView.builder(
                                    itemCount: giftsRecieved.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: SizedBox(
                                          height: 65,
                                          width: 46,
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                giftsRecieved[index].imagepath,
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    color: AppColor.tagGreen,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Center(
                                                  child: Text(
                                                      giftsRecieved[index].text,
                                                      style: textTheme(context)
                                                          .labelSmall
                                                          ?.copyWith(
                                                              letterSpacing: 0,
                                                              color: colorScheme(
                                                                      context)
                                                                  .onPrimary)),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ]),
            Positioned(
              right: -90,
              bottom: 20,
              child: IgnorePointer(
                child: HeartPopWidget(
                  key: heartPopKey,
                ),
              ),
            ),
          ],
        ),
        endDrawer: const RightSwipeDrawer(),
        bottomNavigationBar: PkMatchBottomBar(
          heartpopkey: heartPopKey,
        ),
      ),
    );
  }
}
