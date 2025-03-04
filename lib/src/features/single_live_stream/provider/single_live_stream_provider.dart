import 'package:flutter/material.dart';

class SingleLiveStreamProvider with ChangeNotifier {
  int _currentPage = 0;

  final Map<String, bool> _taskStatus = {};

  bool isTaskTapped(String taskTitle) {
    return _taskStatus[taskTitle] ?? false;
  }

  void toggleTaskStatus(String taskTitle) {
    _taskStatus[taskTitle] =
        !_taskStatus.containsKey(taskTitle) || !_taskStatus[taskTitle]!;

    notifyListeners();
  }

  void setCurrentPage(int index) {
    _currentPage = index;
    notifyListeners();
  }

  int get currentPage => _currentPage;
}
