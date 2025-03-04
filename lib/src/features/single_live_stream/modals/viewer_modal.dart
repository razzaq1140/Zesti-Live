import 'package:flutter_application_zestilive/src/common/const/app_images.dart';

class Viewer {
  final String name;
  final String status;
  final String profileImage;
  final bool? isVIP;

  Viewer({
    required this.name,
    required this.status,
    required this.profileImage,
    this.isVIP = false,
  });
}

final List<Viewer> singleDrawerviewers = [
  Viewer(
      name: 'AKshey Sayal',
      status: 'i am the i am but who is am',
      profileImage: AppImages.allPopularScreen,
      isVIP: true),
  Viewer(
    name: 'John Doe',
    status: 'Normal',
    profileImage: AppImages.allPopularScreen,
  ),
  Viewer(
    name: 'Jane Smith',
    status: 'i am the i am but who is am',
    profileImage: AppImages.allPopularScreen,
  ),
  Viewer(
      name: 'AKshey Sayal',
      status: 'i am the i am but who is am',
      profileImage: AppImages.allPopularScreen,
      isVIP: true),
  Viewer(
    name: 'John Doe',
    status: 'Normal',
    profileImage: AppImages.allPopularScreen,
  ),
  Viewer(
    name: 'Jane Smith',
    status: 'i am the i am but who is am',
    profileImage: AppImages.allPopularScreen,
  ),
  Viewer(
      name: 'AKshey Sayal',
      status: 'i am the i am but who is am ',
      profileImage: AppImages.allPopularScreen,
      isVIP: true),
  Viewer(
    name: 'John Doe',
    status: 'Normal',
    profileImage: AppImages.allPopularScreen,
  ),
  Viewer(
    name: 'Jane Smith',
    status: 'i am the i am but who is am',
    profileImage: AppImages.allPopularScreen,
  ),
  Viewer(
      name: 'AKshey Sayal',
      status: 'i am the i am but who is am',
      profileImage: AppImages.allPopularScreen,
      isVIP: true),
  Viewer(
    name: 'John Doe',
    status: 'Normal',
    profileImage: AppImages.allPopularScreen,
  ),
  Viewer(
    name: 'Jane Smith',
    status: 'i am the i am but who is am',
    profileImage: AppImages.allPopularScreen,
  ),
];
