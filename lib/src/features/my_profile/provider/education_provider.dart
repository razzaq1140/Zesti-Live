import 'package:flutter/material.dart';

class EducationProvider with ChangeNotifier {
  String _schoolName = 'Your School Name';
  String _graduationDate = 'Tell us when you graduate';

  String get schoolName => _schoolName;
  String get graduationDate => _graduationDate;

  void updateSchoolName(String name) {
    _schoolName = name;
    notifyListeners();
  }

  void updateGraduationDate(String date) {
    _graduationDate = date;
    notifyListeners();
  }

  void clearSchoolName() {
    _schoolName = '';
    notifyListeners();
  }

  void clearGraduationDate() {
    _graduationDate = 'Tell us when you graduate';
    notifyListeners();
  }
}
