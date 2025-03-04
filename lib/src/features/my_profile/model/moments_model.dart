import 'package:flutter_application_zestilive/src/common/const/app_images.dart'; // Make sure to import this

class Moment {
  final String authorName;
  final String location;
  final String profileImage;
  final String postImage;
  final String caption;
  final bool isExpanded;
  int likes;
  final int commentCount;
  final String timepassed;

  Moment({
    required this.timepassed,
    required this.authorName,
    required this.location,
    required this.profileImage,
    required this.postImage,
    required this.caption,
    required this.isExpanded,
    required this.likes,
    required this.commentCount,
  });
}

List<Moment> moments = [
  Moment(
    timepassed: '99 minutes ago',
    commentCount: 54,
    authorName: 'Akshay Syal',
    location: 'SilverKey Executive Stays, Noida',
    profileImage: AppImages.profilePhoto,  // Assuming these images are in your assets
    postImage: AppImages.videoCard,       // Assuming these images are in your assets
    caption:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in',
    isExpanded: false,
    likes: 238562,
  ),
];
