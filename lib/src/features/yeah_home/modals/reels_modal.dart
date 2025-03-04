import 'package:flutter_application_zestilive/src/common/const/app_images.dart';

class ReelModal {
  final String videoUrl;
  final String avatarUrl;
  final String username;
  final String videoCaption;
  final String musicName;
  int likeCount;
  bool isLiked;

  ReelModal({
    required this.videoUrl,
    required this.avatarUrl,
    required this.username,
    required this.videoCaption,
    required this.musicName,
    required this.likeCount,
    this.isLiked = false,
  });
}

final List<ReelModal> mockReelsData = [
  ReelModal(
    videoUrl:
        'https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4',
    avatarUrl: AppNetworkImages.networkFive,
    username: 'user5',
    videoCaption: 'Late night study sessions 📚',
    musicName: 'Focus Music',
    likeCount: 80,
  ),
  ReelModal(
    videoUrl:
        'https://storage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4',
    avatarUrl: AppNetworkImages.networkSix,
    username: 'user6',
    videoCaption: 'Hiking adventures!',
    musicName: 'Mountain Echoes',
    likeCount: 275,
  ),
  ReelModal(
    videoUrl:
        'https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    avatarUrl: AppNetworkImages.networkSeven,
    username: 'user7',
    videoCaption: 'City lights at night 🌆',
    musicName: 'Night Moves',
    likeCount: 190,
  ),
  ReelModal(
    videoUrl:
        'https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    avatarUrl: AppNetworkImages.networkEight,
    username: 'user8',
    videoCaption: 'Sunset vibes 🌅',
    musicName: 'Golden Hour',
    likeCount: 230,
  ),
  ReelModal(
    videoUrl:
        'https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    avatarUrl: AppNetworkImages.networkNine,
    username: 'user9',
    videoCaption: 'Skateboarding tricks 🛹',
    musicName: 'Urban Beats',
    likeCount: 310,
  ),
  ReelModal(
    videoUrl:
        'https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    avatarUrl: AppNetworkImages.networkTen,
    username: 'user10',
    videoCaption: 'Morning workout routine 💪',
    musicName: 'Power Up',
    likeCount: 125,
  ),
];
