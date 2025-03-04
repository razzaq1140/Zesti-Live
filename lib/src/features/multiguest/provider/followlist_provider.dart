import 'package:flutter/material.dart';

class FollowListProvider with ChangeNotifier {
  final PageController pageController = PageController();
  bool isFollowListScreenShown = false;

  void showFollowListScreen() {
    if (!isFollowListScreenShown) {
      isFollowListScreenShown = true;
      pageController.jumpToPage(1);
      notifyListeners();
    }
  }

  void showMainScreen() {
    if (isFollowListScreenShown) {
      isFollowListScreenShown = false;
      pageController.jumpToPage(0);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
