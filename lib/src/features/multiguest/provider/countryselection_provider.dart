import 'package:flutter/material.dart';

class CountrySelectionProvider extends ChangeNotifier {
  int _selectedCountryIndex = -1; // -1 indicates no country is selected

  // Getter to access the currently selected country's index
  int get selectedCountryIndex => _selectedCountryIndex;

  // Method to update the selected country and notify listeners
  void selectCountry(int index) {
    _selectedCountryIndex = index;
    notifyListeners(); // Notify listeners to rebuild UI based on this change
  }
}
