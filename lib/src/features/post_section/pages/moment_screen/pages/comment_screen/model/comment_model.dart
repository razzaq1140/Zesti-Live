import 'package:flutter_application_zestilive/src/common/const/app_images.dart';

class Comment {
  final String name;
  final String profileImage;
  final String comment;
  final List<String> hashtags;
  final String time;
  int likes;
  bool isLiked;
  final List<Reply> replies;

  Comment({
    required this.name,
    required this.profileImage,
    required this.comment,
    this.hashtags = const [],
    required this.time,
    this.likes = 0,
    this.isLiked = false,
    this.replies = const [],
  });

  void toggleLike() {
    if (isLiked) {
      likes--;
    } else {
      likes++;
    }
    isLiked = !isLiked;
  }

  void addReply(Reply reply) {
    replies.add(reply);
  }
}

class Reply {
  final String name;
  final String profileImage;
  final String reply;
  final String time;
  int likes;
  bool isLiked;

  Reply({
    required this.name,
    required this.profileImage,
    required this.reply,
    required this.time,
    this.likes = 0,
    this.isLiked = false,
  });

  void toggleLike() {
    if (isLiked) {
      likes--;
    } else {
      likes++;
    }
    isLiked = !isLiked;
  }
}

final List<Comment> comments = [
  Comment(
    name: "itz.isitaa",
    profileImage: AppImages.profileDp,
    comment: "Check my post plzz 😊",
    time: "2m",
    likes: 121,
    replies: [
      Reply(
        name: "itz.isitaa",
        profileImage: AppImages.profileDp,
        reply: "Good night 🌙",
        time: "5m",
        likes: 1,
      ),
      Reply(
        name: "itz.isitaa",
        profileImage: AppImages.profileDp,
        reply: "Sweet dreams! 😊",
        time: "3m",
        likes: 1,
      ),
    ],
  ),
  Comment(
    name: "itz.isitaa",
    profileImage: AppImages.profileDp,
    comment: "Check my post plzz 😊",
    time: "2m",
    likes: 121,
    replies: [
      Reply(
        name: "itz.isitaa",
        profileImage: AppImages.profileDp,
        reply: "Good night 🌙",
        time: "5m",
        likes: 1,
      ),
      Reply(
        name: "itz.isitaa",
        profileImage: AppImages.profileDp,
        reply: "Sweet dreams! 😊",
        time: "3m",
        likes: 1,
      ),
    ],
  ),
  Comment(
    name: "itz.isitaa",
    profileImage: AppImages.profileDp,
    comment: "Check my post plzz 😊",
    time: "2m",
    likes: 121,
    replies: [
      Reply(
        name: "itz.isitaa",
        profileImage: AppImages.profileDp,
        reply: "Good night 🌙",
        time: "5m",
        likes: 1,
      ),
      Reply(
        name: "itz.isitaa",
        profileImage: AppImages.profileDp,
        reply: "Sweet dreams! 😊",
        time: "3m",
        likes: 1,
      ),
    ],
  ),
];
