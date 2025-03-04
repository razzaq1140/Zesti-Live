import 'package:flutter/material.dart';

class MultiGuestChatProvider extends ChangeNotifier {
  bool _isChatVisible = false;
  bool _isTyping = false;
  bool _isMicOn = false;
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<String> _messages = [
    "The broadcaster invites you to join a PK",
    "The broadcaster PK",
    "The broadcaster",
    "The broadcaster PK",
  ];

  // Getters
  bool get isChatVisible => _isChatVisible;
  bool get isTyping => _isTyping;
  bool get isMicOn => _isMicOn;
  TextEditingController get messageController => _messageController;
  ScrollController get scrollController => _scrollController;
  List<String> get messages => _messages;

  // Toggle chat visibility
  void toggleChatVisibility() {
    _isChatVisible = !_isChatVisible;
    notifyListeners();
  }

  // Toggle typing status
  void toggleTyping() {
    _isTyping = !_isTyping;
    notifyListeners();
  }

  // Toggle microphone
  void toggleMic() {
    _isMicOn = !_isMicOn;
    notifyListeners();
  }

  // Add a message
  void sendMessage() {
    if (_messageController.text.isNotEmpty) {
      _messages.add(_messageController.text);
      _messageController.clear();
      notifyListeners();
      scrollToBottom();
    }
  }

  // Scroll to the bottom of the chat
  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // Dispose controllers
  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
