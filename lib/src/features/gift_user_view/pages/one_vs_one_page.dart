// import 'package:flutter/material.dart';
// import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
// import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
// import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
// import 'package:flutter_application_zestilive/src/features/gift_user_view/model/gift_model.dart';
// import 'package:flutter_application_zestilive/src/features/gift_user_view/provider/gift_user_provider.dart';
// import 'package:flutter_application_zestilive/src/features/gift_user_view/widget/gift_custom_container.dart';
// import 'package:flutter_application_zestilive/src/features/gift_user_view/widget/gift_level_progress_indicator_.dart';
// import 'package:flutter_application_zestilive/src/features/gift_user_view/widget/user_container.dart';
// import 'package:flutter_application_zestilive/src/features/pk/provider/pk_match_screen_provider.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:lottie/lottie.dart';
// import 'package:provider/provider.dart';

// class GiftUserOneVsOnePage extends StatefulWidget {
//   GiftUserOneVsOnePage({super.key});

//   @override
//   State<GiftUserOneVsOnePage> createState() => _GiftUserOneVsOnePageState();
// }

// class _GiftUserOneVsOnePageState extends State<GiftUserOneVsOnePage> {
//   @override
//   Widget build(BuildContext context) {
//     var m = MediaQuery.of(context).size;

//     return Scaffold(
//       body: SafeArea(
//         child: Column(children: [
//           GiftCustomContainer(
//             // height: m.height * 0.13
//             padding: EdgeInsets.symmetric(vertical: 10),
//             width: double.infinity,
//             color: colorScheme(context).primary,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10.0),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Stack(
//                         alignment: Alignment.centerLeft,
//                         children: [
//                           GiftCustomContainer(
//                             height: 35,
//                             borderRadius: 100,
//                             padding: EdgeInsets.symmetric(horizontal: 5),
//                             color: AppColor.appYellow,
//                             child: Padding(
//                               padding: EdgeInsets.only(left: 35.0),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Enrique Pemala',
//                                     style: textTheme(context)
//                                         .bodySmall
//                                         ?.copyWith(
//                                             fontSize: 10,
//                                             color:
//                                                 colorScheme(context).onSurface,
//                                             fontWeight: FontWeight.w600),
//                                   ),
//                                   Row(
//                                     children: [
//                                       Image.asset(
//                                         AppImages.giftDiamond,
//                                         height: 16,
//                                       ),
//                                       SizedBox(
//                                         width: 5,
//                                       ),
//                                       Text(
//                                         '8811M',
//                                         style: textTheme(context)
//                                             .bodySmall
//                                             ?.copyWith(
//                                                 fontSize: 10,
//                                                 color: colorScheme(context)
//                                                     .onSurface,
//                                                 fontWeight: FontWeight.w600),
//                                       ),
//                                     ],
//                                   )
//                                 ],
// //

// //       body:
// //       SafeArea(



//     return Scaffold(
//       body: SafeArea(
//         child: Column(children: [
//           GiftCustomContainer(
//             // height: m.height * 0.13
//             padding: EdgeInsets.symmetric(vertical: 10),
//             width: double.infinity,
//             color: colorScheme(context).primary,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10.0),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Stack(
//                         alignment: Alignment.centerLeft,
//                         children: [
//                           GiftCustomContainer(
//                             height: 35,
//                             borderRadius: 100,
//                             padding: EdgeInsets.symmetric(horizontal: 5),
//                             color: AppColor.appYellow,
//                             child: Padding(
//                               padding: EdgeInsets.only(left: 35.0),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Enrique Pemala',
//                                     style: textTheme(context)
//                                         .bodySmall
//                                         ?.copyWith(
//                                             fontSize: 10,
//                                             color:
//                                                 colorScheme(context).onSurface,
//                                             fontWeight: FontWeight.w600),
//                                   ),
//                                   Row(
//                                     children: [
//                                       Image.asset(
//                                         AppImages.giftDiamond,
//                                         height: 16,
//                                       ),
//                                       SizedBox(
//                                         width: 5,
//                                       ),
//                                       Text(
//                                         '8811M',
//                                         style: textTheme(context)
//                                             .bodySmall
//                                             ?.copyWith(
//                                                 fontSize: 10,
//                                                 color: colorScheme(context)
//                                                     .onSurface,
//                                                 fontWeight: FontWeight.w600),
//                                       ),
//                                     ],
//                                   )
//                                 ],

