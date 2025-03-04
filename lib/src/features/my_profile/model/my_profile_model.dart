import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyProfileModel {
  final String username;
  final String userId;
  final String profileImage;
  final List<Badge> badges;
  final List<Follower> followers;
  final String myDescription;
  final List<MyContribution> contributions;
  final List<MyMoment> moments;
  final List<MyShortVideo> shorts;

  final String dateOfBirth;
  final List<String> knownLanguages;
  final List<String> interests;
  final List<String> skills;
  final List<MyEducationCareer> education;
  final List<MyEducationCareer> career;
  final List<MySocialProfile> socialProfiles;

  MyProfileModel({
    required this.username,
    required this.userId,
    required this.profileImage,
    required this.badges,
    required this.followers,
    required this.myDescription,
    required this.contributions,
    required this.moments,
    required this.shorts,
    required this.dateOfBirth,
    required this.knownLanguages,
    required this.interests,
    required this.skills,
    required this.education,
    required this.career,
    required this.socialProfiles,
  });

  static List<MyProfileModel> sampleProfiles = [
    MyProfileModel(
      username: 'Akshay Kumar',
      userId: '#152515',
      profileImage: AppNetworkImages.networkOne,
      myDescription:
          'One day I woke up and realized I was not made for anyone. I was made for me.',
      contributions: [
        MyContribution(type: 'Silver', imageUrl: AppImages.profileSilver),
        MyContribution(type: 'Gold', imageUrl: AppImages.profileGold),
        MyContribution(type: 'Platinum', imageUrl: AppImages.profilePlatinum),
      ],
      moments: [
        MyMoment(
          timepassed: '99 minutes ago',
          commentCount: 54,
          authorName: 'Akshay Syal',
          location: 'SilverKey Executive Stays, Noida',
          profileImage: AppImages.profilePhoto,
          postImage: AppImages.videoCard,
          caption:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in',
          isExpanded: false,
          likes: 238562,
        ),
      ],
      shorts: [
        MyShortVideo(thumbnail: AppImages.videoCard, views: '1.2K'),
      ],
      dateOfBirth: '11 Oct 1988',
      knownLanguages: ['Hindi', 'English'],
      interests: ['Singing', 'Traveling', 'Dancing'],
      skills: ['UX Research', 'Prototyping', 'Coding'],
      education: [
        MyEducationCareer(
            title: 'Institute of Engineering, Delhi', dateRange: '2004-2008'),
      ],
      career: [
        MyEducationCareer(
            title: 'CEO, Bams Technologies', dateRange: 'Feb 2019 - Present'),
      ],
      socialProfiles: [
        MySocialProfile(platformName: 'Facebook', imageUrl: AppImages.facebook),
        MySocialProfile(platformName: 'Instagram', imageUrl: AppImages.insta),
        MySocialProfile(platformName: 'Linkedin', imageUrl: AppImages.linkedin),
        MySocialProfile(
            platformName: 'Pinterest', imageUrl: AppImages.pintrest),
      ],
      badges: [
        Badge(
          text: "35",
          color: AppColor.tagOrange,
          icon: SvgPicture.asset(AppIcons.tagLocation),
        ),
        Badge(
          text: "24",
          color: AppColor.tagBlue,
          icon: SvgPicture.asset(AppIcons.tagMars),
        ),
        Badge(
          text: "Lv.2",
          color: AppColor.appGreen,
        ),
      ],
      followers: [
        Follower(label: "Fans", count: "120K"),
        Follower(label: "Following", count: "110"),
        Follower(
          label: "Zircon",
          count: "3.3M",
          icon: SvgPicture.asset(AppIcons.zircon),
        ),
        Follower(
          label: "Ruby",
          count: "180K",
          icon: SvgPicture.asset(AppIcons.ruby),
        ),
      ],
    ),
  ];
}

class MyContribution {
  final String type;
  final String imageUrl;

  MyContribution({
    required this.type,
    required this.imageUrl,
  });
}

class MyMoment {
  final String authorName;
  final String location;
  final String profileImage;
  final String postImage;
  final String caption;
  final bool isExpanded;
  int likes;
  final int commentCount;
  final String timepassed;

  MyMoment({
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

class MyShortVideo {
  final String thumbnail;
  final String views;

  MyShortVideo({
    required this.thumbnail,
    required this.views,
  });
}

class MyEducationCareer {
  final String title;
  final String dateRange;

  MyEducationCareer({
    required this.title,
    required this.dateRange,
  });
}

class MySocialProfile {
  final String platformName;
  final String imageUrl;

  MySocialProfile({
    required this.platformName,
    required this.imageUrl,
  });
}

class Badge {
  final String? text;
  final Color color;
  final Widget? icon;

  Badge({this.text, required this.color, this.icon});
}

class Follower {
  final String label;
  final String count;
  final Widget? icon;

  Follower({required this.label, required this.count, this.icon});
}
