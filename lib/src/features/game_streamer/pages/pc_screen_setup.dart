// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
// import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
// import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
// import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
// import 'package:flutter_application_zestilive/src/features/game_streamer/model/chat_model.dart';
// import 'package:flutter_application_zestilive/src/features/game_streamer/widgets/custom_icon_box.dart';
// import 'package:flutter_application_zestilive/src/features/game_streamer/widgets/custom_tools_bottom_sheet.dart';
// import 'package:flutter_application_zestilive/src/features/gift_user_view/widget/gift_custom_container.dart';
// import 'package:flutter_application_zestilive/src/features/pc_live_userview/widgets/custom_chat_sheet.dart.dart';
// import 'package:flutter_application_zestilive/src/features/user_view/widgets/custom_screen_record_sheet.dart';
// import 'package:flutter_application_zestilive/src/router/go_route.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';

// class PcScreenSetupPage extends StatefulWidget {
//   final Map<String, String>? selectedGame;

//   const PcScreenSetupPage({Key? key, this.selectedGame}) : super(key: key);

//   @override
//   State<PcScreenSetupPage> createState() => _PcScreenSetupPageState();
// }

// class _PcScreenSetupPageState extends State<PcScreenSetupPage> {
//   final List<String> items = List.generate(20, (index) => "Item $index");
//   bool _isLive = false; // To track if the "Go Live" button is clicked
//   bool isMicOn = false;

//   final TextEditingController _controller = TextEditingController();
//   List<Message> messages = [
//     Message(
//       text: "Ankush joined the LIVE",
//       isSystem: true,
//       imageUrl:
//           "https://plus.unsplash.com/premium_photo-1682089892133-556bde898f2c?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW5kaWFuJTIwYm95fGVufDB8fDB8fHww", // replace with actual URL
//       // replace with actual URL
//     ),
//     Message(
//       text: "The broadcaster invites you to join a PK",
//       isSystem: true,
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfK9GK_Keg7C3X619IbFCJm3TBgOEKGAU27A&s',
//     ),
//     Message(
//       text: "Ankush joined the LIVE",
//       isSystem: true,
//       imageUrl:
//           "https://plus.unsplash.com/premium_photo-1682089892133-556bde898f2c?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW5kaWFuJTIwYm95fGVufDB8fDB8fHww", // replace with actual URL
//     ),
//     Message(
//       text: "The broadcaster invites you to join a PK",
//       isSystem: true,
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfK9GK_Keg7C3X619IbFCJm3TBgOEKGAU27A&s',
//     ),
//     Message(
//       text: "Ankush joined the LIVE",
//       isSystem: true,
//       imageUrl:
//           "https://plus.unsplash.com/premium_photo-1682089892133-556bde898f2c?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW5kaWFuJTIwYm95fGVufDB8fDB8fHww", // replace with actual URL
//     ),
//     Message(
//       text: "The broadcaster invites you to join a PK",
//       isSystem: true,
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfK9GK_Keg7C3X619IbFCJm3TBgOEKGAU27A&s',
//     ),
//   ];

//   // Function to handle "Go Live" button click
//   void _goLive() {
//     setState(() {
//       _isLive = true; // Switch to live mode
//     });
//   }

//   void _sendMessage() {
//     if (_controller.text.isNotEmpty) {
//       setState(() {
//         String userImageUrl =
//             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT76ecHFwkxt3hYWiVdLs54DYZuR8mSFzx4LxJzChwIwRLBWj3BIcw8lPRsuB8j8GCD0c4&usqp=CAU';

//         messages.insert(
//           0,
//           Message(
//             text: _controller.text,
//             isSystem: false,
//             imageUrl: userImageUrl,
//           ),
//         );
//       });
//       _controller.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var m = MediaQuery.of(context).size;
//     final double width = MediaQuery.sizeOf(context).width;

//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Conditionally show either the GiftCustomContainer or the simple Container

