// import 'package:flutter/material.dart';
// import 'package:flutter_application_zestilive/src/features/pk/provider/pk_match_screen_provider.dart';
// import 'package:flutter_application_zestilive/src/features/pk/widgets/fans_bottom_sheet.dart';
// import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import '../../../common/const/app_colors.dart';
// import '../../../common/const/app_images.dart';
// import '../../../common/const/global_variables.dart';
// import '../clipper/timeclipper.dart';

// class PkMatchHeader extends StatefulWidget {
//   const PkMatchHeader({
//     super.key,
//   });

//   @override
//   State<PkMatchHeader> createState() => _PkMatchHeaderState();
// }

// class _PkMatchHeaderState extends State<PkMatchHeader> {
//   late int endTime;

//   @override
//   void initState() {
//     super.initState();
//     endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 10;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final pkMatchProvider = Provider.of<PkMatchProvider>(context, listen: true);

//     final double width = MediaQuery.of(context).size.width;
//     return SizedBox(
//       height: 300,
//       child: Stack(
//         children: [
//           Container(
//             height: 40,
//             width: double.infinity,
//             color: colorScheme(context).primary,
//             child: Row(
//               children: [
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     showModalBottomSheet(
//                       context: context,
//                       isScrollControlled: true,
//                       builder: (context) {
//                         return const FansTabBottomSheet();
//                       },
//                     );
//                   },
//                   child: Container(
//                     height: 22,
//                     padding: const EdgeInsets.all(4),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(18),
//                       color: AppColor.appYellow,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         SvgPicture.asset(AppIcons.zircon),
//                         const SizedBox(
//                           width: 2,
//                         ),
//                         Text(
//                           '4523653',
//                           style: textTheme(context)
//                               .labelSmall
//                               ?.copyWith(letterSpacing: 0),
//                         ),
//                         const SizedBox(
//                           width: 2,
//                         ),
//                         const Icon(
//                           Icons.arrow_upward_rounded,
//                           size: 12,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(4),
//                   height: 22,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(18),
//                     color: AppColor.appYellow,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       SvgPicture.asset(AppIcons.starBlue),
//                       const SizedBox(
//                         width: 2,
//                       ),
//                       Text(
//                         '45 stars',
//                         style: textTheme(context)
//                             .labelSmall
//                             ?.copyWith(letterSpacing: 0),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Positioned(
//             top: 40,
//             left: 0,
//             right: 0,
//             child: SizedBox(
//               height: 236,
//               child: Row(
//                 children: [
//                   SizedBox(
//                       width: width / 2,
//                       child: Image.asset(
//                         AppImages.videoCard,
//                         fit: BoxFit.cover,
//                       )),
//                   SizedBox(
//                       width: width / 2,
//                       child: Image.asset(
//                         AppImages.videoCard,
//                         fit: BoxFit.cover,
//                       ))
//                 ],
//               ),
//             ),
//           ),
//           //egg slider
//           Positioned(
//             right: 10,
//             top: 15,
//             child: SizedBox(
//               height: 65,
//               width: 43,
//               child: Column(
//                 children: [
//                   // PageView.builder
//                   Expanded(
//                     child: PageView.builder(
//                       controller: pkMatchProvider.pageController,
//                       itemCount: 3,
//                       onPageChanged: (index) {
//                         pkMatchProvider.setCurrentPage(index);
//                       },
//                       itemBuilder: (_, index) {
//                         return SizedBox(
//                           height: 60,
//                           width: 42,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Image.asset(
//                                 AppImages.eggSlider,
//                                 height: 37,
//                                 width: 34,
//                               ),
//                               Container(
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(18),
//                                     color: AppColor.tagBlue),
//                                 child: Center(
//                                   child: Text(
//                                     'Lv $index',
//                                     style: textTheme(context)
//                                         .labelSmall
//                                         ?.copyWith(
//                                             color:
//                                                 colorScheme(context).onPrimary,
//                                             fontSize: 8,
//                                             letterSpacing: 0),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 6),
//                   // SmoothPageIndicator
//                   SmoothPageIndicator(
//                     controller: pkMatchProvider.pageController,
//                     count: 3,
//                     effect: WormEffect(
//                       dotHeight: 6,
//                       dotWidth: 6,
//                       spacing: 4,
//                       activeDotColor: colorScheme(context).surface,
//                       dotColor: colorScheme(context).surface.withOpacity(0.5),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//               left: (width / 2) + 10,
//               top: 50,
//               child: Container(
//                 height: 22,
//                 width: 80,
//                 padding: const EdgeInsets.all(4),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(18),
//                   color: colorScheme(context).surface,
//                 ),
//                 child: Row(
//                   children: [
//                     SvgPicture.asset(AppIcons.fireIcon),
//                     const SizedBox(
//                       width: 3,
//                     ),
//                     SizedBox(
//                       width: 40,
//                       child: Text(
//                         'Rocky ashashaus',
//                         overflow: TextOverflow.ellipsis,
//                         style: textTheme(context)
//                             .labelSmall
//                             ?.copyWith(letterSpacing: 0),
//                       ),
//                     ),
//                     const Spacer(),
//                     const SizedBox(
//                       width: 3,
//                     ),
//                     Icon(
//                       Icons.add_circle_rounded,
//                       size: 14,
//                       color: colorScheme(context).primary,
//                     ),
//                   ],
//                 ),
//               )),
//           Positioned(
//             bottom: 35,
//             left: 25,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: CircleAvatar(
//                       backgroundColor: Colors.transparent,
//                       foregroundImage:
//                           const AssetImage(AppImages.groupFrameFive),
//                       radius: 17,
//                       child: Padding(
//                         padding: const EdgeInsets.all(2),
//                         child: ClipRRect(
//                             borderRadius: BorderRadius.circular(100),
//                             child: Image.network(AppImages.allPopularScreen)),
//                       )),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: CircleAvatar(
//                       backgroundColor: Colors.transparent,
//                       foregroundImage:
//                           const AssetImage(AppImages.groupFrameFour),
//                       radius: 17,
//                       child: Padding(
//                         padding: const EdgeInsets.all(2),
//                         child: ClipRRect(
//                             borderRadius: BorderRadius.circular(100),
//                             child: Image.network(AppImages.allPopularScreen)),
//                       )),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: CircleAvatar(
//                       backgroundColor: Colors.transparent,
//                       foregroundImage:
//                           const AssetImage(AppImages.groupFrameThree),
//                       radius: 17,
//                       child: Padding(
//                         padding: const EdgeInsets.all(2),
//                         child: ClipRRect(
//                             borderRadius: BorderRadius.circular(100),
//                             child: Image.network(AppImages.allPopularScreen)),
//                       )),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 35,
//             right: 25,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: CircleAvatar(
//                       backgroundColor: Colors.transparent,
//                       foregroundImage:
//                           const AssetImage(AppImages.groupFrameTwo),
//                       radius: 17,
//                       child: Padding(
//                         padding: const EdgeInsets.all(2),
//                         child: ClipRRect(
//                             borderRadius: BorderRadius.circular(100),
//                             child: Image.network(AppImages.allPopularScreen)),
//                       )),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: CircleAvatar(
//                       backgroundColor: Colors.transparent,
//                       foregroundImage:
//                           const AssetImage(AppImages.groupFrameFive),
//                       radius: 17,
//                       child: Padding(
//                         padding: const EdgeInsets.all(2),
//                         child: ClipRRect(
//                             borderRadius: BorderRadius.circular(100),
//                             child: Image.network(AppImages.allPopularScreen)),
//                       )),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: CircleAvatar(
//                       backgroundColor: Colors.transparent,
//                       foregroundImage:
//                           const AssetImage(AppImages.groupFrameSix),
//                       radius: 17,
//                       child: Padding(
//                         padding: const EdgeInsets.all(2),
//                         child: ClipRRect(
//                             borderRadius: BorderRadius.circular(100),
//                             child: Image.network(AppImages.allPopularScreen)),
//                       )),
//                 ),
//               ],
//             ),
//           ), //timer
//           Positioned(
//               left: (width / 2) - 37,
//               bottom: 28,
//               child: ClipPath(
//                 clipper: TimerClipper(),
//                 child: Container(
//                   width: 78,
//                   height: 22,
//                   decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius:
//                           BorderRadius.vertical(top: Radius.circular(15))),
//                   child: Center(
//                     child: CountdownTimer(
//                       endWidget: Text(
//                         'Time up',
//                         style: textTheme(context).labelSmall,
//                       ),
//                       endTime: endTime,
//                       onEnd: () {
//                         showDialog(
//                           context: context,
//                           builder: (context) => AlertDialog(
//                             title: const Text('Time is up!'),
//                             content: const Text('The countdown has finished.'),
//                             actions: [
//                               TextButton(
//                                 onPressed: () {
//                                   context.pop();
//                                 },
//                                 child: const Text('OK'),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                       textStyle:
//                           const TextStyle(fontSize: 10, color: Colors.red),
//                     ),
//                   ),
//                 ),
//               )),
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Row(
//                   children: [
//                     SvgPicture.asset(AppIcons.starBlue),
//                     const SizedBox(
//                       width: 4,
//                     ),
//                     Text(Provider.of<PkMatchProvider>(context)
//                         .leftVotes
//                         .toString())
//                   ],
//                 ),
//                 Container(
//                   height: 24,
//                   width: 234,
//                   decoration: BoxDecoration(
//                       color: AppColor.tagBlue,
//                       borderRadius: const BorderRadius.vertical(
//                           bottom: Radius.circular(30))),
//                   child: Center(
//                       child: Text(
//                     'lose punishmnet set by winner',
//                     style: textTheme(context).labelSmall?.copyWith(
//                         letterSpacing: 0,
//                         color: colorScheme(context).onPrimary),
//                   )),
//                 ),
//                 Row(
//                   children: [
//                     Text(Provider.of<PkMatchProvider>(context)
//                         .rightVotes
//                         .toString()),
//                     const SizedBox(
//                       width: 4,
//                     ),
//                     SvgPicture.asset(AppIcons.starYellow),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//               height: 15,
//               width: width,
//               bottom: 18,
//               child: Consumer<PkMatchProvider>(
//                 builder: (context, pkMatchProvider, child) {
//                   return Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Row(
//                         children: <Widget>[
//                           Expanded(
//                             flex: (Provider.of<PkMatchProvider>(context)
//                                         .sliderValue *
//                                     1000)
//                                 .round(),
//                             child: Container(
//                               height: 6,
//                               decoration: BoxDecoration(
//                                   color: AppColor.lightgreenslider),
//                             ),
//                           ),
//                           Expanded(
//                             flex: ((1 -
//                                         Provider.of<PkMatchProvider>(context)
//                                             .sliderValue) *
//                                     1000)
//                                 .round(),
//                             child: Container(
//                               height: 6,
//                               decoration: BoxDecoration(
//                                   color: AppColor.darkgreenslider),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Positioned(
//                         left: (width *
//                                 Provider.of<PkMatchProvider>(context)
//                                     .sliderValue) -
//                             10,
//                         child: CircleAvatar(
//                           radius: 6,
//                           backgroundColor: colorScheme(context).surface,
//                           child: Container(
//                             decoration: const BoxDecoration(
//                               shape: BoxShape.circle,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               )),
//         ],
//       ),
//     );
//   }
// }
