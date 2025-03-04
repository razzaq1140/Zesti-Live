import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/live_stream_user_view/models/invite_friends_tabar_modal.dart';

class Invitefriendsprovider with ChangeNotifier {
  final List<InviteFriendsTabbbarModal> recentUsers;
  final List<InviteFriendsTabbbarModal> friendsUsers;
  final List<InviteFriendsTabbbarModal> fansUsers;

  List<bool> _isSelectedRecent;
  List<bool> _isSelectedFriends;
  List<bool> _isSelectedFans;

  Invitefriendsprovider({
    required this.recentUsers,
    required this.friendsUsers,
    required this.fansUsers,
  })  : _isSelectedRecent = List.generate(recentUsers.length, (_) => false),
        _isSelectedFriends = List.generate(friendsUsers.length, (_) => false),
        _isSelectedFans = List.generate(fansUsers.length, (_) => false);

  // The list of selected avatars to display in seats
  List<String?> _avatarImages = [];

  List<String?> get avatarImages {
    // Ensure the list has at least 8 slots by adding null values if needed
    if (_avatarImages.length < 8) {
      return List.from(_avatarImages)
        ..addAll(List.filled(8 - _avatarImages.length, null));
    }
    return _avatarImages;
  }

  // Adds selected avatars from all categories to the main avatar list
  void addSelectedAvatarsToAvatarList() {
    _avatarImages.clear();

    // Add selected avatars from recentUsers
    for (int i = 0; i < recentUsers.length; i++) {
      if (_isSelectedRecent[i]) {
        _avatarImages.add(recentUsers[i].avatarUrl);
      }
    }

    // Add selected avatars from friendsUsers
    for (int i = 0; i < friendsUsers.length; i++) {
      if (_isSelectedFriends[i]) {
        _avatarImages.add(friendsUsers[i].avatarUrl);
      }
    }

    // Add selected avatars from fansUsers
    for (int i = 0; i < fansUsers.length; i++) {
      if (_isSelectedFans[i]) {
        _avatarImages.add(fansUsers[i].avatarUrl);
      }
    }

    notifyListeners();
  }

  // Method to reset avatars
  void resetAvatars() {
    _avatarImages = [];
    notifyListeners();
  }

  List<bool> get isSelectedRecent => _isSelectedRecent;
  List<bool> get isSelectedFriends => _isSelectedFriends;
  List<bool> get isSelectedFans => _isSelectedFans;

  int get totalSelectedCount =>
      _isSelectedRecent.where((selected) => selected).length +
      _isSelectedFriends.where((selected) => selected).length +
      _isSelectedFans.where((selected) => selected).length;

  // Toggle selection for recent tab
  void toggleSelectionRecent(int index) {
    _isSelectedRecent[index] = !_isSelectedRecent[index];
    notifyListeners();
  }

  // Toggle selection for friends tab
  void toggleSelectionFriends(int index) {
    _isSelectedFriends[index] = !_isSelectedFriends[index];
    notifyListeners();
  }

  // Toggle selection for fans tab
  void toggleSelectionFans(int index) {
    _isSelectedFans[index] = !_isSelectedFans[index];
    notifyListeners();
  }
}
