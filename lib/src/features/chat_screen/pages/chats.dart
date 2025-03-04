import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/chat_screen/models/chat_model.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:go_router/go_router.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showDialog();
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(8),
          content: const Text(
            "Ignore all unread messages but messages won’t be deleted",
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Sure",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme(context).primary,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          "Message",
          style: textTheme(context).titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme(context).onPrimary,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: ChatSearchDelegate(users),
              );
            },
            icon: Icon(
              Icons.search,
              color: colorScheme(context).onPrimary,
            ),
          ),
          IconButton(
            onPressed: () {
              context.pushNamed(AppRoute.discoverfriendsscreen);
            },
            icon: Icon(
              Icons.add,
              color: colorScheme(context).onPrimary,
            ),
          )
        ],
        iconTheme: IconThemeData(
            color: colorScheme(context).onPrimary, size: width * 0.06),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: users.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => context.pushNamed(AppRoute.chatting),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    radius: 21,
                    backgroundImage: NetworkImage(users[index].profileImageUrl),
                  ),
                  title: Row(
                    children: [
                      Text(
                        users[index].name,
                        style: textTheme(context).bodyMedium,
                      ),
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                            color: AppColor.tagBlue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 7,
                              color: colorScheme(context).onPrimary,
                            ),
                            Text(
                              "45",
                              style: textTheme(context).labelSmall?.copyWith(
                                  fontSize: 8,
                                  color: colorScheme(context).onPrimary),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  subtitle: Text(users[index].lastMessage,
                      style: textTheme(context).bodySmall?.copyWith(
                            color: AppColor.textGrey,
                          )),
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: height * 0.05,
                        width: width * 0.05,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorScheme(context).primary),
                        child: Center(
                            child: Text(
                          users[index].unreadMessages.toString(),
                          style: textTheme(context)
                              .labelSmall
                              ?.copyWith(color: colorScheme(context).onPrimary),
                        )),
                      ),
                      Text(
                        users[index].lastMessageTime,
                        style: textTheme(context)
                            .labelSmall
                            ?.copyWith(color: AppColor.textGrey),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ChatSearchDelegate extends SearchDelegate {
  final List<ChatUser> users;

  ChatSearchDelegate(this.users);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    final filteredUsers = users
        .where((user) =>
            user.name.toLowerCase().contains(query.toLowerCase()) ||
            user.lastMessage.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredUsers.length,
      itemBuilder: (context, index) {
        final user = filteredUsers[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user.profileImageUrl),
          ),
          title: Text(user.name),
          subtitle: Text(user.lastMessage),
          onTap: () {
            close(context, user);
            context.pushNamed(AppRoute.chatting);
          },
        );
      },
    );
  }
}