// 


//     return Scaffold(
//       body: SafeArea(
//         child: Column(children: [
//           GiftCustomContainer(
//             // height: m.height * 0.13
//             padding: EdgeInsets.symmetric(vertical: 10),
//             width: double.infinity,
//             color: colorScheme(context).primary,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10.0),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Stack(
//                         alignment: Alignment.centerLeft,
//                         children: [
//                           GiftCustomContainer(
//                             height: 35,
//                             borderRadius: 100,
//                             padding: EdgeInsets.symmetric(horizontal: 5),
//                             color: AppColor.appYellow,
//                             child: Padding(
//                               padding: EdgeInsets.only(left: 35.0),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Enrique Pemala',
//                                     style: textTheme(context)
//                                         .bodySmall
//                                         ?.copyWith(
//                                             fontSize: 10,
//                                             color:
//                                                 colorScheme(context).onSurface,
//                                             fontWeight: FontWeight.w600),
//                                   ),
//                                   Row(
//                                     children: [
//                                       Image.asset(
//                                         AppImages.giftDiamond,
//                                         height: 16,
//                                       ),
//                                       SizedBox(
//                                         width: 5,
//                                       ),
//                                       Text(
//                                         '8811M',
//                                         style: textTheme(context)
//                                             .bodySmall
//                                             ?.copyWith(
//                                                 fontSize: 10,
//                                                 color: colorScheme(context)
//                                                     .onSurface,
//                                                 fontWeight: FontWeight.w600),
//                                       ),
//                                     ],
//                                   )
//                                 ],



//       body:
//       SafeArea(

