import 'package:flutter/material.dart';

class PkMatchProvider with ChangeNotifier {
  final PageController _pageController = PageController();

  PageController get pageController => _pageController;
  int _leftVotes = 190;
  int _rightVotes = 150;
  int _currentPage = 0;
  int get currentPage => _currentPage;
  bool _isFollwoed = true;
  int _dropdownValue = 1;

  void setDropdownValue(int newValue) {
    _dropdownValue = newValue;
    notifyListeners();
  }

  void toggleButton() {
    _isFollwoed = !_isFollwoed;
    notifyListeners();
  }

  void setCurrentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }

  void updateVotes(int leftVotes, int rightVotes) {
    _leftVotes = leftVotes;
    _rightVotes = rightVotes;
    notifyListeners();
  }

  double get sliderValue {
    if (_leftVotes + _rightVotes == 0) {
      return 0.5;
    }
    return _leftVotes / (_leftVotes + _rightVotes);
  }

  int get leftVotes => _leftVotes;
  int get rightVotes => _rightVotes;
  bool get isFollwoed => _isFollwoed;
  int get dropdownValue => _dropdownValue;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
