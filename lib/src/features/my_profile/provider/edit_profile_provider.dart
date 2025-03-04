import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileProvider extends ChangeNotifier {
  String name = 'Akshay Syal';
  String gender = 'Male';
  String? birthday;
  String? country;
  String yeahliveID = '0123521';
  String bio = 'Input your bio';
  String? countryFlag;
  final List<Map<String, String>> _educationEntries = [];
  final List<Map<String, String>> _careerEntries = [];
  List<Map<String, String>> get educationEntries =>
      List.unmodifiable(_educationEntries);
  List<Map<String, String>> get careerEntries =>
      List.unmodifiable(_careerEntries);

  File? _backgroundImage;
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  // Getters for images
  File? get backgroundImage => _backgroundImage;
  File? get profileImage => _profileImage;

  void addEducation(String title, String subtitle) {
    _educationEntries.add({'title': title, 'subtitle': subtitle});
    notifyListeners();
  }

  // Method to add a new career entry
  void addCareer(
      String position, String company, String startDate, String endDate) {
    _careerEntries.add({
      'position': position,
      'company': company,
      'startDate': startDate,
      'endDate': endDate,
    });
    notifyListeners();
  }

  // Optional: Method to remove an entry by index
  void removeEducation(int index) {
    if (index < _educationEntries.length) {
      _educationEntries.removeAt(index);
      notifyListeners();
    }
  }

  void removeCareer(int index) {
    if (index < _careerEntries.length) {
      _careerEntries.removeAt(index);
      notifyListeners();
    }
  }

  void updateEducation(int index, String title, String subtitle) {
    if (index >= 0 && index < _educationEntries.length) {
      _educationEntries[index] = {'title': title, 'subtitle': subtitle};
      notifyListeners();
    }
  }

  // Methods to update basic fields
  void updateGender(String newGender) {
    gender = newGender;
    notifyListeners();
  }

  void updateCountry(String newCountry, {String? flag}) {
    country = newCountry;
    countryFlag = flag; // Store the flag as a String
    notifyListeners();
  }

  void updateBirthday(String newBirthday) {
    birthday = newBirthday;
    notifyListeners();
  }

  void updateName(String newName) {
    name = newName;
    notifyListeners();
  }

  void updateYeahliveID(String newID) {
    yeahliveID = newID;
    notifyListeners();
  }

  void updateBio(String newBio) {
    bio = newBio;
    notifyListeners();
  }

  // Pick a background image from gallery
  Future<void> pickBackgroundImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _backgroundImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  // Pick a background image from camera
  Future<void> pickBackgroundImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _backgroundImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  // Pick a profile image from gallery
  Future<void> pickProfileImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _profileImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  // Pick a profile image from camera
  Future<void> pickProfileImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _profileImage = File(pickedFile.path);
      notifyListeners();
    }
  }
}
