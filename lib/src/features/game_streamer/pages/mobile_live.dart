import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/features/game_streamer/pages/gamer_view.dart';
import 'package:flutter_application_zestilive/src/features/game_streamer/pages/pc_screen_setup.dart';
import 'package:flutter_application_zestilive/src/features/game_streamer/provider/game_steamer_provider.dart';
import 'package:flutter_application_zestilive/src/features/game_streamer/widgets/custom_icon_box.dart';
import 'package:flutter_application_zestilive/src/features/gift_user_view/widget/gift_custom_container.dart';
import 'package:flutter_application_zestilive/src/features/pc_live_userview/pages/pc_steamer_view_page.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MobileLivePage extends StatefulWidget {
  const MobileLivePage({Key? key}) : super(key: key);

  @override
  _MobileLivePageState createState() => _MobileLivePageState();
}

class _MobileLivePageState extends State<MobileLivePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedItem = "Game Live";
  bool isVerticalSelected = true;
  Map<String, String>? selectedGame;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void navigateToGameSelection() async {
    final result = await context.pushNamed<Map<String, String>>(
      AppRoute.selectGamesPage,
    );

    if (result != null) {
      setState(() {
        selectedGame = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameSteamerProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Container(
          width: 134,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColor.dividerClr, width: 1),
          ),
          child: Consumer<GameSteamerProvider>(
            builder: (context, value, child) => TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: AppColor.tagRed,
                borderRadius: BorderRadius.circular(20),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              onTap: (index) {
                value.getTabBarIndex(index);

                // log('Tap Bar indexget :${value.tabBarindex}' as num);
              },
              tabs: [
                Tab(
                  icon: _tabController.index == 0
                      ? Image.asset(
                          AppImages.mblWhite, // White image when selected
                          width: 24,
                          height: 24,
                        )
                      : Image.asset(
                          AppImages.mblGrey, // Grey image when not selected
                          width: 24,
                          height: 24,
                        ),
                ),
                Tab(
                  icon: _tabController.index == 1
                      ? Image.asset(
                          AppImages.pcWhite, // White image when selected
                          width: 24,
                          height: 24,
                        )
                      : Image.asset(
                          AppImages.pcGrey, // Grey image when not selected
                          width: 24,
                          height: 24,
                        ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: AppColor.dividerClr),
                ),
                child: Center(
                  child: Icon(
                    Icons.close,
                    color: AppColor.dividerClr,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Add a title to game",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: AppColor.greyText,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap:
                            navigateToGameSelection, // Ensure the whole area navigates on tap

                        child: SizedBox(
                          height: 40,
                          width: 125,
                          child: AbsorbPointer(
                            child: TextFormField(
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: selectedGame?['name'] ?? 'Categories',
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (selectedGame != null)
                                        Image.asset(
                                          selectedGame!['image']!,
                                          width: 24,
                                          height: 24,
                                        ),
                                      if (selectedGame != null)
                                        const SizedBox(width: 6),
                                      Expanded(
                                        child: Text(
                                          selectedGame?['name'] ?? 'Categories',
                                          style: TextStyle(
                                            color: selectedGame == null
                                                ? Colors.black.withOpacity(0.9)
                                                : Colors.black,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.red,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                                filled: true,
                                fillColor: colorScheme(context).surface,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(thickness: 1, color: Colors.grey),
                      const SizedBox(height: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Share to",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: AppColor.textGrey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          const SizedBox(width: 8),
                          CircleAssetIconButton(
                            imagePath: AppImages.instagrey,
                            onTap: () {},
                          ),
                          const SizedBox(width: 8),
                          CircleAssetIconButton(
                            imagePath: AppImages.fbgrey,
                            onTap: () {},
                          ),
                          const SizedBox(width: 8),
                          CircleAssetIconButton(
                            imagePath: AppImages.whatsapp,
                            onTap: () {},
                          ),
                          const SizedBox(width: 8),
                          CircleAssetIconButton(
                            imagePath: AppImages.moreIcon,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Consumer<GameSteamerProvider>(
                builder: (context, value, child) => value.getTabBatIndex == 1
                    ? Column(
                        children: [
                          GiftCustomContainer(
                            borderRadius: 8,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            color: AppColor.offWhite,
                            width: double.infinity,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: '*',
                                          style: textTheme(context)
                                              .bodySmall
                                              ?.copyWith(
                                                  color: colorScheme(context)
                                                      .primary,
                                                  fontSize: 18)),
                                      TextSpan(
                                          text:
                                              'Visit our website on your pc to \n connect your game ',
                                          style: textTheme(context)
                                              .bodySmall
                                              ?.copyWith(
                                                  color: colorScheme(context)
                                                      .onSurface,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600))
                                    ])),
                                SizedBox(
                                  height: 10,
                                ),
                                GiftCustomContainer(
                                  borderRadius: 50,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  color: colorScheme(context).primary,
                                  child: Text(
                                    'Visit Zesti Live',
                                    style: textTheme(context)
                                        .bodySmall
                                        ?.copyWith(
                                            color:
                                                colorScheme(context).surface),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: [
                                TextSpan(
                                    text: '*',
                                    style: textTheme(context)
                                        .bodySmall
                                        ?.copyWith(
                                            color: colorScheme(context).primary,
                                            fontSize: 18)),
                                TextSpan(
                                    text: 'Don’t close the screen  ',
                                    style: textTheme(context)
                                        .bodySmall
                                        ?.copyWith(
                                            color: colorScheme(context)
                                                .onSurface
                                                .withOpacity(.5),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600))
                              ])),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildOptionCard("Vertical Display",
                              AppImages.verticalTab, isVerticalSelected),
                          const SizedBox(width: 8),
                          buildOptionCard("Horizontal Display",
                              AppImages.horizontalTab, !isVerticalSelected),
                        ],
                      ),
              ),
              SizedBox(
                height: 70,
              ),
              Consumer<GameSteamerProvider>(
                builder: (context, value, child) => CustomButton(
                  backgroundColor: value.getTabBatIndex == 1
                      ? AppColor.appGreen
                      : colorScheme(context).primary,
                  buttonText:
                      value.getTabBatIndex == 1 ? 'Connecting ...' : "Go Live",
                  textColor: value.getTabBatIndex == 1
                      ? colorScheme(context).surface
                      : colorScheme(context).surface,
                  onPressed: () {
                    if (provider.tabBarindex == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GamerViewPage(selectedGame: selectedGame),
                        ),
                      );
                    } else if (provider.tabBarindex == 1) {
                      if (isVerticalSelected) {
                        // If Vertical Display is selected, show "Connecting ..." and go to pzStreamViewPage
                        Future.delayed(Duration(seconds: 1), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PcScreenSetupPage(selectedGame: selectedGame),
                            ),
                          );
                        });
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PcSteamerViewPage(selectedGame: selectedGame),
                          ),
                        );
                      }
                    }
                    provider.SeletedTapBarIndex(provider.tabBarindex);
                  },
                ),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (var item in [
                      "Multi-guest Live",
                      "Live",
                      "Audio Live",
                      "Game Live"
                    ])
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedItem = item;
                          });
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                item,
                                style: TextStyle(
                                  color: selectedItem == item
                                      ? Colors.black
                                      : AppColor.greyText,
                                  fontWeight: selectedItem == item
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            if (selectedItem == item)
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  width: 5,
                                  height: 5,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Modify the onTap logic for your option cards (Vertical and Horizontal)

  Widget buildOptionCard(String title, String imagePath, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isVerticalSelected = title == "Vertical Display";
        });
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            width: 150,
            height: 215,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colorScheme(context).surface,
              border: Border.all(
                color: isSelected ? colorScheme(context).primary : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: Colors.grey[200],
                    border: Border.all(
                      color: isSelected
                          ? colorScheme(context).primary
                          : Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Divider(thickness: 1, color: AppColor.dividerClr),
                const SizedBox(height: 12),
                Text(title),
              ],
            ),
          ),
          if (isSelected)
            Positioned(
              top: 10,
              right: 10,
              child: Icon(Icons.check_circle, color: AppColor.tagRed, size: 20),
            ),
        ],
      ),
    );
  }
}
