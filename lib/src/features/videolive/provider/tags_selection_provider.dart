import 'package:flutter/material.dart';

class TagSelectionProvider with ChangeNotifier {
  String? _selectedTag;

  String? get selectedTag => _selectedTag;

  void selectTag(String tag) {
    _selectedTag = tag;
    notifyListeners();
  }

  void deselectTag() {
    _selectedTag = null;
    notifyListeners();
  }

  bool isTagSelected(String tag) => _selectedTag == tag;
}