//           _isLive
//               ? GiftCustomContainer(
//                   height: m.height * 0.15,
//                   width: double.infinity,
//                   color: colorScheme(context).primary,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 35,
//                         ),
//                         Row(
//                           children: [
//                             Stack(
//                               alignment: Alignment.centerLeft,
//                               children: [
//                                 GiftCustomContainer(
//                                   height: 35,
//                                   borderRadius: 100,
//                                   padding:
//                                       const EdgeInsets.symmetric(horizontal: 5),
//                                   color: AppColor.appYellow,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(left: 35.0),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'Enrique Pemala',
//                                           style: textTheme(context)
//                                               .bodySmall
//                                               ?.copyWith(
//                                                   fontSize: 10,
//                                                   color: colorScheme(context)
//                                                       .onSurface,
//                                                   fontWeight: FontWeight.w600),
//                                         ),
//                                         Row(
//                                           children: [
//                                             Image.asset(
//                                               AppImages.giftDiamond,
//                                               height: 16,
//                                             ),
//                                             const SizedBox(
//                                               width: 5,
//                                             ),
//                                             Text(
//                                               '8811M',
//                                               style: textTheme(context)
//                                                   .bodySmall
//                                                   ?.copyWith(
//                                                       fontSize: 10,
//                                                       color:
//                                                           colorScheme(context)
//                                                               .onSurface,
//                                                       fontWeight:
//                                                           FontWeight.w600),
//                                             ),
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Stack(
//                                   alignment: Alignment.center,
//                                   children: [
//                                     Padding(
//                                       padding:
//                                           const EdgeInsets.only(bottom: 4.0),
//                                       child: Image.asset(
//                                         AppImages.onboardFirsttwo,
//                                         height: 33,
//                                         alignment: Alignment.center,
//                                       ),
//                                     ),
//                                     Image.asset(
//                                       AppImages.giftUserLevel,
//                                       height: 40,
//                                       alignment: Alignment.center,
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             const Spacer(),
//                             Stack(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 40.0),
//                                   child: Stack(
//                                     alignment: Alignment.center,
//                                     children: [
//                                       Image.asset(
//                                         AppImages.onboardFirsttwo,
//                                         height: 33,
//                                         alignment: Alignment.center,
//                                       ),
//                                       Image.asset(
//                                         AppImages.giftLevelBadgesTwo,
//                                         height: 40,
//                                         alignment: Alignment.center,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 20.0),
//                                   child: Stack(
//                                     alignment: Alignment.center,
//                                     children: [
//                                       Image.asset(
//                                         AppImages.onboardFirstthree,
//                                         height: 33,
//                                         alignment: Alignment.center,
//                                       ),
//                                       Image.asset(
//                                         AppImages.giftLevelBadgesThree,
//                                         height: 40,
//                                         alignment: Alignment.center,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 0.0),
//                                   child: Stack(
//                                     alignment: Alignment.center,
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.all(4.0),
//                                         child: Image.asset(
//                                           AppImages.onboardFirsttwo,
//                                           height: 33,
//                                           alignment: Alignment.center,
//                                         ),
//                                       ),
//                                       Image.asset(
//                                         AppImages.giftLevelBadges,
//                                         height: 40,
//                                         alignment: Alignment.center,
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             Row(
//                                 children: List.generate(3, (index) {
//                               return Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 2.0),
//                                 child: CircleAvatar(
//                                   radius: 15,
//                                   backgroundColor: colorScheme(context)
//                                       .onSurface
//                                       .withOpacity(.40),
//                                   child: Center(
//                                     child: index == 1
//                                         ? Text(
//                                             '307',
//                                             style: textTheme(context)
//                                                 .bodySmall
//                                                 ?.copyWith(
//                                                   fontSize: 10,
//                                                   color: colorScheme(context)
//                                                       .surface,
//                                                 ),
//                                           )
//                                         : GestureDetector(
//                                             onTap: () {
//                                               if (index == 2) {
//                                                 // Action for blackShareIcon
//                                                 print(
//                                                     "Black Share Icon Tapped");
//                                                 // Add your specific functionality here

//                                                 context.pop();
//                                               } else {
//                                                 // Action for clearIcon
//                                                 print("Clear Icon Tapped");

//                                                 // Add your specific functionality here
//                                               }
//                                             },
//                                             child: SvgPicture.asset(
//                                               index == 0
//                                                   ? AppIcons.blackShareIcon
//                                                   : AppIcons.clearIcon,
//                                               color:
//                                                   colorScheme(context).surface,
//                                             ),
//                                           ),
//                                   ),
//                                 ),
//                               );
//                             }))
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 3),
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(100),
//                                   gradient: LinearGradient(colors: [
//                                     AppColor.giftGradientOne,
//                                     AppColor.giftGradientTwo
//                                   ])),
//                               child: Row(
//                                 children: [
//                                   Image.asset(
//                                     AppImages.giftTopFan,
//                                     height: 20,
//                                   ),
//                                   const SizedBox(
//                                     width: 5,
//                                   ),
//                                   Text(
//                                     'Top Fans',
//                                     style: textTheme(context)
//                                         .bodySmall
//                                         ?.copyWith(
//                                             color: colorScheme(context).surface,
//                                             fontSize: 10,
//                                             fontWeight: FontWeight.w500),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             GiftCustomContainer(
//                               borderRadius: 100,
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 5.8),
//                               color: colorScheme(context)
//                                   .onSurface
//                                   .withOpacity(.40),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     'For You',
//                                     style: textTheme(context)
//                                         .bodySmall
//                                         ?.copyWith(
//                                           color: colorScheme(context).surface,
//                                           fontSize: 10,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                   ),
//                                   const SizedBox(
//                                     width: 5,
//                                   ),
//                                   Icon(
//                                     Icons.arrow_forward_ios_outlined,
//                                     color: colorScheme(context).surface,
//                                     size: 15,
//                                   )
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: 3,
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               : GiftCustomContainer(
//                   height: m.height * 0.13,
//                   width: double.infinity,
//                   color: colorScheme(context).primary,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           height: 30,
//                         ),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Stack(
//                               alignment: Alignment.centerLeft,
//                               children: [
//                                 GiftCustomContainer(
//                                   height: 35,
//                                   borderRadius: 100,
//                                   padding:
//                                       const EdgeInsets.symmetric(horizontal: 5),
//                                   color: AppColor.appYellow,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(left: 35.0),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'Enrique Pemala',
//                                           style: textTheme(context)
//                                               .bodySmall
//                                               ?.copyWith(
//                                                   fontSize: 10,
//                                                   color: colorScheme(context)
//                                                       .onSurface,
//                                                   fontWeight: FontWeight.w600),
//                                         ),
//                                         Row(
//                                           children: [
//                                             Image.asset(
//                                               AppImages.giftDiamond,
//                                               height: 16,
//                                             ),
//                                             const SizedBox(
//                                               width: 5,
//                                             ),
//                                             Text(
//                                               '8811M',
//                                               style: textTheme(context)
//                                                   .bodySmall
//                                                   ?.copyWith(
//                                                       fontSize: 10,
//                                                       color:
//                                                           colorScheme(context)
//                                                               .onSurface,
//                                                       fontWeight:
//                                                           FontWeight.w600),
//                                             ),
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Stack(
//                                   alignment: Alignment.center,
//                                   children: [
//                                     Padding(
//                                       padding:
//                                           const EdgeInsets.only(bottom: 4.0),
//                                       child: Image.asset(
//                                         AppImages.onboardFirsttwo,
//                                         height: 33,
//                                         alignment: Alignment.center,
//                                       ),
//                                     ),
//                                     Image.asset(
//                                       AppImages.giftUserLevel,
//                                       height: 40,
//                                       alignment: Alignment.center,
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             Spacer(),
//                             CircleAvatar(
//                               radius: 15,
//                               backgroundColor: colorScheme(context)
//                                   .onSurface
//                                   .withOpacity(0.40),
//                               child: GestureDetector(
//                                 onTap: () {
//                                   context.pushNamed(AppRoute.mobileLivePage);
//                                   // context.pop();
//                                   // Add the desired functionality here
//                                   print("Clear icon tapped");
//                                 },
//                                 child: Center(
//                                   child: SvgPicture.asset(
//                                     AppIcons
//                                         .clearIcon, // Assuming clearIcon is the path to your SVG file
//                                     color: colorScheme(context).surface,
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Stack(
//                 children: [
//                   Image.asset(
//                     AppImages.pclive,
//                     fit: BoxFit.cover,
//                     width: width,
//                     height: 180,
//                   ),
//                   if (_isLive)
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(top: 8.0, left: 8, right: 8),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           GestureDetector(
//                             onTap: () {},
//                             child: SizedBox(
//                               height: 40,
//                               width: 125,
//                               child: AbsorbPointer(
//                                 child: TextFormField(
//                                   readOnly: true,
//                                   decoration: InputDecoration(
//                                     hintText: widget.selectedGame?['name'] ??
//                                         'Categories',
//                                     prefixIcon: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 6.0),
//                                       child: Row(
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: [
//                                           if (widget.selectedGame != null)
//                                             Image.asset(
//                                               widget.selectedGame!['image']!,
//                                               width: 24,
//                                               height: 24,
//                                             ),
//                                           if (widget.selectedGame != null)
//                                             const SizedBox(width: 6),
//                                           Expanded(
//                                             child: Text(
//                                               widget.selectedGame?['name'] ??
//                                                   'Categories',
//                                               style: TextStyle(
//                                                 color:
//                                                     widget.selectedGame == null
//                                                         ? Colors.black
//                                                             .withOpacity(0.9)
//                                                         : Colors.black,
//                                               ),
//                                               overflow: TextOverflow.ellipsis,
//                                               maxLines: 1,
//                                             ),
//                                           ),
//                                           const Icon(
//                                             Icons.arrow_forward_ios_rounded,
//                                             color: Colors.red,
//                                             size: 12,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     filled: true,
//                                     fillColor: AppColor.dividerClr,
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(6),
//                                       borderSide: BorderSide.none,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             height: 40,
//                             width: 102,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               gradient: LinearGradient(
//                                 colors: [
//                                   AppColor.lightOrange,
//                                   AppColor.darkOrange,
//                                 ],
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                               ),
//                             ),
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.only(left: 8.0, top: 6),
//                                   child: Image.asset(
//                                     AppImages.feather,
//                                     width: 24,
//                                     height: 30,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 8),
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'Wish List',
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .titleLarge
//                                           ?.copyWith(
//                                             color: colorScheme(context).surface,
//                                             fontSize: 11,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'Add',
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .titleLarge
//                                               ?.copyWith(
//                                                 color: colorScheme(context)
//                                                     .surface,
//                                                 fontSize: 10,
//                                                 fontWeight: FontWeight.w400,
//                                               ),
//                                         ),
//                                         const SizedBox(
//                                           width: 2,
//                                         ),
//                                         const Icon(
//                                           Icons.arrow_forward_ios,
//                                           color: Colors.white,
//                                           size: 10,
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                 ],
//               ),
//               Stack(
//                 children: [
//                   Image.asset(
//                     AppImages.streamer,
//                     fit: BoxFit.cover,
//                     width: width,
//                     height: 180,
//                   ),
//                   Positioned(
//                       top: 10,
//                       right: 10,
//                       child: SvgPicture.asset(AppIcons.dblarrow))
//                 ],
//               ),
//             ],
//           ),
//           // Chat section with alternate colors when not live
//           Expanded(
//             child: Container(
//               child: ListView.builder(
//                 reverse: true,
//                 itemCount: messages.length,
//                 itemBuilder: (context, index) {
//                   final message = messages[index];
//                   return Align(
//                     alignment: message.isSystem
//                         ? Alignment.centerLeft
//                         : Alignment.centerRight,
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 10, right: 80),
//                       child: Container(
//                         margin: const EdgeInsets.symmetric(vertical: 2),
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 4, vertical: 2),
//                         decoration: BoxDecoration(
//                           color: _isLive
//                               ? (message.isSystem
//                                   ? (index % 2 == 0
//                                       ? AppColor.tagRed
//                                       : Colors
//                                           .white) // Red for even system messages, white for odd with grey border
//                                   : Colors.white)
//                               : (message.isSystem && index % 2 != 0
//                                   ? Colors
//                                       .white // White fill when border is grey
//                                   : AppColor.greyText.withOpacity(
//                                       0.5)), // Pink for other containers when not live
//                           borderRadius: BorderRadius.circular(20),
//                           border: message.isSystem && index % 2 != 0
//                               ? Border.all(
//                                   color: Colors.grey.withOpacity(
//                                       0.4)) // Grey border for odd-index system messages
//                               : null,
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             CircleAvatar(
//                               radius: 12,
//                               backgroundImage: CachedNetworkImageProvider(
//                                 message.imageUrl,
//                               ),
//                             ),
//                             const SizedBox(width: 8),
//                             Expanded(
//                               child: Text(
//                                 message.text,
//                                 style: TextStyle(
//                                   color: _isLive
//                                       ? (message.isSystem
//                                           ? (index % 2 == 0
//                                               ? Colors.white
//                                               : Colors.black)
//                                           : Colors.black)
//                                       : Colors.black,
//                                   fontSize: 10,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                                 softWrap: true,
//                                 overflow: TextOverflow.visible,
//                               ),
//                             ),
//                             if (message.isSystem) ...[
//                               const SizedBox(width: 5),
//                               Icon(
//                                 index % 2 == 0
//                                     ? Icons.arrow_forward_ios
//                                     : Icons.emoji_emotions_sharp,
//                                 color: index % 2 == 0
//                                     ? Colors.white
//                                     : Colors.yellow,
//                                 size: index % 2 == 0 ? 12.0 : 24.0,
//                               ),
//                             ],
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),

//           // "Go Live" Button
//           if (!_isLive)
//             Container(
//                 padding: const EdgeInsets.symmetric(vertical: 8),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: CustomButton(
//                     buttonText: "Go live now",
//                     onPressed: _goLive,
//                   ),
//                 )),

//           if (_isLive)
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 8),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     CircleAssetIconButton(
//                       imagePath: AppImages.redmsg,
//                       borderColor: AppColor.dividerClr,
//                       onTap: () {
//                         InputBottomSheet.open(
//                           context: context,
//                           controller: _controller,
//                           onSend: _sendMessage,
//                         );
//                       },
//                     ),
//                     const SizedBox(width: 8),
//                     CircleAssetIconButton(
//                       imagePath: AppImages.dotmenu,
//                       borderColor: AppColor.dividerClr,
//                       onTap: () {
//                         // Handle tap
//                       },
//                     ),
//                     const SizedBox(width: 8),
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           isMicOn = !isMicOn; // Toggle the microphone status
//                         });
//                       },
//                       child: Container(
//                           height: 32,
//                           width: 32,
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Theme.of(context).colorScheme.surface,
//                               border: Border.all(color: AppColor.dividerClr)),
//                           child: Center(
//                             child: Icon(
//                               isMicOn ? Icons.mic : Icons.mic_off_rounded,
//                               color: colorScheme(context).primary,
//                               size: 22,
//                             ),
//                           )),
//                     ),
//                     const SizedBox(width: 8),
//                     CircleAssetIconButton(
//                       imagePath: AppImages.camera,
//                       borderColor: AppColor.dividerClr,
//                       onTap: () {
//                         showModalBottomSheet(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return ScreenRecordSheet();
//                           },
//                           isScrollControlled: true,
//                         );
//                       },
//                     ),
//                     const Spacer(),
//                     CircleAssetIconButton(
//                       imagePath: AppImages.shareImage,
//                       fillColor: AppColor.offWhite,
//                       borderColor: AppColor.dividerClr,
//                       onTap: () {
//                         showModalBottomSheet(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return CustomToolBottomSheet(); // Custom Bottom Sheet
//                           },
//                           isScrollControlled: true,
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }








import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/features/game_streamer/model/chat_model.dart';
import 'package:flutter_application_zestilive/src/features/game_streamer/widgets/custom_icon_box.dart';
import 'package:flutter_application_zestilive/src/features/game_streamer/widgets/custom_tools_bottom_sheet.dart';
import 'package:flutter_application_zestilive/src/features/gift_user_view/widget/gift_custom_container.dart';
import 'package:flutter_application_zestilive/src/features/pc_live_userview/widgets/custom_chat_sheet.dart.dart';
import 'package:flutter_application_zestilive/src/features/user_view/widgets/custom_screen_record_sheet.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class PcScreenSetupPage extends StatefulWidget {
  final Map<String, String>? selectedGame;

  const PcScreenSetupPage({Key? key, this.selectedGame}) : super(key: key);

  @override
  State<PcScreenSetupPage> createState() => _PcScreenSetupPageState();
}

class _PcScreenSetupPageState extends State<PcScreenSetupPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _anicontroller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Step 1: Initialize Animation Controller
    _anicontroller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500), // Animation duration
    );

    // Step 2: Define the Slide Animation
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-0.9, 0), // Start completely off-screen on the left
      end: const Offset(0.0, 0), // End at the center of the screen
    ).animate(
      CurvedAnimation(
        parent: _anicontroller,
        curve: Curves.easeInOut, // Smooth transition
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller
    super.dispose();
  }

  final List<String> items = List.generate(20, (index) => "Item $index");

  bool _isLive = false; // To track if the "Go Live" button is clicked
  bool isMicOn = false;

  final TextEditingController _controller = TextEditingController();
  List<Message> messages = [
    Message(
      text: "Ankush joined the LIVE",
      isSystem: true,
      imageUrl:
          "https://plus.unsplash.com/premium_photo-1682089892133-556bde898f2c?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW5kaWFuJTIwYm95fGVufDB8fDB8fHww", // replace with actual URL
      // replace with actual URL
    ),
    Message(
      text: "The broadcaster invites you to join a PK",
      isSystem: true,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfK9GK_Keg7C3X619IbFCJm3TBgOEKGAU27A&s',
    ),
    Message(
      text: "Ankush joined the LIVE",
      isSystem: true,
      imageUrl:
          "https://plus.unsplash.com/premium_photo-1682089892133-556bde898f2c?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW5kaWFuJTIwYm95fGVufDB8fDB8fHww", // replace with actual URL
    ),
    Message(
      text: "The broadcaster invites you to join a PK",
      isSystem: true,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfK9GK_Keg7C3X619IbFCJm3TBgOEKGAU27A&s',
    ),
    Message(
      text: "Ankush joined the LIVE",
      isSystem: true,
      imageUrl:
          "https://plus.unsplash.com/premium_photo-1682089892133-556bde898f2c?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW5kaWFuJTIwYm95fGVufDB8fDB8fHww", // replace with actual URL
    ),
    Message(
      text: "The broadcaster invites you to join a PK",
      isSystem: true,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfK9GK_Keg7C3X619IbFCJm3TBgOEKGAU27A&s',
    ),
  ];

  // Function to handle "Go Live" button click
  void _goLive() {
    setState(() {
      _isLive = true; // Switch to live mode
    });
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        String userImageUrl =
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT76ecHFwkxt3hYWiVdLs54DYZuR8mSFzx4LxJzChwIwRLBWj3BIcw8lPRsuB8j8GCD0c4&usqp=CAU';

        messages.insert(
          0,
          Message(
            text: _controller.text,
            isSystem: false,
            imageUrl: userImageUrl,
          ),
        );
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    var m = MediaQuery.of(context).size;
    final double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Conditionally show either the GiftCustomContainer or the simple Container

          _isLive
              ? GiftCustomContainer(
                  height: m.height * 0.15,
                  width: double.infinity,
                  color: colorScheme(context).primary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 35,
                        ),
                        Row(
                          children: [
                            Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                GiftCustomContainer(
                                  height: 35,
                                  borderRadius: 100,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  color: AppColor.appYellow,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 35.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Enrique Pemala',
                                          style: textTheme(context)
                                              .bodySmall
                                              ?.copyWith(
                                                  fontSize: 10,
                                                  color: colorScheme(context)
                                                      .onSurface,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              AppImages.giftDiamond,
                                              height: 16,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '8811M',
                                              style: textTheme(context)
                                                  .bodySmall
                                                  ?.copyWith(
                                                      fontSize: 10,
                                                      color:
                                                          colorScheme(context)
                                                              .onSurface,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 4.0),
                                      child: Image.asset(
                                        AppImages.onboardFirsttwo,
                                        height: 33,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                    Image.asset(
                                      AppImages.giftUserLevel,
                                      height: 40,
                                      alignment: Alignment.center,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 40.0),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(
                                        AppImages.onboardFirsttwo,
                                        height: 33,
                                        alignment: Alignment.center,
                                      ),
                                      Image.asset(
                                        AppImages.giftLevelBadgesTwo,
                                        height: 40,
                                        alignment: Alignment.center,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(
                                        AppImages.onboardFirstthree,
                                        height: 33,
                                        alignment: Alignment.center,
                                      ),
                                      Image.asset(
                                        AppImages.giftLevelBadgesThree,
                                        height: 40,
                                        alignment: Alignment.center,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0.0),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Image.asset(
                                          AppImages.onboardFirsttwo,
                                          height: 33,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                      Image.asset(
                                        AppImages.giftLevelBadges,
                                        height: 40,
                                        alignment: Alignment.center,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Row(
                                children: List.generate(3, (index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: colorScheme(context)
                                      .onSurface
                                      .withOpacity(.40),
                                  child: Center(
                                    child: index == 1
                                        ? Text(
                                            '307',
                                            style: textTheme(context)
                                                .bodySmall
                                                ?.copyWith(
                                                  fontSize: 10,
                                                  color: colorScheme(context)
                                                      .surface,
                                                ),
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              if (index == 2) {
                                                // Action for blackShareIcon
                                                print(
                                                    "Black Share Icon Tapped");
                                                // Add your specific functionality here

                                                context.pop();
                                              } else {
                                                // Action for clearIcon
                                                print("Clear Icon Tapped");

                                                // Add your specific functionality here
                                              }
                                            },
                                            child: SvgPicture.asset(
                                              index == 0
                                                  ? AppIcons.blackShareIcon
                                                  : AppIcons.clearIcon,
                                              color:
                                                  colorScheme(context).surface,
                                            ),
                                          ),
                                  ),
                                ),
                              );
                            }))
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  gradient: LinearGradient(colors: [
                                    AppColor.giftGradientOne,
                                    AppColor.giftGradientTwo
                                  ])),
                              child: Row(
                                children: [
                                  Image.asset(
                                    AppImages.giftTopFan,
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Top Fans',
                                    style: textTheme(context)
                                        .bodySmall
                                        ?.copyWith(
                                            color: colorScheme(context).surface,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            GiftCustomContainer(
                              borderRadius: 100,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5.8),
                              color: colorScheme(context)
                                  .onSurface
                                  .withOpacity(.40),
                              child: Row(
                                children: [
                                  Text(
                                    'For You',
                                    style: textTheme(context)
                                        .bodySmall
                                        ?.copyWith(
                                          color: colorScheme(context).surface,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: colorScheme(context).surface,
                                    size: 15,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        )
                      ],
                    ),
                  ),
                )
              : GiftCustomContainer(
                  height: m.height * 0.13,
                  width: double.infinity,
                  color: colorScheme(context).primary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                GiftCustomContainer(
                                  height: 35,
                                  borderRadius: 100,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  color: AppColor.appYellow,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 35.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Enrique Pemala',
                                          style: textTheme(context)
                                              .bodySmall
                                              ?.copyWith(
                                                  fontSize: 10,
                                                  color: colorScheme(context)
                                                      .onSurface,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              AppImages.giftDiamond,
                                              height: 16,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '8811M',
                                              style: textTheme(context)
                                                  .bodySmall
                                                  ?.copyWith(
                                                      fontSize: 10,
                                                      color:
                                                          colorScheme(context)
                                                              .onSurface,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 4.0),
                                      child: Image.asset(
                                        AppImages.onboardFirsttwo,
                                        height: 33,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                    Image.asset(
                                      AppImages.giftUserLevel,
                                      height: 40,
                                      alignment: Alignment.center,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: colorScheme(context)
                                  .onSurface
                                  .withOpacity(0.40),
                              child: GestureDetector(
                                onTap: () {
                                  context.pushNamed(AppRoute.mobileLivePage);
                                  // context.pop();
                                  // Add the desired functionality here
                                  print("Clear icon tapped");
                                },
                                child: Center(
                                  child: SvgPicture.asset(
                                    AppIcons
                                        .clearIcon, // Assuming clearIcon is the path to your SVG file
                                    color: colorScheme(context).surface,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    AppImages.pclive,
                    fit: BoxFit.cover,
                    width: width,
                    height: 180,
                  ),
                  if (_isLive)
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SlideTransition(
                            position: _slideAnimation, // Animate the position

                            child: Row(
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 100,
                                  child: AbsorbPointer(
                                    child: TextFormField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        hintText:
                                            widget.selectedGame?['name'] ??
                                                'Categories',
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              if (widget.selectedGame != null)
                                                Image.asset(
                                                  widget
                                                      .selectedGame!['image']!,
                                                  width: 24,
                                                  height: 24,
                                                ),
                                              if (widget.selectedGame != null)
                                                const SizedBox(width: 6),
                                              Expanded(
                                                child: Text(
                                                  widget.selectedGame?[
                                                          'name'] ??
                                                      'Categories',
                                                  style: TextStyle(
                                                    color: widget
                                                                .selectedGame ==
                                                            null
                                                        ? Colors.black
                                                            .withOpacity(0.9)
                                                        : Colors.black,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: AppColor.dividerClr,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(6),
                                              bottomLeft: Radius.circular(6)),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (_anicontroller.status ==
                                        AnimationStatus.completed) {
                                      _anicontroller
                                          .reverse(); // Reverse animation
                                    } else {
                                      _anicontroller
                                          .forward(); // Start animation
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      color: AppColor.dividerClr,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(6),
                                          bottomRight: Radius.circular(6)),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.red,
                                      size: 12,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 102,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  AppColor.lightOrange,
                                  AppColor.darkOrange,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8.0, top: 6),
                                  child: Image.asset(
                                    AppImages.feather,
                                    width: 24,
                                    height: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Wish List',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            color: colorScheme(context).surface,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Add',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.copyWith(
                                                color: colorScheme(context)
                                                    .surface,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        const Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                          size: 10,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              Stack(
                children: [
                  Image.asset(
                    AppImages.streamer,
                    fit: BoxFit.cover,
                    width: width,
                    height: 180,
                  ),
                  Positioned(
                      top: 10,
                      right: 10,
                      child: SvgPicture.asset(AppIcons.dblarrow))
                ],
              ),
            ],
          ),
          // Chat section with alternate colors when not live
          Expanded(
            child: Container(
              child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return Align(
                    alignment: message.isSystem
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 80),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                          color: _isLive
                              ? (message.isSystem
                                  ? (index % 2 == 0
                                      ? AppColor.tagRed
                                      : Colors
                                          .white) // Red for even system messages, white for odd with grey border
                                  : Colors.white)
                              : (message.isSystem && index % 2 != 0
                                  ? Colors
                                      .white // White fill when border is grey
                                  : AppColor.greyText.withOpacity(
                                      0.5)), // Pink for other containers when not live
                          borderRadius: BorderRadius.circular(20),
                          border: message.isSystem && index % 2 != 0
                              ? Border.all(
                                  color: Colors.grey.withOpacity(
                                      0.4)) // Grey border for odd-index system messages
                              : null,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundImage: CachedNetworkImageProvider(
                                message.imageUrl,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                message.text,
                                style: TextStyle(
                                  color: _isLive
                                      ? (message.isSystem
                                          ? (index % 2 == 0
                                              ? Colors.white
                                              : Colors.black)
                                          : Colors.black)
                                      : Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                            if (message.isSystem) ...[
                              const SizedBox(width: 5),
                              Icon(
                                index % 2 == 0
                                    ? Icons.arrow_forward_ios
                                    : Icons.emoji_emotions_sharp,
                                color: index % 2 == 0
                                    ? Colors.white
                                    : Colors.yellow,
                                size: index % 2 == 0 ? 12.0 : 24.0,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // "Go Live" Button
          if (!_isLive)
            Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomButton(
                    buttonText: "Go live now",
                    onPressed: _goLive,
                  ),
                )),

          if (_isLive)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAssetIconButton(
                      imagePath: AppImages.redmsg,
                      borderColor: AppColor.dividerClr,
                      onTap: () {
                        InputBottomSheet.open(
                          context: context,
                          controller: _controller,
                          onSend: _sendMessage,
                        );
                      },
                    ),
                    const SizedBox(width: 8),
                    CircleAssetIconButton(
                      imagePath: AppImages.dotmenu,
                      borderColor: AppColor.dividerClr,
                      onTap: () {
                        // Handle tap
                      },
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isMicOn = !isMicOn; // Toggle the microphone status
                        });
                      },
                      child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).colorScheme.surface,
                              border: Border.all(color: AppColor.dividerClr)),
                          child: Center(
                            child: Icon(
                              isMicOn ? Icons.mic : Icons.mic_off_rounded,
                              color: colorScheme(context).primary,
                              size: 22,
                            ),
                          )),
                    ),
                    const SizedBox(width: 8),
                    CircleAssetIconButton(
                      imagePath: AppImages.camera,
                      borderColor: AppColor.dividerClr,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return ScreenRecordSheet();
                          },
                          isScrollControlled: true,
                        );
                      },
                    ),
                    const Spacer(),
                    CircleAssetIconButton(
                      imagePath: AppImages.shareImage,
                      fillColor: AppColor.offWhite,
                      borderColor: AppColor.dividerClr,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomToolBottomSheet(); // Custom Bottom Sheet
                          },
                          isScrollControlled: true,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
