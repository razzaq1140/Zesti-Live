import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  bool _isFavorited = false;
  int _favoriteCount = 0;

  bool get isFavorited => _isFavorited;
  int get favoriteCount => _favoriteCount;

  void toggleFavorite() {
    _isFavorited = !_isFavorited;
    _favoriteCount = _isFavorited ? _favoriteCount + 1 : _favoriteCount - 1;
    notifyListeners(); 
  }
}
