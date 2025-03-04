import 'package:flutter/cupertino.dart';

class GameSteamerProvider with ChangeNotifier {
  int _tabBarIndex = 0;
  int get tabBarindex => _tabBarIndex;

  void getTabBarIndex(index) {
    _tabBarIndex = index;

    notifyListeners();
  }

  int _getTabBatIndex = 0;
  int get getTabBatIndex => _getTabBatIndex;
  void SeletedTapBarIndex(index) {
    _getTabBatIndex = index;
    notifyListeners();
  }
}
