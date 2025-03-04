class ChatMessage {
  final String message;
  final String time;
  final bool isSender;
  final bool isOnline;
  final String? imageUrl;
  final String? fileName;
  final int? fileSize;

  ChatMessage({
    required this.message,
    required this.time,
    required this.isSender,
    required this.isOnline,
    this.imageUrl,
    this.fileName,
    this.fileSize,
  });
}
