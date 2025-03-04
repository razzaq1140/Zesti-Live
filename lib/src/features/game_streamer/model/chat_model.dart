class Message {
  final String text;
  final bool isSystem;
  final String imageUrl;

  Message({
    required this.text,
    this.isSystem = false,
    required this.imageUrl,
  });
}