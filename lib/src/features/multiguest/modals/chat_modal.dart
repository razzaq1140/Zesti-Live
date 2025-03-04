class ChatData {
  final String imageUrl;
  final String message;
  final String location;
  final String viewCount;
  final List<String> avatarUrls;

  ChatData({
    required this.viewCount,
    required this.imageUrl,
    required this.message,
    required this.location,
    this.avatarUrls = const [],
  });
}
