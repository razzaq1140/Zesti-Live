import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {
  int _currentPageIndex = 0;

  int get currentPageIndex => _currentPageIndex;

  void nextPage() {
    if (_currentPageIndex < 2) {
      _currentPageIndex++;
      notifyListeners();
    }
  }

  void previousPage() {
    if (_currentPageIndex > 0) {
      _currentPageIndex--;
      notifyListeners();
    }
  }

  void setPage(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }

  bool get isLastPage => _currentPageIndex == 2;
  bool get isFirstPage => _currentPageIndex == 0;
}
