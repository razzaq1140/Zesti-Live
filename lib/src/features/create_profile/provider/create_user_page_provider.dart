import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class CreateUserProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  // Fields
  File? image;
  String? name;
  Country? selectedCountry;
  String homeTown = '';
  String gender = '';
  String dob = '';

  // Track whether the form has been submitted
  bool showErrors = false;

  // Setters
  void setImage(File newImage) {
    image = newImage;
    notifyListeners();
  }

  void setName(String? value) {
    name = value;
    notifyListeners();
  }

  // void selectCountry(Country country) {
  //   selectedCountry = country;
  //   notifyListeners();
  // }

  // void setHomeTown(String value) {
  //   homeTown = value;
  //   notifyListeners();
  // }

  void selectGender(String value) {
    gender = value;
    notifyListeners();
  }

  void setDob(String value) {
    dob = value;
    notifyListeners();
  }

  // Validation Methods
  String? validateName() {
    if (showErrors && (name == null || name!.isEmpty)) {
      return 'Name is required';
    }
    return null;
  }

  // String? validateHomeTown() {
  //   if (showErrors && homeTown.isEmpty) {
  //     return 'Home Town is required';
  //   }
  //   return null;
  // }

  // bool validateCountry() => !showErrors || selectedCountry != null;
  bool validateGender() => !showErrors || gender.isNotEmpty;
  bool validateDob() => !showErrors || dob.isNotEmpty;
  // bool validateImage() => !showErrors || image != null;

  bool validateForm() {
    showErrors = true;
    notifyListeners();

    // Validate all form fields based on current state
    bool isFormValid = formKey.currentState?.validate() ?? false;
    // bool isCountryValid = validateCountry();
    bool isGenderValid = validateGender();
    bool isDobValid = validateDob();
    // bool isImageValid = validateImage();

    // Return overall form validity
    return isFormValid &&  isGenderValid && isDobValid ;
    //&& isImageValid;
  }
}
