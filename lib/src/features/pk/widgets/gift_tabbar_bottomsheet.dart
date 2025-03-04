import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/pk/provider/pk_match_screen_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Import this package for page control
import '../../../common/const/app_colors.dart';
import '../../../common/const/app_images.dart';
import '../../../common/const/global_variables.dart';
import '../modals/gift_tab_pkmatch_modal.dart';
import '../provider/giftstab_provider.dart';

class GiftTabBarBottomSheet extends StatelessWidget {
  const GiftTabBarBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.surfaceGrey,
        body: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ButtonsTabBar(
                contentCenter: true,
                width: 100,
                unselectedLabelStyle: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: colorScheme(context).onSurface.withOpacity(0.5)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                labelStyle: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: colorScheme(context).primary),
                radius: 0,
                borderWidth: 0.5,
                backgroundColor: AppColor.surfaceGrey,
                unselectedBackgroundColor: AppColor.surfaceGrey,
                borderColor: Colors.transparent,
                unselectedBorderColor:
                    colorScheme(context).outline.withOpacity(0.2),
                buttonMargin: EdgeInsets.only(left: 20),
                tabs: const [
                  Tab(
                      icon: Icon(
                        Icons.card_giftcard,
                        size: 14,
                      ),
                      text: 'Gift'),
                  Tab(
                      icon: Icon(
                        Icons.luggage,
                        size: 14,
                      ),
                      text: 'Baggage'),
                  // Tab(
                  //     icon: Icon(
                  //       Icons.star_border_purple500_sharp,
                  //       size: 14,
                  //     ),
                  //     text: 'Tools'),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    GiftsTabPkMatch(),
                    BaggageTabPkMatch(),
                    // ToolsTabPkMatch()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GiftsTabPkMatch extends StatefulWidget {
  const GiftsTabPkMatch({super.key});

  @override
  State<GiftsTabPkMatch> createState() => _GiftsTabPkMatchState();
}

class _GiftsTabPkMatchState extends State<GiftsTabPkMatch> {
  @override
  Widget build(BuildContext context) {
    final int itemsPerPage = 8;

    final int pageCount = (giftTabItem.length / itemsPerPage).ceil();

    return ChangeNotifierProvider(
      create: (_) => GiftTabProvider(),
      child: Consumer<GiftTabProvider>(
        builder: (context, giftTabProvider, child) {
          return Column(
            children: [
              const SizedBox(height: 12),
              Expanded(
                child: PageView.builder(
                  controller: giftTabProvider.pageController,
                  // controller: 3,
                  itemCount: pageCount,
                  itemBuilder: (context, pageIndex) {
                    final List<GiftTabItem> currentPageItems = giftTabItem
                        .skip(pageIndex * itemsPerPage)
                        .take(itemsPerPage)
                        .toList();

                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, childAspectRatio: 0.84),
                      itemCount: currentPageItems.length,
                      // itemCount: 3,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 0,
                          color: colorScheme(context).surface,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                        currentPageItems[index].topIcon),
                                  ),
                                ],
                              ),
                              Image.asset(
                                height: 30,
                                width: 30,
                                currentPageItems[index].imagePath,
                              ),
                              Text(
                                currentPageItems[index].title,
                                style: textTheme(context).labelSmall?.copyWith(
                                    letterSpacing: 0,
                                    color: colorScheme(context)
                                        .onSurface
                                        .withOpacity(0.5)),
                              ),
                              const SizedBox(height: 4),
                              Wrap(
                                children: [
                                  SvgPicture.asset(
                                      currentPageItems[index].bottomIcon),
                                  const SizedBox(width: 4),
                                  Text(
                                    currentPageItems[index].bottomCount,
                                    style: textTheme(context)
                                        .labelSmall
                                        ?.copyWith(fontSize: 10),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              SmoothPageIndicator(
                controller: giftTabProvider.pageController,
                count: pageCount,
                effect: WormEffect(
                  activeDotColor: colorScheme(context).primary,
                  dotColor: colorScheme(context).onSurface.withOpacity(0.5),
                  dotHeight: 8,
                  dotWidth: 8,
                ),
              ),
              const SizedBox(height: 6),
              // Bottom Widgets
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: colorScheme(context).surface),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppIcons.ruby),
                          const SizedBox(width: 4),
                          Text(
                            '3',
                            style: textTheme(context).labelMedium,
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                            color: colorScheme(context).primary,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 34,
                      decoration: BoxDecoration(
                          color: colorScheme(context).primary,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(2),
                            width: 40,
                            decoration: BoxDecoration(
                                color: colorScheme(context).onPrimary,
                                borderRadius: BorderRadius.circular(30)),
                            child: DropdownButton<int>(
                              padding: const EdgeInsets.all(8),
                              iconSize: 15,
                              alignment: Alignment.center,
                              value: Provider.of<PkMatchProvider>(context,
                                      listen: false)
                                  .dropdownValue,
                              icon: Icon(Icons.keyboard_arrow_down_rounded,
                                  color: colorScheme(context).onSurface),
                              dropdownColor: Colors.redAccent,
                              elevation: 0,
                              style: TextStyle(
                                  color: colorScheme(context).onSurface),
                              underline: Container(),
                              onChanged: (int? newValue) {
                                if (newValue != null) {
                                  Provider.of<PkMatchProvider>(context,
                                          listen: false)
                                      .setDropdownValue(newValue);
                                }
                              },
                              items: <int>[1, 2, 3, 4, 5]
                                  .map<DropdownMenuItem<int>>((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(value.toString()),
                                  onTap: (){
                                    setState(() {

                                    });
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: colorScheme(context).primary,
                                borderRadius: BorderRadius.circular(
                                    25), // Rounded corners
                              ),
                              child: Text(
                                'SEND',
                                style: textTheme(context).labelLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          );
        },
      ),
    );
  }
}

class BaggageTabPkMatch extends StatefulWidget {
  const BaggageTabPkMatch({super.key});

  @override
  State<BaggageTabPkMatch> createState() => _BaggageTabPkMatchState();
}

class _BaggageTabPkMatchState extends State<BaggageTabPkMatch> {
  @override
  Widget build(BuildContext context) {
    final int itemsPerPage = 8;

    final int pageCount = (giftTabItem.length / itemsPerPage).ceil();

    return ChangeNotifierProvider(
      create: (_) => GiftTabProvider(),
      child: Consumer<GiftTabProvider>(
        builder: (context, giftTabProvider, child) {
          return Column(
            children: [
              const SizedBox(height: 12),
              Expanded(
                child: PageView.builder(
                  controller: giftTabProvider.pageController,
                  // controller: 3,
                  itemCount: pageCount,
                  itemBuilder: (context, pageIndex) {
                    final List<GiftTabItem> currentPageItems = giftTabItem
                        .skip(pageIndex * itemsPerPage)
                        .take(itemsPerPage)
                        .toList();

                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, childAspectRatio: 0.84),
                      itemCount: currentPageItems.length,
                      // itemCount: 3,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 0,
                          color: colorScheme(context).surface,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                        currentPageItems[index].topIcon),
                                  ),
                                ],
                              ),
                              Image.asset(
                                height: 30,
                                width: 30,
                                currentPageItems[index].imagePath,
                              ),
                              Text(
                                currentPageItems[index].title,
                                style: textTheme(context).labelSmall?.copyWith(
                                    letterSpacing: 0,
                                    color: colorScheme(context)
                                        .onSurface
                                        .withOpacity(0.5)),
                              ),
                              const SizedBox(height: 4),
                              Wrap(
                                children: [
                                  SvgPicture.asset(
                                      currentPageItems[index].bottomIcon),
                                  const SizedBox(width: 4),
                                  // Text(
                                  //   currentPageItems[index].bottomCount,
                                  //   style: textTheme(context)
                                  //       .labelSmall
                                  //       ?.copyWith(fontSize: 10),
                                  // )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              SmoothPageIndicator(
                controller: giftTabProvider.pageController,
                count: pageCount,
                effect: WormEffect(
                  activeDotColor: colorScheme(context).primary,
                  dotColor: colorScheme(context).onSurface.withOpacity(0.5),
                  dotHeight: 8,
                  dotWidth: 8,
                ),
              ),
              const SizedBox(height: 6),
              // Bottom Widgets
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: colorScheme(context).surface),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppIcons.ruby),
                          const SizedBox(width: 4),
                          Text(
                            '3',
                            style: textTheme(context).labelMedium,
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                            color: colorScheme(context).primary,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 34,
                      decoration: BoxDecoration(
                          color: colorScheme(context).primary,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(2),
                            width: 40,
                            decoration: BoxDecoration(
                                color: colorScheme(context).onPrimary,
                                borderRadius: BorderRadius.circular(30)),
                            child: DropdownButton<int>(
                              padding: const EdgeInsets.all(8),
                              iconSize: 15,
                              alignment: Alignment.center,
                              value: Provider.of<PkMatchProvider>(context,
                                  listen: false)
                                  .dropdownValue,
                              icon: Icon(Icons.keyboard_arrow_down_rounded,
                                  color: colorScheme(context).onSurface),
                              dropdownColor: Colors.redAccent,
                              elevation: 0,
                              style: TextStyle(
                                  color: colorScheme(context).onSurface),
                              underline: Container(),
                              onChanged: (int? newValue) {
                                if (newValue != null) {
                                  Provider.of<PkMatchProvider>(context,
                                      listen: false)
                                      .setDropdownValue(newValue);
                                }
                              },
                              items: <int>[1, 2, 3, 4, 5]
                                  .map<DropdownMenuItem<int>>((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(value.toString()),
                                  onTap: (){
                                    setState(() {

                                    });
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: colorScheme(context).primary,
                                borderRadius: BorderRadius.circular(
                                    25), // Rounded corners
                              ),
                              child: Text(
                                'SEND',
                                style: textTheme(context).labelLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          );
        },
      ),
    );
  }
}

// class ToolsTabPkMatch extends StatelessWidget {
//   const ToolsTabPkMatch({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.surfaceGrey,
//       body: Center(
//         child: Image.asset(AppImages.emptyTool,height: 159,),
//       ),
//     );
//   }
// }
