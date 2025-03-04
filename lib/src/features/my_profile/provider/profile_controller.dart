import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/model/moments_model.dart';
import '../model/profile_modal.dart';

class ProfileController with ChangeNotifier {
  final UserProfile userProfile;
  bool _showMomentsScreen = false;

  bool get showMomentsScreen => _showMomentsScreen;

  void toggleScreen() {
    _showMomentsScreen = !_showMomentsScreen;
    notifyListeners();
  }

  void showProfileOptions() {
    _showMomentsScreen = false;
    notifyListeners();
  }

  void showMoments() {
    _showMomentsScreen = true;
    notifyListeners();
  }

  // Expanded state for each moment
  List<bool> isExpandedList;
  // Like state for each moment
  List<bool> isLikedList;

  ProfileController({required this.userProfile})
      : isExpandedList = List<bool>.filled(moments.length, false),
        isLikedList = List<bool>.filled(moments.length, false);

  // Method to toggle the expansion state of a moment
  void toggleExpanded(int index) {
    isExpandedList[index] = !isExpandedList[index];
    notifyListeners();
  }

  // Method to toggle the like state of a moment and increase/decrease likes count
  void toggleLike(int index) {
    isLikedList[index] = !isLikedList[index];

    if (isLikedList[index]) {
      // Increase the like count if it's being liked
      moments[index].likes += 1;
    } else {
      // Decrease the like count if the like is being removed
      moments[index].likes -= 1;
    }

    notifyListeners(); // Notify listeners to update the UI
  }

  void addMoment(Moment newMoment) {
    moments.add(newMoment);
    isExpandedList.add(false);
    isLikedList.add(false);
    print('New moment added: ${newMoment.caption}');
    print('Total moments: ${moments.length}');
    notifyListeners();
  }
}
