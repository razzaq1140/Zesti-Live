import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TabProvider extends ChangeNotifier {
  int _selectedIndex = 1;
  final List<VideoPlayerController> _followingControllers = [];
  final List<VideoPlayerController> _forYouControllers = [];



  int get selectedIndex => _selectedIndex;

  List<VideoPlayerController> get followingControllers => _followingControllers;
  List<VideoPlayerController> get forYouControllers => _forYouControllers;


  List<VideoPlayerController> get currentControllers =>
      _selectedIndex == 0 ? _followingControllers : _forYouControllers;
 
  void updateSelectedIndex(int index) {
    
    _selectedIndex = index;
    notifyListeners();
  }

  
  }

 

