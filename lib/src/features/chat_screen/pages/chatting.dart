import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> _messages = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add({"message": _controller.text, "isSent": true});
      });
      _controller.clear();
      _scrollToBottom();
    }
  }

  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: colorScheme(context).onPrimary, size: width * 0.06),
        backgroundColor: colorScheme(context).primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        leadingWidth: width * 0.08,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(AppImages.profileDp),
            ),
            SizedBox(width: width * 0.05),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Christina Pearson",
                    style: textTheme(context).bodyLarge?.copyWith(
                        color: colorScheme(context).onPrimary,
                        fontWeight: FontWeight.bold)),
                Text("Online",
                    style: textTheme(context)
                        .bodySmall
                        ?.copyWith(color: Colors.white)),
              ],
            ),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              if (value == 'Report') {
              } else if (value == 'Block') {
                _showBlockDialog(context);
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Report',
                child: Text('Report'),
              ),
              const PopupMenuItem<String>(
                value: 'Block',
                child: Text('Block'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          _buildFollowSection(),
          Expanded(
            child: _messages.isEmpty
                ? _buildEmptyChatContainer()
                : ListView.builder(
                    controller: _scrollController,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildMessageBubble(_messages[index]["message"],
                            _messages[index]["isSent"], context, index),
                      );
                    },
                  ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildEmptyChatContainer() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppIcons.message),
          SizedBox(height: height * 0.02),
          Text(
            "You’ve got no message",
            style: textTheme(context)
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            textAlign: TextAlign.center,
            "No message in your inbox, yet! Start chatting \n with people around you.",
            style: textTheme(context)
                .bodyMedium
                ?.copyWith(color: AppColor.textGrey),
          ),
        ],
      ),
    );
  }

  Widget _buildFollowSection() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Follow so you won’t miss the moments.",
            style: textTheme(context)
                .bodySmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height * 0.05,
            width: width * 0.25,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: colorScheme(context).primary)),
                iconColor: colorScheme(context).primary, // Button color
              ),
              child: Text(
                "Follow",
                style: textTheme(context)
                    .bodyMedium
                    ?.copyWith(color: colorScheme(context).primary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(
      String message, bool isSent, BuildContext context, int index) {
    return isSent
        ? Slidable(
            key: ValueKey(message),
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Copied: $message')),
                    );
                  },
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  icon: Icons.file_copy,
                ),
                SlidableAction(
                  onPressed: (context) {
                    _confirmDeleteMessage(context, index);
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                ),
              ],
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColor.tagBlue,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Text(
                  message,
                  style: TextStyle(
                    color: colorScheme(context).onPrimary,
                  ),
                ),
              ),
            ),
          )
        : Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColor.textGrey,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Text(
                message,
                style: TextStyle(
                  color: colorScheme(context).onSurface,
                ),
              ),
            ),
          );
  }

  void _confirmDeleteMessage(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Delete"),
          content: const Text("Are you sure you want to delete this message?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _messages.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: const Text(
                "Delete",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            height: height * 0.07,
            width: width * 0.82,
            padding: const EdgeInsets.fromLTRB(30, 2, 10, 2),
            decoration: BoxDecoration(
              color: AppColor.textGrey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                SizedBox(
                  height: height * 0.05,
                  width: width * 0.55,
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      hintStyle: textTheme(context)
                          .bodyMedium
                          ?.copyWith(color: AppColor.textGrey),
                      border: InputBorder.none,
                    ),
                    onTap: () {
                      Future.delayed(const Duration(milliseconds: 300), () {
                        _scrollToBottom();
                      });
                    },
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: height * 0.5,
                        child: EmojiPicker(
                          onEmojiSelected: (category, emoji) {
                            setState(() {
                              _controller.text = emoji.emoji;
                            });
                            Navigator.pop(context);
                          },
                          textEditingController: _controller,
                          config: const Config(
                            checkPlatformCompatibility: true,
                          ),
                        ),
                      );
                    },
                  ),
                  child: Icon(Icons.emoji_emotions,
                      color: AppColor.textGrey, size: width * 0.05),
                ),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                    onTap: () => _showAttachmentOptions(context),
                    child: SvgPicture.asset(AppIcons.file)),
                const SizedBox(
                  width: 8,
                )
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: AppColor.tagBlue,
            ),
            icon: Icon(Icons.send,
                color: colorScheme(context).onPrimary, size: width * 0.05),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}

void _showAttachmentOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 150,
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 3,
          children: [
            _buildAttachmentOption(Icons.image, "Image", AppColor.purple),
            _buildAttachmentOption(
                Icons.camera_alt, "Camera", AppColor.tagOrange),
            _buildAttachmentOption(
                Icons.insert_drive_file, "File", AppColor.tagBlue),
            _buildAttachmentOption(
                Icons.location_on, "Location", AppColor.appGreen),
            _buildAttachmentOption(
                Icons.audiotrack, "Audio", colorScheme(context).primary),
          ],
        ),
      );
    },
  );
}

void _showBlockDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        title: const Text(
          "Are you sure you want to block Christina Pearson?",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const Text(
          "Block means he/she can't send messages to you, follow each other, and is prohibited from entering your room. "
          "You can cancel it in 'Settings - Blocked List'.",
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              "Cancel",
              style: TextStyle(color: colorScheme(context).primary),
            ),
          ),
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              "Block",
              style: TextStyle(color: colorScheme(context).primary),
            ),
          ),
        ],
      );
    },
  );
}

Widget _buildAttachmentOption(IconData icon, String label, Color color) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(
        backgroundColor: color,
        radius: 25,
        child: Icon(icon, color: AppColor.outLine, size: 30),
      ),
      const SizedBox(height: 5),
      Text(label, style: const TextStyle(fontSize: 12)),
    ],
  );
}
