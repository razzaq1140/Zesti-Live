import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/features/popular/modal/popular_modal.dart';
import 'package:flutter_application_zestilive/src/features/popular/pages/all_popular_screen.dart';
import 'package:flutter_application_zestilive/src/features/popular/widgets/popular_dialog.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:go_router/go_router.dart';
import '../../../common/const/global_variables.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});
  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        final checkInData = CheckInData(
          checkedInDays: 7,
          gifts: [
            GiftItem(image: AppImages.teddy, count: 5),
            GiftItem(image: AppImages.dollar, count: 3),
          ],
        );

        DialogClass.showCheckInDialog(
          context: context,
          checkInData: checkInData,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<PopularItem> popularItem = [
      PopularItem(
        ontap: () {
          context.pushNamed(AppRoute.liveSellingScreen);
        },
        imageUrl: AppNetworkImages.networkFive,
        title: 'SuperStar',
        views: '1200',
        status: 'Let\'s Join',
      ),
      PopularItem(
        ontap: () {
          context.pushNamed(AppRoute.singleLiveStreamScreen);
        },
        imageUrl: AppNetworkImages.networkFour,
        title: 'SuperStar',
        views: '3400',
        status: 'Let\'s Join',
      ),
      PopularItem(
        ontap: () {
          context.pushNamed(AppRoute.streamuserview);
        },
        imageUrl: AppNetworkImages.networkThirteen,
        title: 'SuperStar',
        views: '2500',
        status: 'Let\'s Join',
      ),
      PopularItem(
        ontap: () {
          context.pushNamed(AppRoute.userViewCommentPage);
        },
        imageUrl: AppNetworkImages.networkSix,
        title: 'SuperStar',
        views: '2500',
        status: 'Let\'s Join',
      ),
      PopularItem(
        ontap: () {
          context.pushNamed(AppRoute.pcUserviewPage);
        },
        imageUrl: AppNetworkImages.networkSeven,
        title: 'Pc Game stream',
        views: '2500',
        status: 'Let\'s Join',
      ),
    ];
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 0,
          automaticallyImplyLeading: false,
          backgroundColor: colorScheme(context).surface,
          title: SizedBox(
            height: 25,
            child: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              dividerHeight: 0,
              indicatorSize: TabBarIndicatorSize.tab,
              // indicator: BoxDecoration(
              //   color: colorScheme(context).onPrimary,
              //   borderRadius: BorderRadius.circular(30),
              // ),
              labelStyle: textTheme(context)
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.w700),
              unselectedLabelStyle: textTheme(context)
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.w400, letterSpacing: 0.25),
              labelColor: colorScheme(context).primary,
              unselectedLabelColor: colorScheme(context).onSurface,
              labelPadding: const EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(0),
              tabs: const [
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: 'Nearby',
                ),
                Tab(
                  text: 'Games',
                ),
                Tab(
                  text: 'Fun Entertainment',
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  AllPopularScreen(popularItems: popularItem),
                  AllPopularScreen(popularItems: popularItem),
                  AllPopularScreen(popularItems: popularItem),
                  AllPopularScreen(popularItems: popularItem),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
