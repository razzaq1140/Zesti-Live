import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_svg/svg.dart';

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

class AudioUser {
  final int rank;
  final Widget select;
  final Widget done;
  final Widget star;
  final Widget ic;
  final Widget ic2;
  final Widget diamond;
  final String name;
  final String imageUrl;
  final String status;
  final bool isLive;
  final List<TagItem> tags;
  final int diamondsToReach;
  final String fans;
  final String following;
  final String zircon;
  final String ruby;

  AudioUser({
    required this.fans,
    required this.following,
    required this.zircon,
    required this.ruby,
    required this.rank,
    required this.name,
    required this.tags,
    required this.star,
    required this.diamond,
    required this.done,
    required this.select,
    required this.imageUrl,
    required this.status,
    required this.isLive,
    required this.diamondsToReach,
    required this.ic,
    required this.ic2,
  });
}

List<AudioUser> AudioUsers = [
  AudioUser(
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
          text: 'Top'),
    ],
    ic: SvgPicture.asset(AppIcons.ring),
    ic2: SvgPicture.asset(AppIcons.ring1),
    diamond: SvgPicture.asset(AppIcons.diamond1),
    star: SvgPicture.asset(AppIcons.star),
    select: SvgPicture.asset(AppIcons.select),
    done: SvgPicture.asset(AppIcons.done),
    rank: 1,
    name: 'Jeanette King',
    imageUrl: AppImages.profilePhoto,
    status: 'Top1',
    isLive: true,
    diamondsToReach: 192998,
    fans: '100k',
    following: '200M',
    ruby: '9K',
    zircon: '203',
  ),
  AudioUser(
      fans: '100k',
      following: '200M',
      ruby: '9K',
      zircon: '203',
      ic: SvgPicture.asset(AppIcons.ring),
      ic2: SvgPicture.asset(AppIcons.ring1),
      diamond: SvgPicture.asset(AppIcons.diamond1),
      star: SvgPicture.asset(AppIcons.star),
      select: SvgPicture.asset(AppIcons.select),
      done: SvgPicture.asset(AppIcons.done),
      rank: 2,
      name: 'The King',
      imageUrl: AppImages.profilePhoto,
      status: 'To reach person above',
      isLive: false,
      diamondsToReach: 192998,
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
      ]),
  AudioUser(
      fans: '100k',
      following: '200M',
      ruby: '9K',
      zircon: '203',
      ic: SvgPicture.asset(AppIcons.ring),
      ic2: SvgPicture.asset(AppIcons.ring1),
      diamond: SvgPicture.asset(AppIcons.diamond1),
      star: SvgPicture.asset(AppIcons.star),
      select: SvgPicture.asset(AppIcons.select),
      done: SvgPicture.asset(AppIcons.done),
      rank: 3,
      name: 'Akshay Syal',
      imageUrl: AppImages.profilePhoto,
      status: 'To reach person above',
      isLive: false,
      diamondsToReach: 192998,
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
      ]),
  AudioUser(
      fans: '100k',
      following: '200M',
      ruby: '9K',
      zircon: '203',
      ic: SvgPicture.asset(AppIcons.ring),
      ic2: SvgPicture.asset(AppIcons.ring1),
      diamond: SvgPicture.asset(AppIcons.diamond1),
      star: SvgPicture.asset(AppIcons.star),
      select: SvgPicture.asset(AppIcons.select),
      done: SvgPicture.asset(AppIcons.done),
      rank: 4,
      name: 'Akshay Syal',
      imageUrl: AppImages.profilePhoto,
      status: 'To reach person above',
      isLive: false,
      diamondsToReach: 192998,
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
            text: 'Top'),
      ]),
  AudioUser(
      fans: '100k',
      following: '200M',
      ruby: '9K',
      zircon: '203',
      ic: SvgPicture.asset(AppIcons.ring),
      ic2: SvgPicture.asset(AppIcons.ring1),
      diamond: SvgPicture.asset(AppIcons.diamond1),
      star: SvgPicture.asset(AppIcons.star),
      select: SvgPicture.asset(AppIcons.select),
      done: SvgPicture.asset(AppIcons.done),
      rank: 5,
      name: 'Akshay Syal',
      imageUrl: AppImages.profilePhoto,
      status: 'To reach person above',
      isLive: false,
      diamondsToReach: 192998,
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
      ]),
];
