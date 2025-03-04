import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import '../models/language_model.dart';

class SearchLanguageProvider extends ChangeNotifier {
  String? selectedCountry;
  bool isSubmitVisible = false;
  List<CountryModel> filteredCountries = [];
  final List<CountryModel> countries = [
    CountryModel(countryName: 'English', imageAsset: AppImages.english),
    CountryModel(countryName: 'Español', imageAsset: AppImages.espanol),
    CountryModel(countryName: 'Français', imageAsset: AppImages.france),
    CountryModel(countryName: 'China', imageAsset: AppImages.viet),
    CountryModel(countryName: 'Japanese', imageAsset: AppImages.japanese),
    CountryModel(countryName: 'Hindi', imageAsset: AppImages.hindi),
    CountryModel(countryName: 'Bangla', imageAsset: AppImages.bangladesh),
    CountryModel(countryName: 'Indonesia', imageAsset: AppImages.indonesia),
    CountryModel(countryName: 'Russian', imageAsset: AppImages.russian),
    CountryModel(countryName: 'Sweat', imageAsset: AppImages.japanese),
    CountryModel(countryName: 'Vietnam', imageAsset: AppImages.viet),
  ];

  LanguageProvider() {
    filteredCountries = countries; // Initialize with all countries
  }

  // Filter countries based on search input
  void filterCountries(String searchQuery) {
    if (searchQuery.isEmpty) {
      filteredCountries = countries;
    } else {
      filteredCountries = countries
          .where((country) => country.countryName
              .toLowerCase()
              .contains(searchQuery.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  // Select or deselect a country
  void toggleCountrySelection(String countryName) {
    if (selectedCountry == countryName) {
      selectedCountry = null;
      isSubmitVisible = false;
    } else {
      selectedCountry = countryName;
      isSubmitVisible = true;
    }
    notifyListeners();
  }
}
