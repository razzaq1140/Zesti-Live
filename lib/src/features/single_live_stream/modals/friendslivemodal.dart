import 'package:flutter_application_zestilive/src/common/const/app_images.dart';

// Step 1: Create the User data class
class FriendLive {
  final String name;
  final String imageUrl;
  final String fireCount;
  final String micStatus;
  final String label;

  FriendLive({
    required this.name,
    required this.imageUrl,
    required this.fireCount,
    required this.micStatus,
    required this.label,
  });
}

// Step 2: Replace raw data with a list of User objects
final List<FriendLive> friendLive = [
  FriendLive(
    name: 'Akshay Syal',
    imageUrl: AppImages.allPopularScreen,
    fireCount: '2',
    micStatus: 'muted',
    label: 'Anchor',
  ),
  FriendLive(
    name: 'Vis1245',
    imageUrl: AppImages.multiGuestPlayTab,
    fireCount: '3',
    micStatus: 'active',
    label: '',
  ),
  FriendLive(
    name: 'Lovely58G',
    imageUrl: AppImages.allPopularScreen,
    fireCount: '2',
    micStatus: 'muted',
    label: '',
  ),
  FriendLive(
    name: 'Lester Mitchells',
    imageUrl: AppImages.multiGuestPlayTab,
    fireCount: '4',
    micStatus: 'active',
    label: '',
  ),
];
