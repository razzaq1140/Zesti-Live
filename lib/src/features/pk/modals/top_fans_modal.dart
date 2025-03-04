import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter/material.dart';

class TagItem {
  final Color backgroundColor;
  final String? iconPath;
  final String? text;

  TagItem({
    required this.backgroundColor,
    this.iconPath,
    this.text,
  });
}

class TopFan {
  final String avatarUrl;
  final String name;
  final String caption;
  final String rating;
  final String fans;
  final String following;
  final String zircon;
  final String ruby;
  final List<TagItem> tags;

  TopFan({
    required this.fans,
    required this.following,
    required this.zircon,
    required this.ruby,
    required this.avatarUrl,
    required this.name,
    required this.caption,
    required this.rating,
    required this.tags,
  });
}

List<TopFan> topFans = [
  TopFan(
    fans: '100k',
    following: '200M',
    ruby: '9K',
    zircon: '203',
    avatarUrl: AppImages.allPopularScreen,
    name: 'John Doe',
    caption: 'Great broadcaster',
    rating: '2',
    tags: [
      TagItem(
          backgroundColor: AppColor.tagBlue,
          iconPath: AppIcons.tagLocation,
          text: 'New'),
      TagItem(
          backgroundColor: AppColor.tagRed,
          iconPath: AppIcons.tagMars,
          text: null),
      TagItem(
          backgroundColor: AppColor.tagGreen, iconPath: null, text: 'Lv.234'),
      TagItem(
          backgroundColor: AppColor.tagOrange,
          iconPath: AppIcons.tagCrown,
          text: 'Top')
    ],
  ),
  TopFan(
    fans: '100k',
    following: '200M',
    ruby: '9K',
    zircon: '203',
    avatarUrl: AppImages.allPopularScreen,
    name: 'Jane Smith',
    caption: 'Awesome performer',
    rating: '2',
    tags: [
      TagItem(
          backgroundColor: AppColor.tagBlue,
          iconPath: AppIcons.tagLocation,
          text: 'New'),
      TagItem(
          backgroundColor: AppColor.tagRed,
          iconPath: AppIcons.tagMars,
          text: null),
      TagItem(
          backgroundColor: AppColor.tagGreen, iconPath: null, text: 'Lv.234'),
      TagItem(
          backgroundColor: AppColor.tagOrange,
          iconPath: AppIcons.tagCrown,
          text: 'Top')
    ],
  ),
];
