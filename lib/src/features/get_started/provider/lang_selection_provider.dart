import 'package:flutter/material.dart';

class LanguageSelectionProvider extends ChangeNotifier {
  String? _selectedCountry;
  bool _isSubmitVisible = false;

  String? get selectedCountry => _selectedCountry;
  bool get isSubmitVisible => _isSubmitVisible;

 void selectCountry(String countryName) {
    _selectedCountry = countryName;
    _isSubmitVisible = true;  
    notifyListeners();       
  }
}
