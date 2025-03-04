import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_textfield.dart';
import 'package:flutter_application_zestilive/src/features/post_section/pages/moment_screen/pages/comment_screen/model/comment_model.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _commentController = TextEditingController();
  String? _replyingTo;
  int? _expandedCommentIndex;

  void _toggleReplies(int index) {
    setState(() {
      if (_expandedCommentIndex == index) {
        _expandedCommentIndex = null;
      } else {
        _expandedCommentIndex = index;
      }
    });
  }

  void _replyToUser(String userName) {
    setState(() {
      _replyingTo = userName;
      _commentController.text = "@$userName ";
    });
  }

  void _postReply(Comment comment) {
    if (_commentController.text.isNotEmpty && _replyingTo != null) {
      final newReply = Reply(
        name: "CurrentUser",
        profileImage: AppImages.profileDp,
        reply: _commentController.text,
        time: "Just now",
        likes: 0,
      );
      setState(() {
        comment.addReply(newReply);
        _replyingTo = null;
        _commentController.clear();
      });
    }
  }

  void _toggleCommentLike(Comment comment) {
    setState(() {
      comment.toggleLike();
    });
  }

  void _toggleReplyLike(Reply reply) {
    setState(() {
      reply.toggleLike();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: colorScheme(context).onPrimary),
        backgroundColor: colorScheme(context).primary,
        title: Text(
          "Comments",
          style: textTheme(context).titleSmall?.copyWith(
              color: colorScheme(context).onPrimary,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundImage: AssetImage(AppImages.profileDp),
              ),
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Eren Yaeger ",
                      style: textTheme(context)
                          .bodySmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting",
                      style: textTheme(context).bodySmall,
                    ),
                  ],
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "#weekend #aboutlastnight",
                    style: textTheme(context)
                        .bodySmall
                        ?.copyWith(color: AppColor.tagBlue),
                  ),
                  Text(
                    "2m",
                    style: textTheme(context).bodySmall,
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final comment = comments[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(comment.profileImage),
                        ),
                        title: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "${comment.name} ",
                                  style: textTheme(context)
                                      .bodySmall
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                              TextSpan(
                                text: comment.comment,
                                style: textTheme(context).bodySmall,
                              ),
                            ],
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  comment.time,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(width: 10),
                                Text("${comment.likes} likes",
                                    style: textTheme(context)
                                        .bodySmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.textGrey)),
                                const SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    _replyToUser(comment.name);
                                  },
                                  child: Text("Reply",
                                      style: textTheme(context)
                                          .bodySmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: AppColor.textGrey)),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () => _toggleReplies(index),
                              child: Text(
                                _expandedCommentIndex == index
                                    ? "Hide Replies (${comment.replies.length})"
                                    : "View Replies (${comment.replies.length})",
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            comment.isLiked
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: comment.isLiked ? Colors.red : Colors.black,
                          ),
                          onPressed: () {
                            _toggleCommentLike(comment);
                          },
                        ),
                      ),
                      if (_expandedCommentIndex == index)
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            children: comment.replies.map((reply) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(reply.profileImage),
                                ),
                                title: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "${reply.name} ",
                                          style: textTheme(context)
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.bold)),
                                      TextSpan(
                                        text: reply.reply,
                                        style: textTheme(context).bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                                subtitle: Row(
                                  children: [
                                    Text(reply.time,
                                        style: textTheme(context)
                                            .bodySmall
                                            ?.copyWith(
                                                color: AppColor.textGrey)),
                                    const SizedBox(width: 10),
                                    Text("${reply.likes} likes",
                                        style: textTheme(context)
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: AppColor.textGrey)),
                                    const SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        _replyToUser(reply.name);
                                      },
                                      child: Text("Reply",
                                          style: textTheme(context)
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColor.textGrey)),
                                    ),
                                  ],
                                ),
                                trailing: IconButton(
                                  icon: Icon(
                                    reply.isLiked
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: reply.isLiked
                                        ? colorScheme(context).primary
                                        : colorScheme(context).onSurface,
                                  ),
                                  onPressed: () {
                                    _toggleReplyLike(reply);
                                  },
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
            if (_replyingTo != null)
              Container(
                color: AppColor.textGrey.withOpacity(0.2),
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Replying to $_replyingTo"),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          _replyingTo = null;
                          _commentController.clear();
                        });
                      },
                    ),
                  ],
                ),
              ),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(AppImages.profileDp),
                ),
                const SizedBox(width: 8.0),
                SizedBox(
                  height: 60,
                  width: 180,
                  child: CustomTextFormField(
                    controller: _commentController,
                    hint: _replyingTo != null
                        ? "Replying to $_replyingTo"
                        : "Comment",
                    hintColor: AppColor.textGrey,
                  ),
                ),
                const SizedBox(width: 20),
                TextButton(
                  onPressed: () {
                    if (_replyingTo != null) {
                      final comment =
                          comments.firstWhere((c) => c.name == _replyingTo);
                      _postReply(comment);
                    }
                  },
                  child: Text(
                    "Post",
                    style: textTheme(context).bodyMedium?.copyWith(
                        color: colorScheme(context).primary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