// //         child: Column(
// //           children: [
// //             GiftCustomContainer(
// //               height: m.height * 0.13,
// //               width: double.infinity,
// //               color: colorScheme(context).primary,
// //               child: Padding(
// //                 padding: EdgeInsets.symmetric(horizontal: 10.0),
// //                 child: Column(
// //                   children: [
// //                     Row(
// //                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                       children: [
// //                         Stack(
// //                           alignment: Alignment.centerLeft,
// //                           children: [
// //                             GiftCustomContainer(
// //                               height: 35,
// //                               borderRadius: 100,
// //                               padding: EdgeInsets.symmetric(horizontal: 5),
// //                               color: AppColor.appYellow,
// //                               child: Padding(
// //                                 padding: EdgeInsets.only(left: 35.0),
// //                                 child: Column(
// //                                   mainAxisAlignment: MainAxisAlignment.center,
// //                                   crossAxisAlignment: CrossAxisAlignment.start,
// //                                   children: [
// //                                     Text(
// //                                       'Enrique Pemala',
// //                                       style: textTheme(context)
// //                                           .bodySmall
// //                                           ?.copyWith(
// //                                               fontSize: 10,
// //                                               color: colorScheme(context)
// //                                                   .onSurface,
// //                                               fontWeight: FontWeight.w600),
// //                                     ),
// //                                     Row(
// //                                       children: [
// //                                         Image.asset(
// //                                           AppImages.giftDiamond,
// //                                           height: 16,
// //                                         ),
// //                                         SizedBox(
// //                                           width: 5,
// //                                         ),
// //                                         Text(
// //                                           '8811M',
// //                                           style: textTheme(context)
// //                                               .bodySmall
// //                                               ?.copyWith(
// //                                                   fontSize: 10,
// //                                                   color: colorScheme(context)
// //                                                       .onSurface,
// //                                                   fontWeight: FontWeight.w600),
// //                                         ),
// //                                       ],
// //                                     )
// //                                   ],
// //                                 ),
// //
//                               ),
//                             ),
//                           ),
//                           Stack(
//                             alignment: Alignment.center,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(bottom: 4.0),
//                                 child: Image.asset(
//                                   AppImages.onboardFirsttwo,
//                                   height: 33,
//                                   alignment: Alignment.center,
//                                 ),
//                               ),
//                               Image.asset(
//                                 AppImages.giftUserLevel,
//                                 height: 40,
//                                 alignment: Alignment.center,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Spacer(),
//                       Stack(
//                         children: [
//                           Container(
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 40.0),
//                               child: Stack(
//                                 alignment: Alignment.center,
//                                 children: [
//                                   Image.asset(
//                                     AppImages.onboardFirsttwo,
//                                     height: 33,
//                                     alignment: Alignment.center,
//                                   ),
//                                   Image.asset(
//                                     AppImages.giftLevelBadgesTwo,
//                                     height: 40,
//                                     alignment: Alignment.center,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 20.0),
//                             child: Container(
//                               child: Stack(
//                                 alignment: Alignment.center,
//                                 children: [
//                                   Image.asset(
//                                     AppImages.onboardFirstthree,
//                                     height: 33,
//                                     alignment: Alignment.center,
//                                   ),
//                                   Image.asset(
//                                     AppImages.giftLevelBadgesThree,
//                                     height: 40,
//                                     alignment: Alignment.center,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 0.0),
//                             child: Container(
//                               child: Stack(
//                                 alignment: Alignment.center,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(4.0),
//                                     child: Image.asset(
//                                       AppImages.onboardFirsttwo,
//                                       height: 33,
//                                       alignment: Alignment.center,
//                                     ),
//                                   ),
//                                   Image.asset(
//                                     AppImages.giftLevelBadges,
//                                     height: 40,
//                                     alignment: Alignment.center,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Row(
//                           children: List.generate(3, (index) {
//                         return Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 3.0),
//                           child: CircleAvatar(
//                             radius: 15,
//                             backgroundColor:
//                                 colorScheme(context).onSurface.withOpacity(.40),
//                             child: Center(
//                               child: index == 1
//                                   ? Text(
//                                       '307',
//                                       style: textTheme(context)
//                                           .bodySmall
//                                           ?.copyWith(
//                                               fontSize: 10,
//                                               color:
//                                                   colorScheme(context).surface),
//                                     )
//                                   : SvgPicture.asset(
//                                       index == 0
//                                           ? AppIcons.blackShareIcon
//                                           : AppIcons.clearIcon,
//                                       color: colorScheme(context).surface,
//                                     ),
//                             ),
//                           ),
//                         );
//                       }))
//                     ],
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 10, vertical: 3),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(100),
//                             gradient: LinearGradient(colors: [
//                               AppColor.giftGradientOne,
//                               AppColor.giftGradientTwo
//                             ])),
//                         child: Row(
//                           children: [
//                             Image.asset(
//                               AppImages.giftTopFan,
//                               height: 20,
//                             ),
//                             SizedBox(
//                               width: 5,
//                             ),
//                             Text(
//                               'Top Fans',
//                               style: textTheme(context).bodySmall?.copyWith(
//                                   color: colorScheme(context).surface,
//                                   fontSize: 10,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                       ),
//                       GiftCustomContainer(
//                         borderRadius: 100,
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 10, vertical: 5.8),
//                         color: colorScheme(context).onSurface.withOpacity(.40),
//                         child: Row(
//                           children: [
//                             Text(
//                               'For you',
//                               style: textTheme(context).bodySmall?.copyWith(
//                                     color: colorScheme(context).surface,
//                                     fontSize: 10,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                             ),
//                             SizedBox(
//                               width: 5,
//                             ),
//                             Icon(
//                               Icons.arrow_forward_ios_outlined,
//                               color: colorScheme(context).surface,
//                               size: 15,
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             height: 15,
//             width: m.width,
//             bottom: 18,
//             child: Consumer<PkMatchProvider>(
//               builder: (context, pkMatchProvider, child) {
//                 return Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     Row(
//                       children: <Widget>[
//                         Expanded(
//                           flex: (pkMatchProvider.sliderValue * 1000).round(),
//                           child: Container(
//                             height: 15,
//                             decoration:
//                                 BoxDecoration(color: AppColor.appYellow),
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 15.0),
//                                 child: Text(
//                                   '3000',
//                                   style: textTheme(context).bodySmall?.copyWith(
//                                       fontSize: 8,
//                                       color: colorScheme(context).onSurface,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           flex: ((1 - pkMatchProvider.sliderValue) * 1000)
//                               .round(),
//                           child: Container(
//                             height: 15,
//                             decoration: BoxDecoration(
//                                 gradient: LinearGradient(colors: [
//                               AppColor.giftSliderOne,
//                               AppColor.giftSlideTwo
//                             ])),
//                             child: Align(
//                               alignment: Alignment.centerRight,
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 15.0),
//                                 child: Text(
//                                   '500',
//                                   style: textTheme(context).bodySmall?.copyWith(
//                                       fontSize: 8,
//                                       color: colorScheme(context).surface,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     // Slider Thumb


