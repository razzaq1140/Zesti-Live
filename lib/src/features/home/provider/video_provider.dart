import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoProvider extends ChangeNotifier {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;
  VideoPlayerController get controller => _controller;

  void initializeVideo(String videoPath) {
    _controller = VideoPlayerController.asset(videoPath)
      ..initialize().then((_) {
        _isInitialized = true;
        _controller.setLooping(true);
        notifyListeners(); 
        playVideo(); 
      });
  }

  void playVideo() {
    if (_isInitialized) {
      _controller.play();
      notifyListeners();
    }
  }
  void pauseVideo() {
    if (_isInitialized) {
      _controller.pause();
      notifyListeners();
    }
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
