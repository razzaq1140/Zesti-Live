import 'package:flutter/cupertino.dart';

class GameSteamerProvider with ChangeNotifier {
  int clicktabBarIndex = 0;
  int get tabBarindex => clicktabBarIndex;

  void getTabBarIndex(index) {
    if(index==0){
     _getTabBatIndex  =0;
    }
    clicktabBarIndex = index;

    notifyListeners();
  }

  int _getTabBatIndex = 0;
  int get getTabBatIndex => _getTabBatIndex;
  void SeletedTapBarIndex(index) {
    _getTabBatIndex = index;
    notifyListeners();
  }

  // ignore: unused_field
  int _horizentalIndex=0;
  int get horizentalIndex=>horizentalIndex;
  void horizentalIndexUpdate(index){
_horizentalIndex=index;
notifyListeners();
  }
}
