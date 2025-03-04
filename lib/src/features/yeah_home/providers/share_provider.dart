import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareProvider extends ChangeNotifier {
  int _shareCount = 0;

  int get shareCount => _shareCount;

  // Method to share the YouTube video URL and increment the share count
  void shareVideo(String videoUrl) {
    Share.share('Check out this video: $videoUrl');
    _shareCount++;  // Increment the share count when shared
    notifyListeners();  // Notify listeners to update the UI
  }
}
