// lib/features/yeah_home/providers/following_provider.dart
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../modals/reels_modal.dart';

class FollowingProvider with ChangeNotifier {
  final List<ReelModal> _reels = [];
  final List<VideoPlayerController> _controllers = [];

  List<ReelModal> get reels => _reels;
  List<VideoPlayerController> get controllers => _controllers;

  void loadReels(List<ReelModal> reelList) {
    _reels.clear();
    _controllers.clear();

    for (var reel in reelList) {
      _reels.add(reel);
      final controller = VideoPlayerController.network(reel.videoUrl);
      _controllers.add(controller);
      controller.initialize().then((_) {
        notifyListeners();
      });
    }
  }

  // Toggle the like state for a specific video
  void toggleLike(int index) {
    if (index >= 0 && index < _reels.length) {
      final reel = _reels[index];
      reel.isLiked = !reel.isLiked;
      reel.likeCount += reel.isLiked ? 1 : -1;
      notifyListeners();
    }
  }

  void pauseAllVideos() {
    for (var controller in _controllers) {
      if (controller.value.isPlaying) {
        controller.pause();
      }
    }
  }

  void playVideo(int index) {
    if (index >= 0 && index < _controllers.length) {
      _controllers[index].play();
      notifyListeners();
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
