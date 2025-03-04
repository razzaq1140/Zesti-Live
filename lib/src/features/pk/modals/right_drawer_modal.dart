import 'package:flutter_application_zestilive/src/common/const/app_images.dart';

class RightDrawerModal {
  final String profileImageUrl;
  final String profileText;

  RightDrawerModal({required this.profileImageUrl, required this.profileText});
}

List<RightDrawerModal> rightdrawer = [
  RightDrawerModal(
      profileImageUrl: AppNetworkImages.networkEight, profileText: 'Ahmer'),
  RightDrawerModal(
      profileImageUrl: AppNetworkImages.networkNine, profileText: 'Shurahbeel'),
  RightDrawerModal(
      profileImageUrl: AppNetworkImages.networkTen, profileText: 'Jan'),
  RightDrawerModal(
      profileImageUrl: AppNetworkImages.networkEleven, profileText: 'Gujjar'),
  RightDrawerModal(
      profileImageUrl: AppNetworkImages.networkTwelve, profileText: 'Ahmer'),
  RightDrawerModal(
      profileImageUrl: AppNetworkImages.networkThirteen,
      profileText: 'Shurahbeel'),
  RightDrawerModal(
      profileImageUrl: AppNetworkImages.networkFourteen, profileText: 'Jan'),
  RightDrawerModal(
      profileImageUrl: AppNetworkImages.networkEight, profileText: 'Gujjar')
];
