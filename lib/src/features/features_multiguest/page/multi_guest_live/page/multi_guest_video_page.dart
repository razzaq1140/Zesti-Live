import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_textfield.dart';
import 'package:flutter_application_zestilive/src/features/youtube_bottom_sheet/provider/youtube_sheet_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import '../../../../../common/const/app_colors.dart';
import '../../../../../common/const/app_images.dart';
import '../../../../../common/const/global_variables.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../gift_user_view/widget/gift_custom_container.dart';
import '../widget/bottom_sheet/multiguest_bottom_sheet.dart';
import '../widget/dialogue/multiguest_dialogue.dart';

class MultiGuestVideoPage extends StatefulWidget {
  const MultiGuestVideoPage({super.key});

  @override
  State<MultiGuestVideoPage> createState() => _MultiGuestVideoPageState();
}

class _MultiGuestVideoPageState extends State<MultiGuestVideoPage> {
  bool isChatVisible = false;
  bool _isTyping = false;
  bool isMicOn = false;
  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages = [
    "The broadcaster invites you to join a PK",
    "The broadcaster PK",
    "The broadcaster",
    "The broadcaster PK",
    "The broadcaster",
    "The broadcaster invites you to join a PK",
    "The broadcaster PK",
    "The broadcaster",
    "The broadcaster PK",
    "The broadcaster",
  ];
  final ScrollController _scrollController = ScrollController();
  Set<int> selectedFriends = {};
  int _currentPage = 0;
  late VideoPlayerController _videoController;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network(
      'https://videos.pexels.com/video-files/8043623/8043623-sd_960_506_25fps.mp4',
    )..initialize().then((_) {
        setState(() {}); // Ensure the first frame is shown
      });
    Future.microtask(() {
      Provider.of<YoutubeSheetProvider>(context, listen: false)
          .initializePostList();
    });
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add(_messageController.text);
        _messageController.clear();
      });
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // @override
  // void initState() {
  //   super.initState();

  //   // Initialize the video controller

  // }

  @override
  void dispose() {
    _videoController.dispose(); // Dispose the video controller
    super.dispose();
  }

  void _togglePlayback() {
    setState(() {
      if (_videoController.value.isPlaying) {
        _videoController.pause();
        _isPlaying = false;
      } else {
        _videoController.play();
        _isPlaying = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                GiftCustomContainer(
                  width: double.infinity,
                  color: colorScheme(context).primary,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            _buildUserDetails(context),
                            const Spacer(),
                            _buildLevelBadges(context),
                            const SizedBox(width: 5),
                            _buildUserActions(context),
                            const SizedBox(height: 8),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(AppImages.topScores, height: 27),
                            _buildForYouButton(context),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(AppImages.wishList, height: 33),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            AspectRatio(
                              aspectRatio: 62 / 44,
                              child: _videoController.value.isInitialized
                                  ? VideoPlayer(_videoController)
                                  : Center(
                                      child: CircularProgressIndicator(),
                                    ),
                            ),
                            // if (!_videoController.value.isInitialized)
                            //   const Center(
                            //     child: CircularProgressIndicator(),
                            //   ),
                            if (_videoController.value.isPlaying)
                              GestureDetector(
                                onTap: _togglePlayback,
                                child: Icon(Icons.pause,
                                    color: colorScheme(context).surface,
                                    size: 50), // Show pause icon when playing
                              ),
                            if (!_videoController.value.isPlaying &&
                                _videoController.value.isInitialized)
                              GestureDetector(
                                onTap: _togglePlayback,
                                child: Icon(Icons.play_arrow,
                                    color: colorScheme(context).surface,
                                    size: 50), // Show play icon when paused
                              ),
                          ],
                        ),
                      ),
                    ),

                    // Padding(
                    //   padding: EdgeInsets.zero,
                    //   child: SizedBox(
                    //      height: 330,

                    //     child: Stack(
                    //       children: [
                    //         AspectRatio(
                    //           aspectRatio: _videoController.value.aspectRatio,
                    //           child: _videoController.value.isInitialized
                    //               ? VideoPlayer(_videoController)
                    //               : Center(
                    //                   child: CircularProgressIndicator(),
                    //                 ),
                    //         ),
                    //         Positioned(
                    //           bottom: 16,
                    //           right: 16,
                    //           child: FloatingActionButton(
                    //             backgroundColor: Colors.black.withOpacity(0.5),
                    //             onPressed: _togglePlayback,
                    //             child: Icon(
                    //               _isPlaying ? Icons.pause : Icons.play_arrow,
                    //               color: Colors.white,
                    //             ),
                    //           ),
                    //         ),

                    //       ],
                    //     ),
                    //   ),
                    // ),
                    //  Column(
                    // children: [
                    //   CachedNetworkImage(
                    //     imageUrl:
                    //         'https://recorder.easeus.com/images/en/screen-recorder/resource/kmplayer-free-media-player-for-windows-10.png',
                    //     fit: BoxFit.cover,
                    //     width: double.infinity,
                    //     height: 280,
                    //     placeholder: (context, url) => Center(
                    //       child: CircularProgressIndicator(),
                    //     ),
                    //     errorWidget: (context, url, error) => Center(
                    //       child: Icon(
                    //         Icons.error,
                    //         color: Colors.red,
                    //         size: 40,
                    //       ),
                    //     ),
                    //   ),
                    // SizedBox(
                    //   height: 100,
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         child: ListView.builder(
                    //           itemCount: 5,
                    //           padding: EdgeInsets.zero,
                    //           scrollDirection: Axis.horizontal,
                    //           itemBuilder: (context, index) => Container(
                    //             height: 90,
                    //             width: 100,
                    //             decoration: BoxDecoration(
                    //               color: Colors.black,
                    //               border: Border.all(
                    //                   color: Colors.white, width: 0.3),
                    //             ),
                    //             child: Center(
                    //               child: Icon(Icons.add,
                    //                   color: Colors.white, size: 28),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    //     ],
                    //   ),
                    // ),

                    SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: 5,
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Container(
                                height: 90,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(
                                      color: Colors.white, width: 0.3),
                                ),
                                child: Center(
                                  child: Icon(Icons.add,
                                      color: Colors.white, size: 28),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: ListView.builder(
                                controller: _scrollController,
                                reverse: true,
                                itemCount: _messages.length,
                                itemBuilder: (context, index) {
                                  final message = _messages[index];
                                  return _buildMessageBubble(context, message);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Image.asset(
                        AppImages.liveShop,
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (isChatVisible || _isTyping)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      controller: _messageController,
                      hint: 'Type a message...',
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: colorScheme(context).primary),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          Container(
            color: AppColor.dividerClr.withOpacity(0.6),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor:
                        colorScheme(context).outline.withOpacity(0.1),
                    child: GestureDetector(
                        onTap: () {
                          showSubscriberBottomSheet(context);
                        },
                        child: SvgPicture.asset(AppIcons.goldStar)),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor:
                        colorScheme(context).outline.withOpacity(0.1),
                    child: GestureDetector(
                      onTap: () {
                        _openChatInput(context);
                      },
                      child: SvgPicture.asset(AppIcons.chatIcons),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      ShowListBottomSheet(context);
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor:
                          colorScheme(context).outline.withOpacity(0.1),
                      child: Icon(Icons.list,
                          color: colorScheme(context).primary, size: 24),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMicOn = !isMicOn; // Toggle the microphone status
                      });
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor:
                          colorScheme(context).outline.withOpacity(0.1),
                      child: Icon(
                        isMicOn ? Icons.mic : Icons.mic_off_rounded,
                        color: colorScheme(context).primary,
                        size: 24,
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      _showMulitGuestAddBottamSheet();
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor:
                          colorScheme(context).outline.withOpacity(0.1),
                      child: Icon(Icons.chair_rounded,
                          color: colorScheme(context).primary, size: 24),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(BuildContext context, String message) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.6,
        ),
        decoration: BoxDecoration(
          color: colorScheme(context).primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                'https://static.vecteezy.com/system/resources/previews/005/346/410/non_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
              ),
              radius: 12,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openChatInput(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: _messageController,
                    hint: 'Type a message...',
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: colorScheme(context).primary),
                  onPressed: () {
                    _sendMessage();
                    Navigator.pop(context); // Close the bottom sheet
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildUserDetails(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        GiftCustomContainer(
          height: 35,
          borderRadius: 100,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          color: AppColor.appYellow,
          child: Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enrique Pemala',
                  style: textTheme(context).bodySmall?.copyWith(
                      fontSize: 10,
                      color: colorScheme(context).onSurface,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Image.asset(AppImages.giftDiamond, height: 16),
                    const SizedBox(width: 5),
                    Text(
                      '8811M',
                      style: textTheme(context).bodySmall?.copyWith(
                          fontSize: 10,
                          color: colorScheme(context).onSurface,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Image.asset(AppImages.onboardFirsttwo, height: 33),
        ),
      ],
    );
  }

  Widget _buildLevelBadges(BuildContext context) {
    return Stack(
      children: [
        _buildBadge(AppImages.onboardFirsttwo, AppImages.giftLevelBadgesTwo),
        _buildBadge(AppImages.onboardFirstthree, AppImages.giftLevelBadgesThree,
            leftPadding: 20),
        _buildBadge(AppImages.onboardFirsttwo, AppImages.giftLevelBadges),
      ],
    );
  }

  Widget _buildBadge(String backgroundImage, String badgeImage,
      {double leftPadding = 0.0}) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(backgroundImage, height: 30),
          Image.asset(badgeImage, height: 40),
        ],
      ),
    );
  }

  Widget _buildUserActions(BuildContext context) {
    return Row(
      children: List.generate(2, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: GestureDetector(
            onTap: () {
              if (index == 0) {
                // Action for blackShareIcon - Show share dialog
                print("Share Icon Tapped");
                shareDialogue(
                    context); // Call your share dialogue function here
              } else {
                // Action for clearIcon - Close the bottom sheet or perform a different action
                print("Clear Icon Tapped");
                context
                    .pop(); // Pop the current context (close bottom sheet or dialog)
              }
            },
            child: CircleAvatar(
              radius: 15,
              backgroundColor: colorScheme(context).onSurface.withOpacity(0.40),
              child: Center(
                child: SvgPicture.asset(
                  index == 0
                      ? AppIcons.blackShareIcon // Share Icon for index 0
                      : AppIcons.clearIcon, // Clear Icon for index 1
                  // ignore: deprecated_member_use
                  color: colorScheme(context).surface,
                  height: 18,
                  width: 18,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildForYouButton(BuildContext context) {
    return GiftCustomContainer(
      borderRadius: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.8),
      color: colorScheme(context).onSurface.withOpacity(.40),
      child: Row(
        children: [
          Text(
            'For You',
            style: textTheme(context)
                .bodySmall
                ?.copyWith(color: colorScheme(context).surface, fontSize: 10),
          ),
          const SizedBox(width: 5),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: colorScheme(context).surface,
            size: 15,
          ),
        ],
      ),
    );
  }

  Widget _buildSlotsGrid(BuildContext context) {
    return SizedBox(
      height: 420,
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: GestureDetector(
                  onTap: () {
                    showCustomDialog(context);
                  },
                  child: _buildMainImage(context))),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(child: _buildEmptySlot()),
                const SizedBox(width: 2),
                Expanded(child: _buildEmptySlot()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainImage(BuildContext context) {
    return ClipRRect(
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
                'https://static.vecteezy.com/system/resources/previews/005/346/410/non_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: colorScheme(context).outline.withOpacity(0.3),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(
                AppIcons.host,
                height: 24,
                width: 24,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'jenifer 💥💥💥💥',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.monetization_on,
                            color: Colors.yellow,
                            size: 20,
                          ),
                          Text(
                            '100',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Align(
              alignment: Alignment.bottomRight,
              child: _buildLevelBadges(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptySlot() {
    return GestureDetector(
      onTap: () {
        profileBottomSheet(context);
      },
      child: ClipRRect(
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl:
                  'https://static.vecteezy.com/system/resources/previews/005/346/410/non_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'jenifer 💥💥💥💥',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.monetization_on,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            Text(
                              '100',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Align(
                alignment: Alignment.bottomRight,
                child: _buildLevelBadges(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

////////ShoeMultiGuestBottomSheet////////////

  void _showMulitGuestAddBottamSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                children: [
                  _buildTabHeader(setModalState),
                  Expanded(
                    child: PageView(
                      controller: PageController(initialPage: _currentPage),
                      onPageChanged: (index) {
                        setModalState(() => _currentPage = index);
                      },
                      children: [
                        _buildFriendsListPage("Guests", setModalState),
                        _buildFriendsListPage("Invite", setModalState),
                        _buildFriendsListPage("Waiting", setModalState),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // Tab Header
  Widget _buildTabHeader(StateSetter setModalState) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTabText("Guests", 0, setModalState),
          _buildTabText("Invite", 1, setModalState),
          _buildTabText("Waiting", 2, setModalState),
        ],
      ),
    );
  }

  // Tab text and selection
  Widget _buildTabText(String title, int pageIndex, StateSetter setModalState) {
    bool isSelected = _currentPage == pageIndex;
    return GestureDetector(
      onTap: () {
        setModalState(() => _currentPage = pageIndex);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color:
                  isSelected ? Theme.of(context).primaryColor : Colors.black54,
            ),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 4,
              width: 8,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
        ],
      ),
    );
  }

  // Handle the correct list view based on the selected tab
  Widget _buildFriendsListPage(String pageTitle, StateSetter setModalState) {
    if (pageTitle == "Guests") {
      return _buildGuestList(setModalState);
    } else if (pageTitle == "Invite") {
      return _buildInviteList(setModalState);
    } else {
      return _buildWaitingList(setModalState);
    }
  }

  // Widget _buildGuestList(
  //     int index, StateSetter setModalState, BuildContext context) {

  // }
  // // Example Guest List
  Widget _buildGuestList(StateSetter setModalState) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/men/75.jpg'),
            ),
            title: const Text("Savannah Nguyen"),
            subtitle: Row(
              children: [
                const Text("id: 01251421"),
                const SizedBox(width: 5),
                Icon(Icons.copy, size: 16, color: Colors.grey.shade600),
              ],
            ),
            trailing: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: colorScheme(context).primary,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  child: Text(
                    'Options',
                    style: TextStyle(
                        color: colorScheme(context).surface, fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Example Invite List
  Widget _buildInviteList(StateSetter setModalState) {
    return Column(
      children: [
        // The ListView for Invite List Items
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return _buildFriendListItem(index, setModalState);
            },
          ),
        ),
        // The Invite button at the bottom of the Invite page
        if (_currentPage == 1) // Check if the current page is "Invite"
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomButton(
              buttonText: 'Invite',
              onPressed: () {},
            ),
          ),
      ],
    );
  }

  // Example Waiting List
  Widget _buildWaitingList(StateSetter setModalState) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/men/75.jpg'),
            ),
            title: const Text("Savannah Nguyen"),
            subtitle: Row(
              children: [
                const Text("id: 01251421"),
                const SizedBox(width: 5),
                Icon(Icons.copy, size: 16, color: Colors.grey.shade600),
              ],
            ),
            trailing: GestureDetector(
              onTap: () {},
              child: Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: colorScheme(context).primary,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  child: Center(
                    child: Text(
                      'Add',
                      style: TextStyle(
                          color: colorScheme(context).surface, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Invite List Item
  Widget _buildFriendListItem(int index, StateSetter setModalState) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/men/75.jpg'),
              ),
              title: const Text("Savannah Nguyen"),
              subtitle: Row(
                children: [
                  const Text("id: 01251421"),
                  const SizedBox(width: 5),
                  Icon(Icons.copy, size: 16, color: Colors.grey.shade600),
                ],
              ),
              trailing: GestureDetector(
                onTap: () {
                  setModalState(() {
                    if (selectedFriends.contains(index)) {
                      selectedFriends.remove(index);
                    } else {
                      selectedFriends.add(index);
                    }
                  });
                },
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: selectedFriends.contains(index)
                      ? Colors.red
                      : Colors.grey.shade300,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