//                     // Lottie Animation
//                     Positioned(
//                       left: (m.width * pkMatchProvider.sliderValue) - 30,
//                       child: Lottie.asset(
//                         AppAnimations.shineAnimation,
//                         width: 50,
//                         height: 100,
//                         repeat: true,
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//           Stack(
//             alignment: Alignment.topCenter,
//             children: [
//               GiftCustomContainer(
//                 child: Row(
//                   children: [
//                     Row(
//                       children: [
//                         Image.asset(
//                           AppImages.liveSelling,
//                           width: m.width / 2,
//                           fit: BoxFit.cover,
//                         ),
//                         Image.asset(
//                           AppImages.singleLiveScreen,
//                           width: m.width / 2,
//                           fit: BoxFit.cover,
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 height: 25,
//                 width: 88,
//                 decoration: BoxDecoration(
//                     color: colorScheme(context).onSurface,
//                     borderRadius:
//                         BorderRadius.vertical(bottom: Radius.circular(10))),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Image.asset(
//                       AppImages.giftVs,
//                       height: 15,
//                     ),
//                     Text(
//                       '01:45',
//                       style: textTheme(context).bodySmall?.copyWith(
//                           color: colorScheme(context).surface,
//                           fontSize: 10,
//                           fontWeight: FontWeight.w500),
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GiftCustomContainer(
//                       color: colorScheme(context).onSurface.withOpacity(.60),
//                       borderRadius: 100,
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 10, vertical: 3),
//                       child: Row(
//                         children: [
//                           Image.asset(
//                             AppImages.giftWin,
//                             height: 10,
//                             color: AppColor.appYellow,
//                           ),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           Text(
//                             'x1',
//                             style: textTheme(context).bodySmall?.copyWith(
//                                 color: colorScheme(context).surface,
//                                 fontSize: 10),
//                           )
//                         ],
//                       ),
//                     ),
//                     GiftCustomContainer(
//                       color: colorScheme(context).onSurface.withOpacity(.60),
//                       borderRadius: 100,
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 10, vertical: 3),
//                       child: Text(
//                         'Lose',
//                         style: textTheme(context).bodySmall?.copyWith(
//                             color:
//                                 colorScheme(context).surface.withOpacity(.70),
//                             fontSize: 12,
//                             fontWeight: FontWeight.w700),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 20,
//           ),
//         ]),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showModalBottomSheet(
//             context: context,
//             builder: (context) => Consumer<GiftUserProvider>(
//               builder: (context, value, child) => Container(
//                 width: m.width,
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Center(
//                           child: GestureDetector(
//                             onTap: () {
//                               value.toggleButton();
//                             },
//                             child: AnimatedContainer(
//                               duration: Duration(milliseconds: 300),
//                               width: 50,
//                               // padding: EdgeInsets.symmetric(horizontal: 10),
//                               height: 25,
//                               decoration: BoxDecoration(
//                                 color: Colors.grey[300],
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               child: Stack(
//                                 children: [
//                                   AnimatedPositioned(
//                                     duration: Duration(milliseconds: 300),
//                                     curve: Curves.easeInOut,
//                                     left: value.isActive ? 25 : 0,
//                                     child: value.isActive
//                                         ? Icon(
//                                             Icons.circle,
//                                             color: AppColor.giftGreyColor,
//                                           )
//                                         : Container(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 10),
//                                             // width: 45,
//                                             height: 25,
//                                             decoration: BoxDecoration(
//                                               color: value.isActive
//                                                   ? Colors.transparent
//                                                   : Color(0xFFE93E4F),
//                                               borderRadius:
//                                                   BorderRadius.circular(30),
//                                             ),
//                                             child: Center(
//                                               child: Text(
//                                                   value.isActive ? "" : "All",
//                                                   style: textTheme(context)
//                                                       .bodySmall
//                                                       ?.copyWith(
//                                                           color: colorScheme(
//                                                                   context)
//                                                               .surface,
//                                                           fontWeight:
//                                                               FontWeight.w600)),
//                                             ),
//                                           ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         Spacer(),
//                         UsersImages(image: AppImages.onboardFirstfour),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         GiftCustomContainer(
//                           height: 25,
//                           width: 2,
//                           color: AppColor.appYellow,
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         UsersImages(
//                           image: AppImages.onboardFirstone,
//                           borderColor: AppColor.giftGreyColor,
//                           stackWidget: Center(
//                             child: Text('2',
//                                 style: textTheme(context).bodySmall?.copyWith(
//                                     fontSize: 8,
//                                     color: colorScheme(context).onSurface,
//                                     fontWeight: FontWeight.w600)),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                           color: colorScheme(context).primary,
//                           width: m.width * 0.7,
//                           height: 10,
//                           child: GiftProgressIndicator(),
//                         ),
//                         Container(
//                           height: 40,
//                           width: 40,
//                           child: CircleAvatar(
//                             backgroundColor: colorScheme(context).surface,
//                             child: Image.asset(
//                               AppImages.giftRewardBox,
//                               height: 23,
//                             ),
//                           ),
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                   color: AppColor.appYellow, width: 1.5)),
//                         )
//                       ],
//                     ),
//                     Expanded(
//                       // height: m.height * 0.4,
//                       // width: m.width * 0.9,
//                       child: DefaultTabController(
//                         length: 3,
//                         child: Column(
//                           children: [
//                             // Wrap TabBar with Align or Container to provide a bounded width
//                             Align(
//                                 alignment: Alignment.topCenter,
//                                 child: Consumer<GiftUserProvider>(
//                                     builder: (context, tabIndexProvider, _) =>
//                                         TabBar(
//                                             physics:
//                                                 NeverScrollableScrollPhysics(),
//                                             tabs: [
//                                               Tab(
//                                                 child: Text(
//                                                   'All Gifts',
//                                                   style: TextStyle(
//                                                       color:
//                                                           colorScheme(context)
//                                                               .onSurface,
//                                                       fontSize:
//                                                           value.selectedIndex ==
//                                                                   0
//                                                               ? 16
//                                                               : 12),
//                                                 ),
//                                               ),
//                                               Tab(
//                                                 child: Text(
//                                                   'My Bag',
//                                                   style: TextStyle(
//                                                       color:
//                                                           colorScheme(context)
//                                                               .onSurface,
//                                                       fontSize:
//                                                           value.selectedIndex ==
//                                                                   1
//                                                               ? 16
//                                                               : 12),
//                                                 ),
//                                               ),
//                                               Tab(
//                                                 child: Text(
//                                                   'New',
//                                                   style: TextStyle(
//                                                       color:
//                                                           colorScheme(context)
//                                                               .onSurface,
//                                                       fontSize:
//                                                           value.selectedIndex ==
//                                                                   2
//                                                               ? 16
//                                                               : 12),
//                                                 ),
//                                               ),
//                                             ],
//                                             onTap: (index) {
//                                               // Update the provider when a tab is tapped
//                                               tabIndexProvider.setIndex(index);
//                                             },
//                                             indicatorWeight: 0,
//                                             indicatorColor: Colors.transparent,
//                                             indicatorSize:
//                                                 TabBarIndicatorSize.label,
//                                             indicator: UnderlineTabIndicator(
//                                               borderRadius:
//                                                   BorderRadius.circular(60),
//                                               borderSide: BorderSide(
//                                                   color: Colors.red,
//                                                   width: 2.0),
//                                               insets: EdgeInsets.symmetric(
//                                                   horizontal: 22.0),
//                                             )))),
//                             SizedBox(
//                               height: 15,
//                             ),
//                             Expanded(
//                               child: TabBarView(
//                                 children: [
//                                   SizedBox(
//                                     child: GridView.builder(
//                                       itemCount: giftList.length,
//                                       gridDelegate:
//                                           SliverGridDelegateWithFixedCrossAxisCount(
//                                               crossAxisCount: 4,
//                                               mainAxisExtent: 95,
//                                               crossAxisSpacing: 5,
//                                               mainAxisSpacing: 5),
//                                       itemBuilder: (context, index) =>
//                                           GiftCustomContainer(
//                                               onTap: () {
//                                                 value.getGiftIndex(index);
//                                               },
//                                               height: 80,
//                                               width: 100,
//                                               color: value.giftSelectedIndex ==
//                                                       index
//                                                   ? colorScheme(context)
//                                                       .primary
//                                                       .withOpacity(.1)
//                                                   : colorScheme(context)
//                                                       .surface,
//                                               borderRadius: 4,
//                                               borderColor: value
//                                                           .giftSelectedIndex ==
//                                                       index
//                                                   ? colorScheme(context).primary
//                                                   : AppColor.offWhite,
//                                               child: Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.center,
//                                                   children: [
//                                                     Image.asset(
//                                                       giftList[index].image,
//                                                       height: 55,
//                                                     ),
//                                                     Text(
//                                                       giftList[index].name,
//                                                       style: textTheme(context)
//                                                           .bodySmall
//                                                           ?.copyWith(
//                                                               fontSize: 8,
//                                                               color: colorScheme(
//                                                                       context)
//                                                                   .surface,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w600)),
//                                                 ),
//                                               ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Spacer(),
//                             UsersImages(image: AppImages.onboardFirstfour),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             GiftCustomContainer(
//                               height: 25,
//                               width: 2,
//                               color: AppColor.appYellow,
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             UsersImages(
//                               image: AppImages.onboardFirstone,
//                               borderColor: AppColor.giftGreyColor,
//                               stackWidget: Center(
//                                 child: Text('2',
//                                     style: textTheme(context)
//                                         .bodySmall
//                                         ?.copyWith(
//                                             fontSize: 8,
//                                             color:
//                                                 colorScheme(context).onSurface,
//                                             fontWeight: FontWeight.w600)),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                               color: colorScheme(context).primary,
//                               width: m.width * 0.75,
//                               height: 10,
//                               child: GiftProgressIndicator(),
//                             ),
//                             Container(
//                               height: 40,
//                               width: 40,
//                               child: CircleAvatar(
//                                 backgroundColor: colorScheme(context).surface,
//                                 child: Image.asset(
//                                   AppImages.giftRewardBox,
//                                   height: 23,
//                                 ),
//                               ),
//                               decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   border: Border.all(
//                                       color: AppColor.appYellow, width: 1.5)),
//                             )
//                           ],
//                         ),
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 25.0),
//                             child: SizedBox(
//                               width: m.width * 0.75,
//                               child: Row(
//                                 children: [
//                                   Text('Lv.1',
//                                       style: textTheme(context)
//                                           .bodySmall
//                                           ?.copyWith(
//                                               fontSize: 10,
//                                               color: AppColor.greyText)),
//                                   Spacer(),
//                                   Text('EXP',
//                                       style: textTheme(context)
//                                           .bodySmall
//                                           ?.copyWith(
//                                               fontSize: 10,
//                                               color: AppColor.greyText)),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   Text('3350/5000',
//                                       style: textTheme(context)
//                                           .bodySmall
//                                           ?.copyWith(
//                                               fontSize: 10,
//                                               color: AppColor.greyText))
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           // height: m.height * 0.4,
//                           // width: m.width * 0.9,
//                           child: DefaultTabController(
//                             length: 3,
//                             child: Column(
//                               children: [
//                                 // Wrap TabBar with Align or Container to provide a bounded width
//                                 Align(
//                                     alignment: Alignment.topCenter,
//                                     child: Consumer<GiftUserProvider>(
//                                         builder: (context, tabIndexProvider,
//                                                 _) =>
//                                             TabBar(
//                                                 physics:
//                                                     NeverScrollableScrollPhysics(),
//                                                 tabs: [
//                                                   Tab(
//                                                     child: Text(
//                                                       'All Gifts',
//                                                       style: TextStyle(
//                                                           color: colorScheme(
//                                                                   context)
//                                                               .onSurface,
//                                                           fontSize:
//                                                               value.selectedIndex ==
//                                                                       0
//                                                                   ? 16
//                                                                   : 12),
//                                                     ),
//                                                     SizedBox(
//                                                       height: 5,
//                                                     ),
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: [
//                                                         SvgPicture.asset(
//                                                             AppIcons.giftCoin,
//                                                             height: 15),
//                                                         SizedBox(
//                                                           width: 5,
//                                                         ),
//                                                         Text(
//                                                           giftList[index].coin,
//                                                           style: textTheme(
//                                                                   context)
//                                                               .bodySmall
//                                                               ?.copyWith(
//                                                                   fontSize: 8,
//                                                                   color: AppColor
//                                                                       .textGrey),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ])),
//                                     ),
//                                   ),
//                                   Center(child: Text('Page Two')),
//                                   Center(child: Text('Page Three')),
//                                 ],
//                               ),
//                             ),

//                             SizedBox(
//                               height: 10,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Row(
//                           children: [
//                             SvgPicture.asset(
//                               AppIcons.giftCoin,
//                               height: 15,
//                             ),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 2.0),
//                               child: Text(
//                                 '100',
//                                 style: textTheme(context)
//                                     .bodySmall
//                                     ?.copyWith(fontWeight: FontWeight.w600),
//                               ),
//                             ),
//                             Icon(
//                               Icons.arrow_forward_ios_sharp,
//                               size: 15,
//                               color: colorScheme(context).primary,
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         GiftCustomContainer(
//                           height: 48,
//                           width: m.width * 0.7,
//                           borderRadius: 100,
//                           borderColor: AppColor.offWhite,
//                           child: Row(
//                             children: [
//                               SingleChildScrollView(
//                                 scrollDirection: Axis.horizontal,
//                                 child: Consumer<GiftUserProvider>(
//                                   builder: (context, value, child) => Row(
//                                     children: List.generate(4, (index) {
//                                       return Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 5.0),
//                                         child: GiftCustomContainer(
//                                           onTap: () {
//                                             value.giftCoinRangeStatus(index);
//                                           },
//                                           color: AppColor.offWhite,
//                                           borderRadius: 30,
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: index == 0 ? 12 : 10,
//                                               vertical: 5),
//                                           child: Text(
//                                             index == 0
//                                                 ? '1'
//                                                 : index == 1
//                                                     ? '10'
//                                                     : index == 2
//                                                         ? '99'
//                                                         : '999',
//                                             style: textTheme(context)
//                                                 .bodySmall
//                                                 ?.copyWith(
//                                                     color:
//                                                         value.giftCoinRange ==
//                                                                 index
//                                                             ? colorScheme(
//                                                                     context)
//                                                                 .primary
//                                                             : colorScheme(
//                                                                     context)
//                                                                 .onSurface),
//                                           ),
//                                         ),
//                                       );
//                                     }),
//                                   ),
//                                 ),
//                               ),
//                               Spacer(),
//                               GiftCustomContainer(
//                                 color: colorScheme(context).primary,
//                                 borderRadius: 100,
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 5, vertical: 4),
//                                 child: Text(
//                                   'Send',
//                                   style: textTheme(context).bodySmall?.copyWith(
//                                       color: colorScheme(context).surface),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 15,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
