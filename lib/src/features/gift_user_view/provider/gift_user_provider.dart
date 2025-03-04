import 'package:flutter/material.dart';

class GiftUserProvider with ChangeNotifier {
  bool _allIndex = false;
  bool get allIndex => _allIndex;
  void allIndexUpdate() {
    _allIndex = !_allIndex;
    notifyListeners();
  }

  int _giftSelectedIndex = 0;
  int get giftSelectedIndex => _giftSelectedIndex;
  void getGiftIndex(index) {
    _giftSelectedIndex = index;
    notifyListeners();
  }

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  int _giftCoinRange = 0;
  int get giftCoinRange => _giftCoinRange;
  void giftCoinRangeStatus(index) {
    _giftCoinRange = index;
    notifyListeners();
  }

  bool _isActive = false;
  bool get isActive => _isActive;
  void toggleButton() {
    _isActive = !_isActive;
    notifyListeners();
  }
}
