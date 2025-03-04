import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_textfield.dart';
import 'package:flutter_application_zestilive/src/features/youtube_bottom_sheet/provider/youtube_sheet_provider.dart';

import 'package:flutter_application_zestilive/src/features/features_multiguest/page/multi_guest_live/provider/profile_bottom_sheet_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../../common/const/app_colors.dart';
import '../../../../../../common/const/app_images.dart';
import '../../../../../../common/const/global_variables.dart';
import '../../../../../../router/go_route.dart';
import '../../../../../gift_user_view/model/gift_model.dart';
import '../../../../../gift_user_view/provider/gift_user_provider.dart';
import '../../../../../gift_user_view/widget/gift_custom_container.dart';
import '../../../../../gift_user_view/widget/gift_level_progress_indicator_.dart';
import '../../../../../gift_user_view/widget/user_container.dart';
import '../../../../../../router/go_route.dart';
import '../../provider/profile_bottom_sheet_provider.dart';
import '../dialogue/multiguest_dialogue.dart';

void profileBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
    ),
    builder: (BuildContext context) {
      return Consumer<ProfileBottomSheetProvider>(
        builder: (context, bottomSheetState, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: colorScheme(context).primary,
                      child: const CircleAvatar(
                        radius: 22,
                        backgroundImage: NetworkImage(
                          'https://randomuser.me/api/portraits/women/45.jpg',
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      "Anglica",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.deleteIcon,
                          height: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Kickout",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: colorScheme(context).primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Gift Icon
                    GestureDetector(
                      onTap: () {
                        showgiftBottomSheet(context);
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundColor: colorScheme(context).onSurface,
                            child: SvgPicture.asset(AppIcons.bottomGift,
                                height: 26),
                          ),
                          const SizedBox(height: 10),
                          const Text("Gift",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: bottomSheetState
                              .toggleMic, // Toggle microphone on click
                          child: CircleAvatar(
                            radius: 28,
                            backgroundColor: colorScheme(context).onSurface,
                            child: Icon(
                              bottomSheetState.isMicOn
                                  ? Icons.mic
                                  : Icons.mic_off_rounded,
                              size: 26,
                              color: colorScheme(context).surface,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text("Microphone",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    // Camera Icon with toggle functionality
                    Column(
                      children: [
                        GestureDetector(
                          onTap: bottomSheetState.toggleCamera,
                          child: CircleAvatar(
                            radius: 28,
                            backgroundColor: colorScheme(context).onSurface,
                            child: Icon(
                              bottomSheetState.isCameraOn
                                  ? Icons.camera_alt_outlined
                                  : Icons.no_photography_outlined,
                              size: 26,
                              color: colorScheme(context).surface,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text("Camera",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500)),
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
  );
}

void boostBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                const Center(
                  child: Text(
                    "Boost",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Divider(color: Colors.grey.withOpacity(0.1)),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(249, 192, 52, 0.6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      "Join my live!",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -14,
                  left: -20,
                  child: Transform.rotate(
                    angle: -0.1,
                    child: Image.asset(
                      AppImages.joinLiveSpeaker,
                      // 'assets/images/join_live_speaker.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            CustomButton(
              buttonText: 'Send',
              onPressed: () {},
              width: double.infinity,
              height: 60,
            )
          ],
        ),
      );
    },
  );
}

void showSubscriberBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Added scrollable view
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: Text(
                  "Subscriber",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(color: colorScheme(context).outline.withOpacity(0.5)),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(
                                'https://randomuser.me/api/portraits/men/75.jpg'),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "🐱 LLOUISE DNLO 🐱",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: colorScheme(context)
                                      .outline
                                      .withOpacity(0.08),
                                ),
                                child: const Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(2),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Subscriber 2',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.purpleAccent,
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Colors.purpleAccent,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(
                        "Welcome my dear subscribers.",
                        style: TextStyle(
                            fontSize: 12,
                            color:
                                colorScheme(context).outline.withOpacity(0.6)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Text(
                    "Estimated Revenue: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(width: 4),
                  Text(
                    "\$75",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Column(
                        children: [
                          Text(
                            "0",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text("Today"),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: colorScheme(context).primary,
                      thickness: 2,
                    ),
                    const Expanded(
                      child: Column(
                        children: [
                          Text(
                            "25",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text("Subscribers"),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: colorScheme(context).primary,
                      thickness: 2,
                    ),
                    const Expanded(
                      child: Column(
                        children: [
                          Text(
                            "30",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text("Expired"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Divider(
                  color: colorScheme(context).outline.withOpacity(0.6),
                  thickness: 10),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subscriber Announcement",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "50/200",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Thanks for subscribing and enjoy yourself here!',
                  hintStyle: const TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                maxLines: 3,
              ),
            ],
          ),
        ),
      );
    },
  );
}

// void showSubscriberBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Center(
//               child: Text(
//                 "Subscriber",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Divider(color: colorScheme(context).outline.withOpacity(0.5)),
//             const SizedBox(height: 8),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.amber),
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         const CircleAvatar(
//                           radius: 35,
//                           backgroundImage: NetworkImage(
//                               'https://randomuser.me/api/portraits/men/75.jpg'),
//                         ),
//                         const SizedBox(width: 12),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               "🐱 LLOUISE DNLO 🐱",
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.bold),
//                             ),
//                             const SizedBox(height: 5),
//                             Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(3),
//                                 color: colorScheme(context)
//                                     .outline
//                                     .withOpacity(0.08),
//                               ),
//                               child: const Row(
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsets.all(2),
//                                     child: Row(
//                                       children: [
//                                         Text(
//                                           'Subscriber 2',
//                                           style: TextStyle(
//                                             fontSize: 12,
//                                             color: Colors.purpleAccent,
//                                           ),
//                                         ),
//                                         SizedBox(width: 5),
//                                         Icon(
//                                           Icons.keyboard_arrow_right,
//                                           color: Colors.purpleAccent,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 3),
//                     Text(
//                       "Welcome my dear subscribers.",
//                       style: TextStyle(
//                           fontSize: 12,
//                           color: colorScheme(context).outline.withOpacity(0.6)),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             const Row(
//               children: [
//                 Text(
//                   "Estimated Revenue: ",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 SizedBox(width: 4),
//                 Text(
//                   "\$75",
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.red,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Spacer(),
//                 Icon(
//                   Icons.arrow_forward_ios,
//                   size: 18,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             IntrinsicHeight(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Expanded widgets to evenly space the columns
//                   const Expanded(
//                     child: Column(
//                       children: [
//                         Text(
//                           "0",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w800,
//                           ),
//                         ),
//                         Text("Today"),
//                       ],
//                     ),
//                   ),
//                   VerticalDivider(
//                     color: colorScheme(context).primary,
//                     thickness: 2,
//                   ),
//                   const Expanded(
//                     child: Column(
//                       children: [
//                         Text(
//                           "25",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w800,
//                           ),
//                         ),
//                         Text("Subscribers"),
//                       ],
//                     ),
//                   ),
//                   VerticalDivider(
//                     color: colorScheme(context).primary,
//                     thickness: 2,
//                   ),
//                   const Expanded(
//                     child: Column(
//                       children: [
//                         Text(
//                           "30",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w800,
//                           ),
//                         ),
//                         Text("Expired"),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),
//             Divider(
//                 color: colorScheme(context).outline.withOpacity(0.6),
//                 thickness: 10),
//             const SizedBox(height: 10),
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Subscriber Announcement",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 16,
//                   ),
//                 ),
//                 Text(
//                   "50/200",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),

//             TextField(
//               readOnly: true,
//               decoration: InputDecoration(
//                 hintText: 'Thanks for subscribing and enjoy yourself here!',
//                 hintStyle: const TextStyle(fontSize: 14),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               maxLines: 2,
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }

void showgiftBottomSheet(BuildContext context) {
  var m = MediaQuery.of(context).size;

  showModalBottomSheet(
    context: context,
    builder: (context) => Consumer<GiftUserProvider>(
      builder: (context, value, child) => Container(
        width: m.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        value.toggleButton();
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: 50,
                        // padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            AnimatedPositioned(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              left: value.isActive ? 25 : 0,
                              child: value.isActive
                                  ? Icon(
                                      Icons.circle,
                                      color: AppColor.giftGreyColor,
                                    )
                                  : Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      // width: 45,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: value.isActive
                                            ? Colors.transparent
                                            : Color(0xFFE93E4F),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                        child: Text(value.isActive ? "" : "All",
                                            style: textTheme(context)
                                                .bodySmall
                                                ?.copyWith(
                                                    color: colorScheme(context)
                                                        .surface,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  UsersImages(image: AppImages.onboardFirstfour),
                  SizedBox(
                    width: 10,
                  ),
                  GiftCustomContainer(
                    height: 25,
                    width: 2,
                    color: AppColor.appYellow,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  UsersImages(
                    image: AppImages.onboardFirstone,
                    borderColor: AppColor.giftGreyColor,
                    stackWidget: Center(
                      child: Text('2',
                          style: textTheme(context).bodySmall?.copyWith(
                              fontSize: 8,
                              color: colorScheme(context).onSurface,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: colorScheme(context).primary,
                    width: m.width * 0.7,
                    height: 10,
                    child: GiftProgressIndicator(),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    child: CircleAvatar(
                      backgroundColor: colorScheme(context).surface,
                      child: Image.asset(
                        AppImages.bahasa,
                        height: 23,
                      ),
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: AppColor.appYellow, width: 1.5)),
                  )
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: SizedBox(
                    width: m.width * 0.75,
                    child: Row(
                      children: [
                        SizedBox(
                          width: m.width * .05,
                        ),
                        Text('Lv.1',
                            style: textTheme(context).bodySmall?.copyWith(
                                fontSize: 10, color: AppColor.greyText)),
                        Spacer(),
                        Text('EXP',
                            style: textTheme(context).bodySmall?.copyWith(
                                fontSize: 10, color: AppColor.greyText)),
                        SizedBox(
                          width: 10,
                        ),
                        Text('3350/5000',
                            style: textTheme(context).bodySmall?.copyWith(
                                fontSize: 10, color: AppColor.greyText))
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                // height: m.height * 0.4,
                // width: m.width * 0.9,
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      // Wrap TabBar with Align or Container to provide a bounded width
                      Align(
                          alignment: Alignment.topCenter,
                          child: Consumer<GiftUserProvider>(
                              builder: (context, tabIndexProvider, _) => TabBar(
                                  physics: NeverScrollableScrollPhysics(),
                                  tabs: [
                                    Tab(
                                      child: Text(
                                        'All Gifts',
                                        style: TextStyle(
                                            color:
                                                colorScheme(context).onSurface,
                                            fontSize: value.selectedIndex == 0
                                                ? 16
                                                : 12),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        'My Bag',
                                        style: TextStyle(
                                            color:
                                                colorScheme(context).onSurface,
                                            fontSize: value.selectedIndex == 1
                                                ? 16
                                                : 12),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        'New',
                                        style: TextStyle(
                                            color:
                                                colorScheme(context).onSurface,
                                            fontSize: value.selectedIndex == 2
                                                ? 16
                                                : 12),
                                      ),
                                    ),
                                  ],
                                  onTap: (index) {
                                    // Update the provider when a tab is tapped
                                    tabIndexProvider.setIndex(index);
                                  },
                                  indicatorWeight: 0,
                                  indicatorColor: Colors.transparent,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  indicator: UnderlineTabIndicator(
                                    borderRadius: BorderRadius.circular(60),
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 2.0),
                                    insets:
                                        EdgeInsets.symmetric(horizontal: 22.0),
                                  )))),
                      SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            SizedBox(
                              child: GridView.builder(
                                itemCount: giftList.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        mainAxisExtent: 95,
                                        crossAxisSpacing: 5,
                                        mainAxisSpacing: 5),
                                itemBuilder: (context, index) =>
                                    GiftCustomContainer(
                                        onTap: () {
                                          value.getGiftIndex(index);
                                        },
                                        height: 80,
                                        width: 100,
                                        color: value.giftSelectedIndex == index
                                            ? colorScheme(context)
                                                .primary
                                                .withOpacity(.1)
                                            : colorScheme(context).surface,
                                        borderRadius: 4,
                                        borderColor:
                                            value.giftSelectedIndex == index
                                                ? colorScheme(context).primary
                                                : AppColor.offWhite,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                giftList[index].image,
                                                height: 55,
                                              ),
                                              Text(
                                                giftList[index].name,
                                                style: textTheme(context)
                                                    .bodySmall
                                                    ?.copyWith(
                                                        fontSize: 8,
                                                        color:
                                                            colorScheme(context)
                                                                .onSurface),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                      AppIcons.giftCoin,
                                                      height: 15),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    giftList[index].coin,
                                                    style: textTheme(context)
                                                        .bodySmall
                                                        ?.copyWith(
                                                            fontSize: 8,
                                                            color: AppColor
                                                                .textGrey),
                                                  ),
                                                ],
                                              ),
                                            ])),
                              ),
                            ),
                            Center(child: Text('Page Two')),
                            Center(child: Text('Page Three')),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.giftCoin,
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Text(
                          '100',
                          style: textTheme(context)
                              .bodySmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 15,
                        color: colorScheme(context).primary,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GiftCustomContainer(
                    height: 48,
                    width: m.width * 0.7,
                    borderRadius: 100,
                    borderColor: AppColor.offWhite,
                    child: Row(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Consumer<GiftUserProvider>(
                            builder: (context, value, child) => Row(
                              children: List.generate(4, (index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: GiftCustomContainer(
                                    onTap: () {
                                      value.giftCoinRangeStatus(index);
                                    },
                                    color: AppColor.offWhite,
                                    borderRadius: 30,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: index == 0 ? 12 : 10,
                                        vertical: 5),
                                    child: Text(
                                      index == 0
                                          ? '1'
                                          : index == 1
                                              ? '10'
                                              : index == 2
                                                  ? '99'
                                                  : '999',
                                      style: textTheme(context)
                                          .bodySmall
                                          ?.copyWith(
                                              color: value.giftCoinRange ==
                                                      index
                                                  ? colorScheme(context).primary
                                                  : colorScheme(context)
                                                      .onSurface),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                        Spacer(),
                        GiftCustomContainer(
                          color: colorScheme(context).primary,
                          borderRadius: 100,
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                          child: Text(
                            'Send',
                            style: textTheme(context)
                                .bodySmall
                                ?.copyWith(color: colorScheme(context).surface),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    ),
  );
}

//////////////////////////////YouTube////////////////////////////////////
Widget showYoutubeBottomSheet(context) {
  List<String> tapBarListName = ['', 'New to you', 'Trailer', 'Songs', 'Figma'];
  var m = MediaQuery.of(context).size;

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: SingleChildScrollView(
      // Add SingleChildScrollView here
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                AppIcons.youtubeIcon,
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  AppIcons.clearIcon,
                  color: colorScheme(context).onSurface,
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Consumer<YoutubeSheetProvider>(
            builder: (context, value, child) => CustomTextFormField(
              borderRadius: 100,
              fillColor: AppColor.textFieldColor,
              prefixIcon: Icon(
                Icons.search,
                color: colorScheme(context).onSurface.withOpacity(.6),
              ),
              onChanged: (val) {
                value.searchPost(val);
              },
              hint: 'Search keywords or video link',
              hintColor: colorScheme(context).onSurface.withOpacity(.6),
              hintSize: 11,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(tapBarListName.length, (index) {
                return index == 0
                    ? Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: GiftCustomContainer(
                          color: colorScheme(context).onSurface,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          borderRadius: 8,
                          child: SvgPicture.asset(
                            AppIcons.youtubeExploreIcon,
                            color: colorScheme(context).surface,
                            height: 18,
                          ),
                        ),
                      )
                    : Consumer<YoutubeSheetProvider>(
                        builder: (context, value, child) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.50),
                          child: GestureDetector(
                            onTap: () {
                              value.tapBarIndexSelected(index);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: value.tapBarIndex == index
                                      ? LinearGradient(
                                          colors: [
                                            AppColor.youToubeGradientOne,
                                            AppColor.youToubeGradientTwo,
                                            AppColor.youToubeGradientThree
                                          ],
                                        )
                                      : null),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: GiftCustomContainer(
                                  borderRadius: 8,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  color: AppColor.textFieldColor,
                                  child: Text(
                                    tapBarListName[index],
                                    style: textTheme(context)
                                        .bodySmall
                                        ?.copyWith(
                                            color:
                                                colorScheme(context).onSurface,
                                            fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
              }),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: m.height * 0.35,
            width: m.width,
            child: SingleChildScrollView(
              child: Consumer<YoutubeSheetProvider>(
                builder: (context, value, child) => Column(
                  children: List.generate(value.filterPostList.length, (index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(AppRoute.multiGuestVideo);
                            },
                            child: SizedBox(
                              height: m.height * 0.25,
                              width: m.width,
                              child: Image.asset(
                                value.filterPostList[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: colorScheme(context).surface,
                                radius: 18,
                                child: Image.asset(
                                    value.filterPostList[index].userProfile),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: m.width * 0.8,
                                    child: Text(
                                      value.filterPostList[index].description,
                                      style: textTheme(context)
                                          .bodySmall
                                          ?.copyWith(
                                              color: colorScheme(context)
                                                  .onSurface,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        value.filterPostList[index].imageTitle,
                                        style: textTheme(context)
                                            .bodySmall
                                            ?.copyWith(
                                                color: colorScheme(context)
                                                    .onSurface
                                                    .withOpacity(.5),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 9),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      CircleAvatar(
                                        radius: 6,
                                        backgroundColor: colorScheme(context)
                                            .onSurface
                                            .withOpacity(.5),
                                        child: Icon(
                                          Icons.check,
                                          size: 10,
                                          color: colorScheme(context).surface,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        value.filterPostList[index].views,
                                        style: textTheme(context)
                                            .bodySmall
                                            ?.copyWith(
                                                color: colorScheme(context)
                                                    .onSurface
                                                    .withOpacity(.5),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 9),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      CircleAvatar(
                                        radius: 2,
                                        backgroundColor: colorScheme(context)
                                            .onSurface
                                            .withOpacity(.5),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        value.filterPostList[index].time,
                                        style: textTheme(context)
                                            .bodySmall
                                            ?.copyWith(
                                                color: colorScheme(context)
                                                    .onSurface
                                                    .withOpacity(.5),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 9),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

////////////////WhisperBootomSheet////////////////
void showWhisperBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Whisper",
              style: TextStyle(fontSize: 20),
            ),
            const Divider(color: Colors.black),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) => ListTile(
                    leading: const CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                          'https://randomuser.me/api/portraits/men/75.jpg'),
                    ),
                    title: const Text("Martin Randolph",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    subtitle: const Text("Welcome! You can meet and follow",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400)),
                    trailing: CustomButton(
                      buttonText: 'Chat',
                      onPressed: () {
                        context.pushNamed(AppRoute.chatting);
                      },
                      width: 100,
                      height: 40,
                      borderRadius: 50,
                    )),
              ),
            ),
          ],
        ),
      );
    },
  );
}
///////////////////////////////////////////////ShoW ListBottamSheet///////////////////////////////////////////////////////////

void ShowListBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSectionTitle("Basic Features"),

            _buildIconRow([
              const SizedBox(height: 10),
              _buildIcon(
                AppImages.winstar,
                "Wish List",
              ),
              const SizedBox(width: 18),
              GestureDetector(
                onTap: () {
                  showSubscriberBottomSheet(context);
                },
                child: Column(
                  children: [
                    SvgPicture.asset(
                      AppIcons.goldStar,
                      height: 40,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Subscriber',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 18),
              GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => showYoutubeBottomSheet(context));
                  },
                  child: _buildIcon(AppImages.youtube, "YouTube")),
            ]),
            const SizedBox(height: 16),

            // Tools Section
            _buildSectionTitle("Tools"),
            const SizedBox(height: 5),

            _buildIconRow([
              const SizedBox(height: 10),

              GestureDetector(
                  onTap: () {
                    boostBottomSheet(context);
                  },
                  child: _buildIcon(AppImages.speaker, "Boost")),
              const SizedBox(width: 18),
              GestureDetector(
                  onTap: () {
                    showWhisperBottomSheet(context);
                  },
                  child: _buildIcon(AppImages.chatBottom, "Whispers")),
              const SizedBox(width: 18),
              _buildIcon(AppImages.seatBottom, "3P"),
              const SizedBox(width: 18),
              _buildIcon(AppImages.seatBottom, "4P"),
              const SizedBox(width: 18),
              _buildIcon(AppImages.seatBottom, "4P"),
              // const SizedBox(width: 18),
            ]),
            const SizedBox(height: 16),

            // Other Section
            _buildSectionTitle("Other"),
            const SizedBox(height: 5),

            _buildIconRow([
              _buildIcon(AppImages.camerabottom, "OFF"),
              const SizedBox(width: 18),
              GestureDetector(
                  onTap: () {
                    shareDialogue(context);
                  },
                  child: _buildIcon(AppImages.shareBottom, "Share Screen")),
              const SizedBox(width: 18),
              _buildIcon(AppImages.sharingBottom, "Switch"),
              const SizedBox(width: 18),
              _buildIcon(AppImages.databottom, "Data"),
            ]),
          ],
        ),
      );
    },
  );
}

// Helper method to create a section title
Widget _buildSectionTitle(String title) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  );
}

// Helper method to create a row of icons
Widget _buildIconRow(List<Widget> icons) {
  return Row(
    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: icons,
  );
}

// Helper method to create an icon button with text
Widget _buildIcon(String asset, String label) {
  return Column(
    children: [
      // Use error handling while loading SVG images
      Image.asset(
        asset,
        height: 50, // You can adjust the size
        width: 50, // You can adjust the size

        // },
      ),
      const SizedBox(height: 4),
      Text(
        label,
        style: const TextStyle(fontSize: 12),
      ),
    ],
  );
}
