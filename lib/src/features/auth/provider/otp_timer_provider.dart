import 'dart:async';
import 'package:flutter/material.dart';

class CountdownProvider extends ChangeNotifier {
  Timer? _timer;
  int _timeLeft = 60;

  int get timeLeft => _timeLeft;

  CountdownProvider() {
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        _timeLeft--;
        notifyListeners();
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }
}
