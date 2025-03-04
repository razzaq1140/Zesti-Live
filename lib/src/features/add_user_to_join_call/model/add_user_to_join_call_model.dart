import 'package:flutter_application_zestilive/src/common/const/app_images.dart';

class AddUserToJoinCall{
  String name;
  String image;
  bool isSelected;
  bool isOnline;
  
  AddUserToJoinCall({
    required this.name,
    required this.image,
    this.isSelected = false,
    this.isOnline = false,
});
}

