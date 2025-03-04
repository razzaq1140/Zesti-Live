// import 'package:flutter/material.dart';

// class InterestSelectionProvider with ChangeNotifier {
//   // List of available interests
//   final List<String> _interests = [
//     'Animals',
//     'Comedy',
//     'Food',
//     'Sports',
//     'Travel',
//     'Dance',
//     'Science & Education',
//     'Outdoors',
//     'DIY & Life Hacks',
//     'Auto',
//     'Beauty & Style',
//     'Music',
//     'Entertainment',
//     'Science',
//     'Events',
//     'Education',
//     'Gaming',
//     'Yoga',
//     'Animation'
//   ];

//   // Set to keep track of selected interests
//   final Set<String> _selectedInterests = {};

//   // Getters
//   List<String> get interests => _interests;
//   Set<String> get selectedInterests => _selectedInterests;

//   // Add or remove interest
//   void toggleInterest(String interest) {
//     if (_selectedInterests.contains(interest)) {
//       _selectedInterests.remove(interest);
//     } else {
//       _selectedInterests.add(interest);
//     }
//     notifyListeners(); // Notify listeners of changes
//   }

//   // Check if interest is selected
//   bool isInterestSelected(String interest) {
//     return _selectedInterests.contains(interest);
//   }

//   // Clear all selected interests
//   void clearSelections() {
//     _selectedInterests.clear();
//     notifyListeners();
//   }
// }
import 'package:flutter/material.dart';

class Interest {
  final String name;
  final String videoUrl;

  Interest({required this.name, required this.videoUrl});
}
  class InterestSelectionProvider with ChangeNotifier {
  final List<Interest> _interests = [
    Interest(
        name: 'Animals',
        videoUrl: 'https://assets.mixkit.co/videos/4702/4702-720.mp4'),
    Interest(
        name: 'Comedy',
        videoUrl: 'https://assets.mixkit.co/videos/4830/4830-720.mp4'),
    Interest(
        name: 'Food',
        videoUrl: 'https://assets.mixkit.co/videos/46321/46321-720.mp4'),
    Interest(
        name: 'Sports',
        videoUrl: 'https://assets.mixkit.co/videos/48121/48121-720.mp4'),
    Interest(
        name: 'Travel',
        videoUrl: 'https://assets.mixkit.co/videos/46156/46156-720.mp4'),
    Interest(
        name: 'Dance',
        videoUrl: 'https://assets.mixkit.co/videos/49504/49504-720.mp4'),
  ];

  final Set<Interest> _selectedInterests = {};

  List<Interest> get interests => _interests;
  Set<Interest> get selectedInterests => _selectedInterests;

  void toggleInterest(Interest interest) {
    if (_selectedInterests.contains(interest)) {
      _selectedInterests.remove(interest);
    } else {
      _selectedInterests.add(interest);
    }
    notifyListeners();
  }

  bool isInterestSelected(Interest interest) => _selectedInterests.contains(interest);

  void clearSelections() {
    _selectedInterests.clear();
    notifyListeners();
  }
}
