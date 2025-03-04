import 'package:flutter/material.dart';

class MultiGuestCreateRoomProvider with ChangeNotifier {
  bool _isCameraOn = true;
  String _visibilityStatus = 'Public';
  String? _selectedTag;
  int _selectedSlots = 3;

  // Getters
  bool get isCameraOn => _isCameraOn;
  String get visibilityStatus => _visibilityStatus;
  String? get selectedTag => _selectedTag;
  int get selectedSlots => _selectedSlots;

  // Toggle Camera
  void toggleCamera() {
    _isCameraOn = !_isCameraOn;
    notifyListeners();
  }

  // Update Visibility Status
void updateVisibilityStatus(String? newStatus) {
  if (newStatus != null) {
    _visibilityStatus = newStatus;
    notifyListeners();
  }
}

  // Update Selected Tag
  void updateSelectedTag(String? tag) {
    _selectedTag = tag;
    notifyListeners();
  }

  // Update Selected Slots
  void updateSelectedSlots(int slots) {
    _selectedSlots = slots;
    notifyListeners();
  }
}
