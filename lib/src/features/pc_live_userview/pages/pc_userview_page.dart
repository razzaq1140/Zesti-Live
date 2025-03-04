import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/game_streamer/model/chat_model.dart';
import 'package:flutter_application_zestilive/src/features/game_streamer/widgets/custom_icon_box.dart';
import 'package:flutter_application_zestilive/src/features/gift_user_view/widget/gift_custom_container.dart';
import 'package:flutter_application_zestilive/src/features/pc_live_userview/widgets/custom_chat_sheet.dart.dart';
import 'package:flutter_application_zestilive/src/features/user_view/widgets/custom_screen_record_sheet.dart';
import 'package:flutter_application_zestilive/src/features/user_view/widgets/custom_userview_bottomsheet.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class PcUserviewPage extends StatefulWidget {
  const PcUserviewPage({super.key});

  @override
  State<PcUserviewPage> createState() => _PcUserviewPageState();
}

class _PcUserviewPageState extends State<PcUserviewPage> {
  final List<String> items = List.generate(20, (index) => "Item $index");
  final TextEditingController _controller = TextEditingController();
  List<Message> messages = [
    Message(
        text: "Ankush joined the LIVE",
        isSystem: true,
        imageUrl:
            "https://plus.unsplash.com/premium_photo-1682089892133-556bde898f2c?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW5kaWFuJTIwYm95fGVufDB8fDB8fHww"),
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
            "https://plus.unsplash.com/premium_photo-1682089892133-556bde898f2c?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW5kaWFuJTIwYm95fGVufDB8fDB8fHww"),
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


