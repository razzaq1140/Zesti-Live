import 'package:flutter/material.dart';

class NewBottomNavigationBarProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

 void changeIndex(int index) {
  _selectedIndex = index;
  notifyListeners(); // Ensure UI updates
}

}






