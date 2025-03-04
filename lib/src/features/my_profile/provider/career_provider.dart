import 'package:flutter/material.dart';

class CareerProvider with ChangeNotifier {
  // Fields for the form
  String _position = '';
  String _company = '';
  String _startDate = '';
  String _endDate = '';

  // Validation flags
  bool _isPositionValid = true;
  bool _isCompanyValid = true;
  bool _isStartDateValid = true;
  bool _isEndDateValid = true;

  // Getters for the form fields
  String get position => _position;
  String get company => _company;
  String get startDate => _startDate;
  String get endDate => _endDate;

  // Getters for validation flags
  bool get isPositionValid => _isPositionValid;
  bool get isCompanyValid => _isCompanyValid;
  bool get isStartDateValid => _isStartDateValid;
  bool get isEndDateValid => _isEndDateValid;

  // Method to update position
  void updatePosition(String value) {
    _position = value;
    _isPositionValid = _position.isNotEmpty;
    notifyListeners();
  }

  // Method to update company
  void updateCompany(String value) {
    _company = value;
    _isCompanyValid = _company.isNotEmpty;
    notifyListeners();
  }

  // Method to update start date
  void updateStartDate(String value) {
    _startDate = value;
    _isStartDateValid = _startDate.isNotEmpty;
    notifyListeners();
  }

  // Method to update end date
  void updateEndDate(String value) {
    _endDate = value;
    _isEndDateValid = _endDate.isNotEmpty;
    notifyListeners();
  }

  // Method to clear position
  void clearPosition() {
    _position = '';
    _isPositionValid = false;
    notifyListeners();
  }

  // Method to clear company
  void clearCompany() {
    _company = '';
    _isCompanyValid = false;
    notifyListeners();
  }

  // Method to clear start date
  void clearStartDate() {
    _startDate = '';
    _isStartDateValid = false;
    notifyListeners();
  }

  // Method to clear end date
  void clearEndDate() {
    _endDate = '';
    _isEndDateValid = false;
    notifyListeners();
  }

  // Method to validate the form
  bool isFormValid() {
    _isPositionValid = _position.isNotEmpty;
    _isCompanyValid = _company.isNotEmpty;
    _isStartDateValid = _startDate.isNotEmpty;
    _isEndDateValid = _endDate.isNotEmpty;
    notifyListeners();
    return _isPositionValid &&
        _isCompanyValid &&
        _isStartDateValid &&
        _isEndDateValid;
  }

  // Method to validate individual fields and trigger UI feedback
  void validateFields() {
    _isPositionValid = _position.isNotEmpty;
    _isCompanyValid = _company.isNotEmpty;
    _isStartDateValid = _startDate.isNotEmpty;
    _isEndDateValid = _endDate.isNotEmpty;
    notifyListeners();
  }
}
