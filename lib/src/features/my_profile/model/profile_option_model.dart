import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileOption {
  final Widget icon;
  final String label;
  final String? subLabel;

  ProfileOption({
    required this.icon,
    required this.label,
    this.subLabel,
  });
}

class ProfileOptionModel {
  static List<List<ProfileOption>> get profileOptions => [
        [
          ProfileOption(
            icon: SvgPicture.asset(AppIcons.momentsIcon),
            label: "My Moments",
          ),
          ProfileOption(
            icon: SvgPicture.asset(AppIcons.messagesIcon),
            label: "Messages",
          ),
          ProfileOption(
            icon: SvgPicture.asset(AppIcons.walletIcon),
            label: "Wallet",
          ),
          ProfileOption(
            icon: SvgPicture.asset(AppIcons.activitiesIcon),
            label: "Activities",
          ),
        ],
        [
          ProfileOption(
            icon: SvgPicture.asset(AppIcons.levelIcon),
            label: "Level",
          ),
          ProfileOption(
            icon: SvgPicture.asset(AppIcons.taskCenterIcon),
            label: "Task Center",
          ),
          ProfileOption(
            icon: SvgPicture.asset(AppIcons.rankingIcon),
            label: "Ranking",
          ),
          ProfileOption(
            icon: SvgPicture.asset(AppIcons.baggageIcon),
            label: "Baggage",
          ),
        ],
        [
          ProfileOption(
            icon: SvgPicture.asset(AppIcons.rotateSpinIcon),
            label: "Rotate Spin",
          ),
          ProfileOption(
            icon: SvgPicture.asset(AppIcons.friendsZooIcon),
            label: "FriendsZoo",
          ),
        ],
        [
          ProfileOption(
            icon: SvgPicture.asset(AppIcons.settingsIcon),
            label: "Settings",
          ),
          ProfileOption(
            icon: SvgPicture.asset(AppIcons.scanQRCodeIcon),
            label: "Scan QR Code",
          ),
          ProfileOption(
            icon: SvgPicture.asset(AppIcons.helpUsFeedbackIcon),
            label: "Help &",
            subLabel: "Feedback",
          ),
          ProfileOption(
            icon: SvgPicture.asset(AppIcons.baggageIcon),
            label: "Baggage",
          ),
        ],
      ];
}
