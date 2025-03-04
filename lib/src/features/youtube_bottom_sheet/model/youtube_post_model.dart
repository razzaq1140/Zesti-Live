import 'package:flutter_application_zestilive/src/common/const/app_images.dart';

class YoutubePostModel {
  final String image;
  final String userProfile;
  final String description;
  final String imageTitle;
  final String views;
  final String time;

  YoutubePostModel({
    required this.image,
    required this.userProfile,
    required this.description,
    required this.imageTitle,
    required this.views,
    required this.time,
  });
}

List<YoutubePostModel> postList = [
  YoutubePostModel(
      image: AppImages.youtubeThumbnail,
      userProfile: AppImages.cokeStudio,
      description:
          'Bulbuli | Coke Studio Bangla | Season One | Ritu Raj X Nandita',
      imageTitle: 'Coke Studio Bangla',
      views: '1.5 M views',
      time: '2 days ago'),
  YoutubePostModel(
      image: AppImages.youtubeThumbnail,
      userProfile: AppImages.cokeStudio,
      description:
          'Bulbuli | Coke Studio Bangla | Season One | Ritu Raj X Nandita',
      imageTitle: 'Coke Studio Bangla',
      views: '1.5 M views',
      time: '2 days ago'),
  YoutubePostModel(
      image: AppImages.youtubeThumbnail,
      userProfile: AppImages.cokeStudio,
      description:
          'Bulbuli | Coke Studio Bangla | Season One | Ritu Raj X Nandita',
      imageTitle: 'Coke Studio Bangla',
      views: '1.5 M views',
      time: '2 days ago'),
  YoutubePostModel(
      image: AppImages.youtubeThumbnail,
      userProfile: AppImages.cokeStudio,
      description:
          'Bulbuli | Coke Studio Bangla | Season One | Ritu Raj X Nandita',
      imageTitle: 'Coke Studio Bangla',
      views: '1.5 M views',
      time: '2 days ago'),
];
