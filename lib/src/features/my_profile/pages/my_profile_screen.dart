import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/features/create_profile/data/user_data.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/widgets/profile_header.dart';
import 'package:flutter_application_zestilive/src/features/single_live_stream/tabs/task_list_tab.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../common/const/global_variables.dart';
import '../model/profile_modal.dart';

class MyProfileScreen extends StatelessWidget {
  final UserProfile userProfile;

  MyProfileScreen({super.key}) : userProfile = getDefaultUserProfile();

  @override
  Widget build(BuildContext context) {
    final user = userProfile;
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorScheme(context).surface,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              scrolledUnderElevation: 0,
              expandedHeight: 380.0,
              collapsedHeight: 300.0,
              backgroundColor: colorScheme(context).surface,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final maxExtent = 420.0;
                  final minExtent = 240.0;
                  final t = (constraints.maxHeight - minExtent) /
                      (maxExtent - minExtent);
                  return ProfileFlexibleSpace(
                    user: user,
                    collapseFactor: t,
                  );
                },
              ),
            ),
            SliverFillRemaining(child: _buildProfileOptions(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOptions(BuildContext context) {
    return SizedBox(
      child: ListView(
        shrinkWrap: true,
        children: [
          const Divider(thickness: 10),
          _buildFeatureGridSection(context, [
            _buildFeatureIcon(
              context,
              AppIcons.momentsIcon,
              'My Moments',
              () => context.pushNamed(AppRoute.mymomentsscreen),
            ),
            _buildFeatureIcon(context, AppIcons.messagesIcon, 'Messages',
                () => context.pushNamed(AppRoute.chatScreen)),
            _buildFeatureIcon(context, AppIcons.walletIcon, 'Wallet',
                () => context.pushNamed(AppRoute.bank)),
            _buildFeatureIcon(
                context, AppIcons.activitiesIcon, 'Activities', () {}),
            _buildFeatureIcon(context, AppIcons.baggageIcon, 'Top Up', () {
              context.pushNamed(AppRoute.balanceTopUpPage);
            }),
          ]),
          const Divider(thickness: 10),
          _buildFeatureGridSection(context, [
            _buildFeatureIcon(context, AppIcons.levelIcon, 'Level', () {}),
            _buildFeatureIcon(context, AppIcons.taskCenterIcon, 'Task Center',
                () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return TaskListTab();
                },
              );
            }),
            _buildFeatureIcon(context, AppIcons.rankingIcon, 'Ranking', () {}),
          ]),
          const Divider(thickness: 10),
          _buildFeatureGridSection(context, [
            _buildFeatureIcon(
                context, AppIcons.rotateSpinIcon, 'Rotate Spin', () {}),
            _buildFeatureIcon(context, AppIcons.settingsIcon, 'Settings',
                () => context.pushNamed(AppRoute.settingsscreen)),
            _buildFeatureIcon(context, AppIcons.scanQRCodeIcon, 'Scan QR Code',
                () => context.pushNamed(AppRoute.qrscreen)),
            _buildFeatureIcon(context, AppIcons.likeUsIcon, 'Like Us', () {}),
            _buildFeatureIcon(
                context,
                AppIcons.helpUsFeedbackIcon,
                'Help & Feedback',
                () => context.pushNamed(AppRoute.helpandfeedbackscreen)),
          ]),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

  Widget _buildFeatureGridSection(BuildContext context, List<Widget> features) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GridView.count(
        childAspectRatio: 1.4,
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: features,
      ),
    );
  }

  Widget _buildFeatureIcon(
      BuildContext context, String icon, String label, VoidCallback ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
