import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_svg/svg.dart';

class AudioViewerModel {
  final String name;
  final String status;
  final String profileImage;
  final bool? isVIP;
  final Widget? none;
  final Widget? ic1;
  final Widget? ic2;
  final Widget? ic3;
  final Widget? rin;
  final String? image;

  AudioViewerModel({
    required this.none,
    required this.image,
    required this.ic1,
    required this.ic2,
    required this.ic3,
    required this.rin,
    required this.name,
    required this.status,
    required this.profileImage,
    this.isVIP = false,
  });
}

final List<AudioViewerModel> drawerviewers = [
  AudioViewerModel(
      ic1: SvgPicture.asset(AppIcons.like),
      ic2: SvgPicture.asset(AppIcons.love),
      ic3: SvgPicture.asset(AppIcons.behaviour),
      rin: SvgPicture.asset(AppIcons.rings),
      none: SvgPicture.asset(AppIcons.none),
      image: AppImages.profileDp,
      name: 'AKshey Sayal',
      status: 'i am the i am but who is am',
      profileImage: AppImages.allPopularScreen,
      isVIP: true),
  AudioViewerModel(
    image: AppImages.profileDp,
    ic1: SvgPicture.asset(AppIcons.like),
    ic2: SvgPicture.asset(AppIcons.love),
    ic3: SvgPicture.asset(AppIcons.behaviour),
    rin: SvgPicture.asset(AppIcons.rings),
    none: SvgPicture.asset(AppIcons.none),
    name: 'John Doe',
    status: 'Normal',
    profileImage: AppImages.allPopularScreen,
  ),
  AudioViewerModel(
    image: AppImages.profileDp,
    ic1: SvgPicture.asset(AppIcons.like),
    ic2: SvgPicture.asset(AppIcons.love),
    ic3: SvgPicture.asset(AppIcons.behaviour),
    rin: SvgPicture.asset(AppIcons.rings),
    none: SvgPicture.asset(AppIcons.none),
    name: 'Jane Smith',
    status: 'i am the i am but who is am',
    profileImage: AppImages.allPopularScreen,
  ),
  AudioViewerModel(
      image: AppImages.profileDp,
      ic1: SvgPicture.asset(AppIcons.like),
      ic2: SvgPicture.asset(AppIcons.love),
      ic3: SvgPicture.asset(AppIcons.behaviour),
      rin: SvgPicture.asset(AppIcons.rings),
      none: SvgPicture.asset(AppIcons.none),
      name: 'AKshey Sayal',
      status: 'i am the i am but who is am',
      profileImage: AppImages.allPopularScreen,
      isVIP: true),
  AudioViewerModel(
    image: AppImages.profileDp,
    ic1: SvgPicture.asset(AppIcons.like),
    ic2: SvgPicture.asset(AppIcons.love),
    ic3: SvgPicture.asset(AppIcons.behaviour),
    rin: SvgPicture.asset(AppIcons.rings),
    none: SvgPicture.asset(AppIcons.none),
    name: 'John Doe',
    status: 'Normal',
    profileImage: AppImages.allPopularScreen,
  ),
  AudioViewerModel(
    image: AppImages.profileDp,
    ic1: SvgPicture.asset(AppIcons.like),
    ic2: SvgPicture.asset(AppIcons.love),
    ic3: SvgPicture.asset(AppIcons.behaviour),
    rin: SvgPicture.asset(AppIcons.rings),
    none: SvgPicture.asset(AppIcons.none),
    name: 'Jane Smith',
    status: 'i am the i am but who is am',
    profileImage: AppImages.allPopularScreen,
  ),
  AudioViewerModel(
      image: AppImages.profileDp,
      ic1: SvgPicture.asset(AppIcons.like),
      ic2: SvgPicture.asset(AppIcons.love),
      ic3: SvgPicture.asset(AppIcons.behaviour),
      rin: SvgPicture.asset(AppIcons.rings),
      none: SvgPicture.asset(AppIcons.none),
      name: 'AKshey Sayal',
      status: 'i am the i am but who is am ',
      profileImage: AppImages.allPopularScreen,
      isVIP: true),
  AudioViewerModel(
    image: AppImages.profileDp,
    ic1: SvgPicture.asset(AppIcons.like),
    ic2: SvgPicture.asset(AppIcons.love),
    ic3: SvgPicture.asset(AppIcons.behaviour),
    rin: SvgPicture.asset(AppIcons.rings),
    none: SvgPicture.asset(AppIcons.none),
    name: 'John Doe',
    status: 'Normal',
    profileImage: AppImages.allPopularScreen,
  ),
  AudioViewerModel(
    image: AppImages.profileDp,
    ic1: SvgPicture.asset(AppIcons.like),
    ic2: SvgPicture.asset(AppIcons.love),
    ic3: SvgPicture.asset(AppIcons.behaviour),
    rin: SvgPicture.asset(AppIcons.rings),
    none: SvgPicture.asset(AppIcons.none),
    name: 'Jane Smith',
    status: 'i am the i am but who is am',
    profileImage: AppImages.allPopularScreen,
  ),
  AudioViewerModel(
      image: AppImages.profileDp,
      ic1: SvgPicture.asset(AppIcons.like),
      ic2: SvgPicture.asset(AppIcons.love),
      ic3: SvgPicture.asset(AppIcons.behaviour),
      rin: SvgPicture.asset(AppIcons.rings),
      none: SvgPicture.asset(AppIcons.none),
      name: 'AKshey Sayal',
      status: 'i am the i am but who is am',
      profileImage: AppImages.allPopularScreen,
      isVIP: true),
  AudioViewerModel(
    image: AppImages.profileDp,
    ic1: SvgPicture.asset(AppIcons.like),
    ic2: SvgPicture.asset(AppIcons.love),
    ic3: SvgPicture.asset(AppIcons.behaviour),
    rin: SvgPicture.asset(AppIcons.rings),
    none: SvgPicture.asset(AppIcons.none),
    name: 'John Doe',
    status: 'Normal',
    profileImage: AppImages.allPopularScreen,
  ),
  AudioViewerModel(
    image: AppImages.profileDp,
    ic1: SvgPicture.asset(AppIcons.like),
    ic2: SvgPicture.asset(AppIcons.love),
    ic3: SvgPicture.asset(AppIcons.behaviour),
    rin: SvgPicture.asset(AppIcons.rings),
    none: SvgPicture.asset(AppIcons.none),
    name: 'Jane Smith',
    status: 'i am the i am but who is am',
    profileImage: AppImages.allPopularScreen,
  ),
];
