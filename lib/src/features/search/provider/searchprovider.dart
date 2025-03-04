import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/features/search/modal/search_modal.dart';

class SearchProvider extends ChangeNotifier {
  final List<SearchUsers> _searchUsers = [
    SearchUsers(
      trailingicon: AppIcons.circleCheck,
      name: 'Jannete King',
      rating: '4.5',
      avatarUrl: AppImages.allPopularScreen,
    ),
    SearchUsers(
      trailingicon: AppIcons.circlePlus,
      name: 'Alex Johnson',
      rating: '4.8',
      avatarUrl: AppImages.allPopularScreen,
    ),
    SearchUsers(
      trailingicon: AppIcons.bothFollow,
      name: 'Emily Davis',
      rating: '4.6',
      avatarUrl: AppImages.allPopularScreen,
    ),
    SearchUsers(
      trailingicon: AppIcons.circleCheck,
      name: 'Michael Brown',
      rating: '4.3',
      avatarUrl: AppImages.allPopularScreen,
    ),
    SearchUsers(
      trailingicon: AppIcons.circlePlus,
      name: 'Sophia Wilson',
      rating: '4.7',
      avatarUrl: AppImages.allPopularScreen,
    ),
    // Add more users here
  ];

  // This will hold the filtered users
  List<SearchUsers> _filteredUsers = [];

  // Getter for the filtered users
  List<SearchUsers> get filteredUsers => _filteredUsers;

  SearchProvider() {
    _filteredUsers = _searchUsers; // Initially show all users
  }

  // Function to filter users based on search query
  void filterUsers(String query) {
    if (query.isEmpty) {
      _filteredUsers = _searchUsers;
    } else {
      _filteredUsers = _searchUsers.where((user) {
        final nameLower = user.name.toLowerCase();
        final queryLower = query.toLowerCase();
        return nameLower.contains(queryLower);
      }).toList();
    }
    notifyListeners(); // Notify listeners to update the UI
  }
}
