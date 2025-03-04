import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';

import '../../create_profile/models/comment_model.dart';

class CommentProvider extends ChangeNotifier {
  final List<CommentModel> _comments = [
    CommentModel(
      text: "This is an amazing video!",
      userName: "John",
      profileImage: AppImages.profileDp,
      timestamp: "02m",
    ),
    CommentModel(
      text: "Loved the content.",
      userName: "Mian",
      profileImage: AppImages.profileDp,
      timestamp: "05m",
    ),
    CommentModel(
      text: "Great work, keep it up!",
      userName: "Mohsin",
      profileImage: AppImages.profileDp,
      timestamp: "10m",
    ),
    CommentModel(
      text: "Incredible!",
      userName: "Sarah",
      profileImage: AppImages.profileDp,
      timestamp: "15m",
    ),
    CommentModel(
      text: "Nice video!",
      userName: "Ali",
      profileImage: AppImages.profileDp,
      timestamp: "20m",
    ),
    CommentModel(
      text: "Great tutorial!",
      userName: "Ayesha",
      profileImage: AppImages.profileDp,
      timestamp: "25m",
    ),
    CommentModel(
      text: "Amazing content!",
      userName: "Usman",
      profileImage: AppImages.profileDp,
      timestamp: "30m",
    ),
    CommentModel(
      text: "Please post more videos!",
      userName: "Farah",
      profileImage: AppImages.profileDp,
      timestamp: "35m",
    ),
    CommentModel(
      text: "Awesome!",
      userName: "Hassan",
      profileImage: AppImages.profileDp,
      timestamp: "40m",
    ),
    CommentModel(
      text: "Brilliant!",
      userName: "Fatima",
      profileImage: AppImages.profileDp,
      timestamp: "45m",
    ),
    CommentModel(
      text: "Really enjoyed this.",
      userName: "Zain",
      profileImage: AppImages.profileDp,
      timestamp: "50m",
    ),
    CommentModel(
      text: "Wonderful!",
      userName: "Omer",
      profileImage: AppImages.profileDp,
      timestamp: "55m",
    ),
    CommentModel(
      text: "So helpful!",
      userName: "Ahmed",
      profileImage: AppImages.profileDp,
      timestamp: "1h",
    ),
    CommentModel(
      text: "Thanks for sharing.",
      userName: "Maria",
      profileImage: AppImages.profileDp,
      timestamp: "1h 5m",
    ),
    CommentModel(
      text: "This helped me a lot!",
      userName: "Tariq",
      profileImage: AppImages.profileDp,
      timestamp: "1h 10m",
    ),
  ];

  List<CommentModel> get comments => _comments;

  int get totalComments => _comments.fold<int>(
      _comments.length, (sum, comment) => sum + comment.replies.length);

  void addComment(String commentText) {
    _comments.add(CommentModel(
      text: commentText,
      userName: "User",
      profileImage: AppImages.userProfile,
      timestamp: "Just now",
    ));
    notifyListeners();
  }

  void addReply(int commentIndex, String replyText) {
    _comments[commentIndex].replies.add(ReplyModel(
          replyText: replyText,
          userName: "User ${_comments[commentIndex].replies.length + 1}",
          timestamp: "Just now",
        ));
    notifyListeners();
  }

  void toggleShowReplies(int commentIndex) {
    _comments[commentIndex].showReplies = !_comments[commentIndex].showReplies;
    notifyListeners();
  }

  void toggleFavorite(int index) {
    _comments[index].isFavorited = !_comments[index].isFavorited;
    if (_comments[index].isFavorited) {
      _comments[index].likeCount += 1;
    } else if (_comments[index].likeCount > 0) {
      _comments[index].likeCount -= 1;
    }
    notifyListeners();
  }
}
