import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/yeah_home/providers/comment_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../common/const/app_images.dart';
import '../../../common/const/global_variables.dart';

class CommentButton extends StatelessWidget {
  const CommentButton({super.key});

  void _showCommentsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: colorScheme(context).surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) => const CommentSection(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showCommentsSheet(context),
      child: Column(
        children: [
          SvgPicture.asset(AppIcons.commentIcon, height: 36),
          Consumer<CommentProvider>(
            builder: (context, commentProvider, child) {
              return Text("${commentProvider.totalComments}",
                  style: textTheme(context)
                      .bodyMedium
                      ?.copyWith(color: colorScheme(context).onPrimary));
            },
          ),
        ],
      ),
    );
  }
}

class CommentSection extends StatefulWidget {
  const CommentSection({super.key});

  @override
  CommentSectionState createState() => CommentSectionState();
}

class CommentSectionState extends State<CommentSection> {
  final TextEditingController _commentController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  int? _replyingToIndex;
  String? _replyingToUser;
  Set<int> expandedReplies = {};

  @override
  void dispose() {
    _commentController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Consumer<CommentProvider>(
          builder: (context, commentProvider, child) => Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: colorScheme(context).surface,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "${commentProvider.totalComments} comments",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: commentProvider.comments.length,
                    itemBuilder: (context, index) {
                      final comment = commentProvider.comments[index];
                      final isExpanded = expandedReplies.contains(index);
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage(AppImages.profileDp),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(comment.userName,
                                                  style: textTheme(context)
                                                      .labelMedium
                                                      ?.copyWith(
                                                          letterSpacing: 0,
                                                          color: colorScheme(
                                                                  context)
                                                              .onSurface
                                                              .withOpacity(0.7),
                                                          fontWeight:
                                                              FontWeight.w500)),
                                              const SizedBox(height: 5),
                                              Text(comment.text),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  commentProvider
                                                      .toggleFavorite(index);
                                                },
                                                child: Icon(
                                                  comment.isFavorited
                                                      ? Icons.favorite
                                                      : Icons.favorite_border,
                                                  color: comment.isFavorited
                                                      ? colorScheme(context)
                                                          .primary
                                                      : colorScheme(context)
                                                          .onSurface
                                                          .withOpacity(0.6),
                                                  size: 18,
                                                ),
                                              ),
                                              Text(
                                                "${comment.likeCount}",
                                                style: textTheme(context)
                                                    .labelSmall
                                                    ?.copyWith(
                                                      color:
                                                          colorScheme(context)
                                                              .onSurface
                                                              .withOpacity(0.6),
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Text(
                                            "22m", // Example timestamp
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall
                                                ?.copyWith(
                                                    color: colorScheme(context)
                                                        .onSurface
                                                        .withOpacity(0.5)),
                                          ),
                                          const SizedBox(width: 10),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _replyingToIndex = index;
                                                _replyingToUser =
                                                    comment.userName;
                                              });
                                              _focusNode.requestFocus();
                                            },
                                            child: Text(
                                              "Reply",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall
                                                  ?.copyWith(
                                                      color: colorScheme(
                                                              context)
                                                          .onSurface
                                                          .withOpacity(0.5)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (comment.replies.isNotEmpty)
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (isExpanded) {
                                                expandedReplies.remove(index);
                                              } else {
                                                expandedReplies.add(index);
                                              }
                                            });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0),
                                            child: Text(
                                              isExpanded
                                                  ? "Hide Replies (${comment.replies.length})"
                                                  : "_View Replies (${comment.replies.length})",
                                              style: textTheme(context)
                                                  .labelMedium
                                                  ?.copyWith(
                                                      fontSize: 12,
                                                      color: colorScheme(
                                                              context)
                                                          .onSurface
                                                          .withOpacity(0.5)),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // Replies section (toggleable)
                            if (isExpanded)
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 40.0, top: 8.0),
                                child: Column(
                                  children: comment.replies.map((reply) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            backgroundImage:
                                                AssetImage(AppImages.profileDp),
                                            radius: 15,
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(reply.userName,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(reply.replyText),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Divider(),

                // Bottom input bar for adding comments/replies
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(AppImages.profileDp),
                        radius: 20,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _commentController,
                          focusNode: _focusNode,
                          decoration: InputDecoration(
                            hintText: _replyingToUser != null
                                ? 'Reply to $_replyingToUser...'
                                : 'Add comment...',
                            hintStyle: TextStyle(
                              color: colorScheme(context)
                                  .onSurface
                                  .withOpacity(0.6),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (_commentController.text.isNotEmpty) {
                            if (_replyingToIndex != null) {
                              commentProvider.addReply(
                                  _replyingToIndex!, _commentController.text);
                              setState(() {
                                _replyingToIndex = null;
                                _replyingToUser = null;
                              });
                            } else {
                              commentProvider
                                  .addComment(_commentController.text);
                            }
                            _commentController.clear();
                          }
                        },
                        child:const Text(
                          "Post",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
