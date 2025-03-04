import 'package:flutter_application_zestilive/src/common/const/app_images.dart';

class ChatUser {
  final String name;
  final String profileImageUrl;
  final bool isOnline;
  final int unreadMessages;
  final String lastMessage;
  final String lastMessageTime;

  ChatUser({
    required this.name,
    required this.profileImageUrl,
    required this.isOnline,
    required this.unreadMessages,
    required this.lastMessage,
    required this.lastMessageTime,
  });
}

List<ChatUser> users = [
  ChatUser(
    name: "Jim Carry",
    profileImageUrl: AppNetworkImages.networkOne,
    isOnline: false,
    unreadMessages: 3,
    lastMessage: "Thank you",
    lastMessageTime: "10:30",
  ),
  ChatUser(
    name: "Love Quinn",
    profileImageUrl: AppNetworkImages.networkOne,
    isOnline: true,
    unreadMessages: 1,
    lastMessage: "Hello, How can I help you",
    lastMessageTime: "10:32",
  ),
  ChatUser(
    name: "Joe Goldberg",
    profileImageUrl: AppNetworkImages.networkOne,
    isOnline: false,
    unreadMessages: 0,
    lastMessage: "When will I get my next facial...",
    lastMessageTime: "Yesterday",
  ),
  ChatUser(
    name: "Christian Grey",
    profileImageUrl: AppNetworkImages.networkOne,
    isOnline: true,
    unreadMessages: 0,
    lastMessage: "Good!",
    lastMessageTime: "3 Jun",
  ),
];
