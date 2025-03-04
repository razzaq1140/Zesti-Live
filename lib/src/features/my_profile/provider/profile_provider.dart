import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/create_profile/data/user_data.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/model/profile_modal.dart';

class UserProfileProvider extends ChangeNotifier {
  UserProfile _userProfile = getDefaultUserProfile();

  UserProfile get userProfile => _userProfile;

  void updateUserProfile(UserProfile newProfile) {
    _userProfile = newProfile;
    notifyListeners();
  }
}
