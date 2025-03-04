import 'package:flutter/material.dart';

class LanguageSelectionProvider extends ChangeNotifier {
  int _selectedIndex = -1; 

  int get selectedIndex => _selectedIndex;

  void selectLanguage(int index) {
    if (_selectedIndex == index) {
      _selectedIndex = -1; 
    } else {
      _selectedIndex = index; 
    }
    notifyListeners();
  }
}