class ChatMessage {
  String username;
  String message;
  bool isSpecialEvent;
  ChatMessage(
      {required this.username,
      required this.message,
      this.isSpecialEvent = false});
}

List<ChatMessage> messages = [
  ChatMessage(
      username: "Ramesh", message: "joined the LIVE", isSpecialEvent: true),
  ChatMessage(
      username: "Ankush", message: 'joined the live', isSpecialEvent: false),
  ChatMessage(
      username: "chahat fateh",
      message: "Joined the live",
      isSpecialEvent: false),
  ChatMessage(
      username: "Sumit",
      message: "the boradcaster invites you to join the live",
      isSpecialEvent: true),
];