  void _openInputBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            color: AppColor.dividerClr.withOpacity(0.6),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      hintStyle:
                          TextStyle(fontSize: 14, color: AppColor.greyText),
                      suffixIcon: GestureDetector(
                        onTap: _sendMessage,
                        child: const Icon(Icons.send, color: Colors.red),
                      ),
                      filled: true,
                      fillColor: AppColor.dividerClr.withOpacity(0.6),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  // Function to open the bottom sheet with input field
  

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
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      GiftCustomContainer(
        height: m.height * 0.15,
        width: double.infinity,
        color: colorScheme(context).primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              SizedBox(
                height: 36,
              ),
              Row(
                children: [
                  Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      GiftCustomContainer(
                        height: 35,
                        color: AppColor.appYellow,
                        borderRadius: 100,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 35.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Column on the left side
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: AppColor.appYellow,
                                    width: m.width * 0.13,
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      'Enrique Pemala',
                                      style: textTheme(context)
                                          .bodySmall
                                          ?.copyWith(
                                            fontSize: 9,
                                            color:
                                                colorScheme(context).onSurface,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        AppImages.giftDiamond,
                                        height: 13,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        '8811M',
                                        style: textTheme(context)
                                            .bodySmall
                                            ?.copyWith(
                                              fontSize: 9,
                                              color: colorScheme(context)
                                                  .onSurface,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // Row on the right side with two containers
                              Row(
                                children: [
                                  Image.asset(
                                    AppImages.purplebadge,
                                    height: 25,
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: AppColor.tagRed,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: colorScheme(context).surface,
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Image.asset(
                              AppImages.usergirl,
                              height: 28,
                              width: 33,
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
                              AppImages.framegirltwo,
                              height: 33,
                              alignment: Alignment.centerRight,
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
                              AppImages.frameboy,
                              height: 33,
                              alignment: Alignment.centerRight,
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
                                AppImages.framegirl,
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
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor:
                            colorScheme(context).onSurface.withOpacity(.40),
                        child: Center(
                          child: index == 1
                              ? Text(
                                  '307',
                                  style: textTheme(context).bodySmall?.copyWith(
                                        fontSize: 10,
                                        color: colorScheme(context).surface,
                                      ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    if (index == 0) {
                                      // Action for blackShareIcon
                                      print("Black Share Icon Tapped");
                                      // Add your specific functionality here
                                    } else {
                                      // Action for clearIcon
                                      print("Clear Icon Tapped");
                                      context.pop();
                                      // Add your specific functionality here
                                    }
                                  },
                                  child: SvgPicture.asset(
                                    index == 0
                                        ? AppIcons.blackShareIcon
                                        : AppIcons.clearIcon,
                                    color: colorScheme(context).surface,
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        gradient: LinearGradient(
                          colors: [
                            AppColor.lightOrange,
                            AppColor.anotherdarkOrange
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                        )),
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.topax,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Top Fans',
                          style: textTheme(context).bodySmall?.copyWith(
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
                    color: colorScheme(context).onSurface.withOpacity(.40),
                    child: Row(
                      children: [
                        Text(
                          'Rules',
                          style: textTheme(context).bodySmall?.copyWith(
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
              const SizedBox(
                height: 2,
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
              Positioned(
                  top: 12,
                  right: 0,
                  child: Container(
                    height: 32,
                    width: 60,
                    decoration: BoxDecoration(
                        color: colorScheme(context).surface.withOpacity(0.4),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Image.asset(AppImages.feather),
                    ),
//                     Row(
//                         children: List.generate(3, (index) {
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 2.0),
//                         child: CircleAvatar(
//                           radius: 15,
//                           backgroundColor:
//                               colorScheme(context).onSurface.withOpacity(.40),
//                           child: Center(
//                             child: index == 1
//                                 ? Text(
//                                     '307',
//                                     style: textTheme(context)
//                                         .bodySmall
//                                         ?.copyWith(
//                                           fontSize: 10,
//                                           color: colorScheme(context).surface,
//                                         ),
//                                   )
//                                 : GestureDetector(
//                                     onTap: () {
//                                       if (index == 0) {
//                                         // Action for blackShareIcon
//                                         print("Black Share Icon Tapped");
//                                         // Add your specific functionality here
//                                       } else {
//                                         // Action for clearIcon
//                                         print("Clear Icon Tapped");
//                                         context.pop();
//                                         // Add your specific functionality here
//                                       }
//                                     },
//                                     child: SvgPicture.asset(
//                                       index == 0
//                                           ? AppIcons.blackShareIcon
//                                           : AppIcons.clearIcon,
//                                       color: colorScheme(context).surface,
//                                     ),
//                                   ),
//                           ),
//                         ),
//                       );
//                     }))
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 3),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(100),
//                           gradient: LinearGradient(
//                             colors: [
//                               AppColor.lightOrange,
//                               AppColor.anotherdarkOrange
//                             ],
//                             begin: Alignment.topLeft,
//                             end: Alignment.topRight,
//                           )),
//                       child: Row(
//                         children: [
//                           Image.asset(
//                             AppImages.topax,
//                             height: 20,
//                           ),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           Text(
//                             'Top Fans',
//                             style: textTheme(context).bodySmall?.copyWith(
//                                 color: colorScheme(context).surface,
//                                 fontSize: 10,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ],
//                       ),

                  )),
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
    
      Expanded(
        child: Container(
          color: AppColor.dividerClr.withOpacity(0.6),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      color: message.isSystem
                          ? (index % 2 == 0 ? Colors.red : Colors.white)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: message.isSystem && index % 2 != 0
                          ? Border.all(color: Colors.grey.withOpacity(0.4))
                          : null,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Avatar Image
                        CircleAvatar(
                          radius: 12,
                          backgroundImage: CachedNetworkImageProvider(
                            message.imageUrl,
                          ),
//                           Icon(
//                             Icons.arrow_forward_ios_outlined,
//                             color: colorScheme(context).surface,
//                             size: 15,
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 2,
//                 ),
//               ],
//             ),
//           ),
//         ),

//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 Image.asset(
//                   AppImages.pclive,
//                   fit: BoxFit.cover,
//                   width: width,
//                   height: 180,
//                 ),
//                 Positioned(
//                     top: 12,
//                     right: 0,
//                     child: Container(
//                       height: 32,
//                       width: 60,
//                       decoration: BoxDecoration(
//                           color: colorScheme(context).surface.withOpacity(0.4),
//                           borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(15),
//                               bottomLeft: Radius.circular(15))),
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 6.0),
//                         child: Image.asset(AppImages.feather),
//                       ),
//                     )),
//               ],
//             ),
//             Stack(
//               children: [
//                 Image.asset(
//                   AppImages.streamer,
//                   fit: BoxFit.cover,
//                   width: width,
//                   height: 180,
//                 ),
//                 Positioned(
//                     top: 10,
//                     right: 10,
//                     child: SvgPicture.asset(AppIcons.dblarrow))
//               ],
//             ),
//           ],
//         ),

//         Expanded(
//           child: Container(
//             color: AppColor.dividerClr.withOpacity(0.6),
//             child: ListView.builder(
//               reverse: true,
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 final message = messages[index];

//                 return Align(
//                   alignment: message.isSystem
//                       ? Alignment.centerLeft
//                       : Alignment.centerRight,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10, right: 80),
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(vertical: 2),
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 4, vertical: 2),
//                       decoration: BoxDecoration(
//                         color: message.isSystem
//                             ? (index % 2 == 0 ? Colors.red : Colors.white)
//                             : Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                         border: message.isSystem && index % 2 != 0
//                             ? Border.all(color: Colors.grey.withOpacity(0.4))
//                             : null,
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           // Avatar Image
//                           CircleAvatar(
//                             radius: 12,
//                             backgroundImage: CachedNetworkImageProvider(
//                               message.imageUrl,

                        ),
                        const SizedBox(width: 8),
                        // Text for the message with line wrapping
                        Expanded(
                          child: Text(
                            message.text,
                            style: TextStyle(
                              color: message.isSystem
                                  ? (index % 2 == 0
                                      ? Colors.white
                                      : Colors.black)
                                  : Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                            softWrap: true, // Enable line break
                            overflow:
                                TextOverflow.visible, // Allow text to expand
                          ),
                        ),
                        // Show icon only if it's a system message
                        if (message.isSystem) ...[
                          const SizedBox(width: 5),
                          Icon(
                            index % 2 == 0
                                ? Icons.arrow_forward_ios
                                : Icons.emoji_emotions_sharp,
                            color:
                                index % 2 == 0 ? Colors.white : Colors.yellow,
                            size: index % 2 == 0
                                ? 12.0
                                : 24.0, // Set different sizes here
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

        // _isTyping
        //     ? Row(
        //         children: [
        //           Expanded(
        //             child: TextField(
        //               controller: _controller,
        //               decoration: InputDecoration(
        //                 hintText: "Type a message",
        //                 hintStyle:
        //                     TextStyle(fontSize: 14, color: AppColor.greyText),
        //                 hoverColor: colorScheme(context).primary,
        //                 suffixIcon: GestureDetector(
        //                   onTap: () {
        //                     _sendMessage();
        //                   },
        //                   child: const Icon(Icons.send, color: Colors.red),
        //                 ),
        //                 filled: true,
        //                 fillColor: AppColor.dividerClr.withOpacity(0.6),
        //                 border: const OutlineInputBorder(
        //                   borderSide: BorderSide.none,
        //                 ),
        //                 contentPadding: const EdgeInsets.symmetric(
        //                     horizontal: 16, vertical: 8),
        //               ),
        //             ),
        //           ),
        //         ],
        //       )
        //     : Container(),

        // Fixed bottom bar with icons
//         Container(
//           color: AppColor.dividerClr
//               .withOpacity(0.6), // Set a background color for the list view
//           padding: const EdgeInsets.symmetric(vertical: 8),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 CircleAssetIconButton(
//                   imagePath: AppImages.star,
//                   borderColor: AppColor.dividerClr,
//                   onTap: () {
//                     // Handle tap
//                   },
//                 ),
//                 const SizedBox(width: 8),
//                 CircleAssetIconButton(
//                   imagePath: AppImages.redmsg,
//                   borderColor: AppColor.dividerClr,
//                   onTap: _openInputBottomSheet,

//                   // onTap:   // () {
//                   //   setState(() {
//                   //     _isTyping = !_isTyping;
//                   //   });
//                   //   // Handle tap
//                   // },
//                 ),
//                 const SizedBox(width: 8),
//                 CircleAssetIconButton(
//                   imagePath: AppImages.dotmenu,
//                   borderColor: AppColor.dividerClr,
//                   onTap: () {
//                     // Handle tap
//                   },
//                 ),
//                 const SizedBox(width: 8),
//                 CircleAssetIconButton(
//                   imagePath: AppImages.camera,
//                   borderColor: AppColor.dividerClr,
//                   onTap: () {
//                     showModalBottomSheet(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return ScreenRecordSheet();
//                       },
//                       isScrollControlled: true,
//                     );
//                   },
//                 ),
//                 const Spacer(),
//                 CircleAssetIconButton(
//                   imagePath: AppImages.gift,
//                   fillColor: AppColor.lightPink,
//                   borderColor: AppColor.dividerClr,
//                   onTap: () {
//                     showModalBottomSheet(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return UserviewBottomsheet(); // Custom Bottom Sheet
//                       },
//                       isScrollControlled:
//                           true, // Allow scrolling for bottom sheet
//                     );
//                     // Handle tap
//                   },
//                 ),
//               ],
//             ),
      ),
    
      // _isTyping
      //     ? Row(
      //         children: [
      //           Expanded(
      //             child: TextField(
      //               controller: _controller,
      //               decoration: InputDecoration(
      //                 hintText: "Type a message",
      //                 hintStyle:
      //                     TextStyle(fontSize: 14, color: AppColor.greyText),
      //                 hoverColor: colorScheme(context).primary,
      //                 suffixIcon: GestureDetector(
      //                   onTap: () {
      //                     _sendMessage();
      //                   },
      //                   child: const Icon(Icons.send, color: Colors.red),
      //                 ),
      //                 filled: true,
      //                 fillColor: AppColor.dividerClr.withOpacity(0.6),
      //                 border: const OutlineInputBorder(
      //                   borderSide: BorderSide.none,
      //                 ),
      //                 contentPadding: const EdgeInsets.symmetric(
      //                     horizontal: 16, vertical: 8),
      //               ),
      //             ),
      //           ),
      //         ],
      //       )
      //     : Container(),
    
      // Fixed bottom bar with icons
      Container(
        color: AppColor.dividerClr
            .withOpacity(0.6), // Set a background color for the list view
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAssetIconButton(
                imagePath: AppImages.star,
                borderColor: AppColor.dividerClr,
                onTap: () {
                  // Handle tap
                },
              ),
              const SizedBox(width: 8),
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
                imagePath: AppImages.gift,
                fillColor: AppColor.lightPink,
                borderColor: AppColor.dividerClr,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return UserviewBottomsheet(); // Custom Bottom Sheet
                    },
                    isScrollControlled:
                        true, // Allow scrolling for bottom sheet
                  );
                  // Handle tap
                },
              ),
            ],
          ),
        ),
      ),
    ]));
  }
}
