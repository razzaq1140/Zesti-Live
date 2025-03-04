class ChatMessages {
  String username;
  String message;
  bool isSpecialEvent;
  ChatMessages(
      {required this.username,
      required this.message,
      this.isSpecialEvent = false});
}

List<ChatMessages> messages = [
  ChatMessages(
      username: "Ramesh", message: "joined the LIVE", isSpecialEvent: true),
  ChatMessages(
      username: "Ankush", message: 'joined the live', isSpecialEvent: false),
  ChatMessages(
      username: "chahat fateh",
      message: "Joined the live",
      isSpecialEvent: false),
  ChatMessages(
      username: "Sumit",
      message: "the boradcaster invites you to join the live",
      isSpecialEvent: true),
];
