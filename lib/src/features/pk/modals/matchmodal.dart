import 'package:flutter_application_zestilive/src/common/const/app_images.dart';

class Matchup {
  final String leftUserName;
  final String rightUserName;
  final String leftUserImage;
  final String rightUserImage;
  final double leftUserVotes;
  final double rightUserVotes;

  Matchup({
    required this.leftUserName,
    required this.rightUserName,
    required this.leftUserImage,
    required this.rightUserImage,
    required this.leftUserVotes,
    required this.rightUserVotes,
  });
}

final List<Matchup> matchups = [
  Matchup(
    leftUserName: "ProRocks",
    rightUserImage: AppNetworkImages.networkOne,
    leftUserVotes: 10000,
    rightUserName: "Selfie Queen",
    leftUserImage: AppNetworkImages.networkTwo,
    rightUserVotes: 9689,
  ),
  Matchup(
    leftUserName: "ProRocks",
    rightUserImage: AppNetworkImages.networkThree,
    leftUserVotes: 10000,
    rightUserName: "Selfie Queen",
    leftUserImage: AppNetworkImages.networkFour,
    rightUserVotes: 9689,
  ),
  Matchup(
    leftUserName: "ProRocks",
    rightUserImage: AppNetworkImages.networkFive,
    leftUserVotes: 10000,
    rightUserName: "Selfie Queen",
    leftUserImage: AppNetworkImages.networkSix,
    rightUserVotes: 9689,
  ),
  Matchup(
    leftUserName: "ProRocks",
    rightUserImage: AppNetworkImages.networkSeven,
    leftUserVotes: 10000,
    rightUserName: "Selfie Queen",
    leftUserImage: AppNetworkImages.networkEight,
    rightUserVotes: 9689,
  ),
  Matchup(
    leftUserName: "ProRocks",
    rightUserImage: AppNetworkImages.networkNine,
    leftUserVotes: 10000,
    rightUserName: "Selfie Queen",
    leftUserImage: AppNetworkImages.networkTen,
    rightUserVotes: 9689,
  ),
];
