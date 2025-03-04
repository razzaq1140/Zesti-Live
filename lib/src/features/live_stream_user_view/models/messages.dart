class Messages {
  String username;
  String message;
  bool isSpecialEvent;
  Messages(
      {required this.username,
      required this.message,
      this.isSpecialEvent = false});
}

List<Messages> messaguser = [
  Messages(
      username: "Ramesh", message: "joined the LIVE", isSpecialEvent: true),
  Messages(
      username: "Ankush", message: 'joined the live', isSpecialEvent: false),
  Messages(
      username: "chahat fateh",
      message: "Joined the live",
      isSpecialEvent: false),
  Messages(
      username: "Sumit",
      message: "the boradcaster invites you to join the live",
      isSpecialEvent: true),
];
