import 'package:flutter/cupertino.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/features/add_user_to_join_call/model/add_user_to_join_call_model.dart';

class AddUserJoinCallProvider extends ChangeNotifier{

  List<AddUserToJoinCall> addUserToJoinCallList = [
    AddUserToJoinCall(name: 'Michael John', image: AppNetworkImages.profile,isOnline: true),
    AddUserToJoinCall(name: 'Jonathan', image: AppNetworkImages.profile,isOnline: false),
    AddUserToJoinCall(name: 'Lord Justin', image: AppNetworkImages.profile,isOnline: false),
    AddUserToJoinCall(name: 'Remi Chan', image: AppNetworkImages.profile,isOnline: false),
    AddUserToJoinCall(name: 'Katie Peru', image: AppNetworkImages.profile,isOnline: true),
    AddUserToJoinCall(name: 'Legia Micha', image: AppNetworkImages.profile,isOnline: true),
    AddUserToJoinCall(name: 'Michael John', image: AppNetworkImages.profile,isOnline: false),
    AddUserToJoinCall(name: 'Michael John', image: AppNetworkImages.profile,isOnline: true),
    AddUserToJoinCall(name: 'Michael John', image: AppNetworkImages.profile,isOnline: false),
    AddUserToJoinCall(name: 'Michael John', image: AppNetworkImages.profile,isOnline: false),
  ];
  void toggleSelection(int index) {
    addUserToJoinCallList[index].isSelected = !addUserToJoinCallList[index].isSelected;
    notifyListeners();
  }

}