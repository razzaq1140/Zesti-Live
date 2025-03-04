import 'package:flutter/material.dart';

class SelectedImageProvider with ChangeNotifier {
  String? _selectedImage;
  String _pfpImageUrl = 'https://i.pinimg.com/enabled_lo_mid/736x/ab/b4/64/abb464085b2079450502b62ff20ca0f4.jpg';

  String? get selectedImage => _selectedImage;
  String get pfpImageUrl => _pfpImageUrl;

  void setSelectedImage(String imageUrl) {
    _selectedImage = imageUrl;
    notifyListeners();
  }

  void setProfileImage(String newUrl) {
    _pfpImageUrl = newUrl;
    notifyListeners();
  }
}
