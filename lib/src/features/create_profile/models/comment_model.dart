class CommentModel {
  final String text;
  final String userName;
  final String profileImage;
  final String timestamp;
  bool isFavorited;
  int likeCount;
  List<ReplyModel> replies;
  bool showReplies;

  CommentModel({
    required this.text,
    required this.userName,
    required this.profileImage,
    required this.timestamp,
    this.isFavorited = false,
    this.likeCount = 0,
    List<ReplyModel>? replies,
    this.showReplies = false,
  }) : replies = replies ?? [];
}

class ReplyModel {
  final String replyText;
  final String userName;
  final String timestamp;

  ReplyModel({
    required this.replyText,
    required this.userName,
    required this.timestamp,
  });
}
