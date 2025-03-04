
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/game_streamer/model/chat_model.dart';
import 'package:flutter_application_zestilive/src/features/game_streamer/widgets/custom_icon_box.dart';
import 'package:flutter_application_zestilive/src/features/game_streamer/widgets/custom_tools_bottom_sheet.dart';

class StreamerPage extends StatefulWidget {
  const StreamerPage({super.key});

  @override
  State<StreamerPage> createState() => _StreamerPageState();
}

class _StreamerPageState extends State<StreamerPage> {
  final List<String> items = List.generate(20, (index) => "Item $index");

  bool isMicOn = false;

  bool showChat = true; // Flag to control chat visibility
  final TextEditingController _controller = TextEditingController();
  List<Message> messages = [
    Message(
      text: "Ankush joined the LIVE",
      isSystem: true,
      imageUrl:
          "https://plus.unsplash.com/premium_photo-1682089892133-556bde898f2c?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW5kaWFuJTIwYm95fGVufDB8fDB8fHww",
    ),
    Message(
      text: "The broadcaster invites you to join a PK",
      isSystem: true,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfK9GK_Keg7C3X619IbFCJm3TBgOEKGAU27A&s',
    ),
  ];

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
      _controller.clear(); // Clear the text field after sending
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    // Reset the orientation to allow both landscape and portrait modes when exiting this page
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          bool isLandscape = orientation == Orientation.landscape;
          return Stack(
            children: [
              Image.asset(
                AppImages.streamer,
                fit: BoxFit.cover,
                width: width,
                height: height,
              ),
              Positioned(
                top: 30,
                left: 16,
                child: Row(
                  children: [
                    CircleAssetIconButton(
                      fillColor:
                          colorScheme(context).onSurface.withOpacity(0.5),
                      imagePath: AppImages.whitemsg,
                      onTap: () {
                        setState(() {
                          showChat = !showChat; // Toggle chat visibility
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    InkWell(
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
                          color:
                              colorScheme(context).onSurface.withOpacity(0.5),
                        ),
                        child: Center(
                          child: Icon(
                            isMicOn
                                ? Icons.mic
                                : Icons.mic_off_rounded, // Toggle mic icon
                            color: isMicOn
                                ? Colors.white // Mic is on, show in white
                                : colorScheme(context)
                                    .primary, // Mic is off, show in red

                            size: 22,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () {
                        // showModalBottomSheet(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return CustomToolBottomSheet(); // Custom Bottom Sheet
                        //   },
                        //   isScrollControlled:
                        //       true, // Allow scrolling for bottom sheet
                        // );
                        // Handle tap
                      },
                      child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).colorScheme.surface,
                              border: Border.all(color: AppColor.dividerClr)),
                          child: Image.asset(
                            AppImages.gamepad,
                          )),
                    ),
                  ],
                ),
              ),
              if (isLandscape)
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: showChat
                        ? Container(
                            key: ValueKey(1),
                            width: width * 0.4,
                            color: Colors.black.withOpacity(0.6),
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Chat',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.close,
                                          color: Colors.white),
                                      onPressed: () {
                                        setState(() {
                                          showChat = false; // Hide chat section
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                const Divider(color: Colors.white),
                                Expanded(
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
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 50),
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 2),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 4, vertical: 2),
                                            decoration: BoxDecoration(
                                              color: message.isSystem
                                                  ? (index % 2 == 0
                                                      ? Colors.red
                                                      : Colors.white)
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: message.isSystem &&
                                                      index % 2 != 0
                                                  ? Border.all(
                                                      color: Colors.grey
                                                          .withOpacity(0.4))
                                                  : null,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                CircleAvatar(
                                                  radius: 12,
                                                  backgroundImage:
                                                      CachedNetworkImageProvider(
                                                    message.imageUrl,
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
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
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    softWrap: true,
                                                    overflow:
                                                        TextOverflow.visible,
                                                  ),
                                                ),
                                                if (message.isSystem) ...[
                                                  const SizedBox(width: 5),
                                                  Icon(
                                                    index % 2 == 0
                                                        ? Icons
                                                            .arrow_forward_ios
                                                        : Icons
                                                            .emoji_emotions_sharp,
                                                    color: index % 2 == 0
                                                        ? Colors.white
                                                        : Colors.yellow,
                                                    size: index % 2 == 0
                                                        ? 12.0
                                                        : 24.0,
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
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 12,
                                      backgroundImage:
                                          AssetImage(AppImages.framegirl),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: TextField(
                                        controller: _controller,
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                          hintText: "Send a message",
                                          hintStyle: TextStyle(
                                              color: Colors.grey, fontSize: 14),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: _sendMessage,
                                      child: Text(
                                        "Send",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : SizedBox.shrink(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
