import 'package:flutter/material.dart';

class GiftTabProvider with ChangeNotifier {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentGiftPage = 0;

  GiftTabProvider() {
    _pageController.addListener(_pageListener);
  }

  PageController get pageController => _pageController;
  int get currentGiftPage => _currentGiftPage;

  void _pageListener() {
    final page = _pageController.page?.round() ?? 0;
    if (_currentGiftPage != page) {
      _currentGiftPage = page;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }
}
