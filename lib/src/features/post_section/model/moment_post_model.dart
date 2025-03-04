import 'package:flutter_application_zestilive/src/common/const/app_images.dart';

class MomentPost {
  final String authorName;
  final String profileImage;
  final String location;
  final String postImage;
  final String caption;
  final String timepassed;
  int likes;
  bool isLiked;
  bool isReported;
  bool isExpanded;
  final int commentCount;

  MomentPost({
    required this.authorName,
    required this.profileImage,
    required this.location,
    required this.postImage,
    required this.caption,
    required this.timepassed,
    this.likes = 0,
    this.isLiked = false,
    this.isReported = false,
    this.isExpanded = false,
    this.commentCount = 0,
  });
}

List<MomentPost> momentPostList = [
  MomentPost(
    timepassed: '99 minutes ago',
    commentCount: 54,
    authorName: 'Akshay Syal',
    location: 'SilverKey Executive Stays, Noida',
    profileImage: AppImages.profilePhoto,
    postImage: AppImages.image1,
    caption:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in',
    isExpanded: false,
    likes: 238562,
  ),
  MomentPost(
    timepassed: '99 minutes ago',
    commentCount: 54,
    authorName: 'Akshay Syal',
    location: 'SilverKey Executive Stays, Noida',
    profileImage: AppImages.profilePhoto,
    postImage: AppImages.image2,
    caption:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in',
    isExpanded: false,
    likes: 238562,
  ),
];
