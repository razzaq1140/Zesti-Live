import 'package:flutter/material.dart';

class ProfileBottomSheetProvider extends ChangeNotifier {
  bool isMicOn = false;
  bool isCameraOn = false;

  // Function to toggle microphone on and off
  void toggleMic() {
    isMicOn = !isMicOn;
    notifyListeners(); // Notify listeners when the state changes
  }

  // Function to toggle camera on and off
  void toggleCamera() {
    isCameraOn = !isCameraOn;
    notifyListeners(); // Notify listeners when the state changes
  }
}
