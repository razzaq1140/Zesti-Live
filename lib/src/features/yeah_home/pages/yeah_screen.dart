import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:lottie/lottie.dart';
import '../../../common/const/global_variables.dart';
import '../../../router/go_route.dart';
import '../modals/reels_modal.dart';
import '../providers/following_provider.dart';
import '../providers/for_you_provider.dart';
import '../providers/tab_provider.dart';
import '../tabs/following_tab.dart';
import '../tabs/for_you_tab.dart';
import '../widgets/following_foryou_tabbar.dart';

class YeahScreen extends StatefulWidget {
  const YeahScreen({super.key});

  @override
  YeahScreenState createState() => YeahScreenState();
}

class YeahScreenState extends State<YeahScreen> {
  final PageController _followingPageController = PageController();
  final PageController _forYouPageController = PageController();
  final GlobalKey _pageViewKey = GlobalKey();
  BuildContext? mycontext;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final forYouProvider =
          Provider.of<ForYouProvider>(context, listen: false);
      final followingProvider =
          Provider.of<FollowingProvider>(context, listen: false);
      forYouProvider.loadReels(mockReelsData);
      followingProvider.loadReels(mockReelsData);
      Future.delayed(Duration(milliseconds: 500), () {
        ShowCaseWidget.of(mycontext!).startShowCase([_pageViewKey]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      autoPlay: false,
      autoPlayDelay: const Duration(seconds: 3),
      builder: (context) {
        mycontext = context;
        return Scaffold(
          body: Stack(
            children: [
              Consumer<TabProvider>(
                builder: (context, tabProvider, child) {
                  return tabProvider.selectedIndex == 0
                      ? FollowingPage(pageController: _followingPageController)
                      : ForYouPage(pageController: _forYouPageController);
                },
              ),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  onPressed: () {
                    context.pushNamed(AppRoute.cameraPreviewScreen);
                  },
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    color: colorScheme(context).onPrimary,
                    size: 30,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 20,
                child: Showcase.withWidget(
                    container: Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Center(
                          child: Container(
                            child: Lottie.asset(
                              height: 200,
                              width: 360,
                              AppAnimations.swipeUp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    height: 200,
                    width: double.infinity,
                    key: _pageViewKey,
                    blurValue: 0,
                    disposeOnTap: true,
                    child: const FollowingForYouTabBar()),
              ),
            ],
          ),
        );
      },
    );
  }
}
