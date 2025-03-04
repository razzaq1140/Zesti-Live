import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/yeah_home/providers/share_provider.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../common/const/app_colors.dart';
import '../../../common/const/app_images.dart';
import '../../../common/const/global_variables.dart';

class ProfileFlexibleSpace extends StatelessWidget {
  final user;
  final double collapseFactor;

  const ProfileFlexibleSpace({
    Key? key,
    required this.user,
    required this.collapseFactor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const videoUrl = "https://youtu.be/VYUPMFu4fR8";

    return FlexibleSpaceBar(
      centerTitle: true,
      title: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: collapseFactor < 0.5 ? 5 : 115,
              right: collapseFactor < 0.5 ? 0 : -10,
              child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: SizedBox(
                            child: ListView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                Consumer<ShareProvider>(
                                  builder: (context, value, child) {
                                    return ListTile(
                                      onTap: () {
                                        value.shareVideo(videoUrl);
                                      },
                                      title: Text(
                                        'Share',
                                        style: textTheme(context).titleSmall,
                                      ),
                                    );
                                  },
                                ),
                                ListTile(
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Link has been copied')));
                                  },
                                  title: Text(
                                    'Copy Link',
                                    style: textTheme(context).titleSmall,
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    context
                                        .pushNamed(AppRoute.editprofilescreen);
                                  },
                                  title: Text(
                                    'Edit',
                                    style: textTheme(context).titleSmall,
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    context.pop();
                                  },
                                  title: Text(
                                    'Delete',
                                    style: textTheme(context).titleSmall,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: SvgPicture.asset(
                    height: collapseFactor < 0.5 ? 22 : 16,
                    color: collapseFactor < 0.5
                        ? colorScheme(context).onSurface
                        : colorScheme(context).onPrimary,
                    AppIcons.editprofile,
                  ))),
          Positioned(
            left: 10,
            right: 10,
            bottom: collapseFactor > 0.5 ? 0 : 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn(context, '50K', 'Fans', null, collapseFactor),
                _buildStatColumn(
                    context, '500', 'Following', null, collapseFactor),
                _buildStatColumn(
                    context, '220', 'Zircon', AppIcons.zircon, collapseFactor),
                _buildStatColumn(
                    context, '550', 'Ruby', AppIcons.ruby, collapseFactor),
              ],
            ),
          ),
          if (collapseFactor < 0.5)
            Positioned(
              right: 20,
              left: 20,
              bottom: 0,
              child: Text(
                textAlign: TextAlign.center,
                'One day I wake up and realized I was made for anyone, I was made for me, I am my own.',
                style: textTheme(context).labelMedium?.copyWith(
                    color: colorScheme(context).onSurface.withOpacity(0.5),
                    letterSpacing: 0.25),
              ),
            ),
          Positioned(
            top: collapseFactor > 0.5 ? 340 * collapseFactor : 50,
            left: collapseFactor > 0.5 ? 5 : null,
            child: CircleAvatar(
              radius: collapseFactor > 0.5 ? 32 * collapseFactor : 34,
              backgroundImage: NetworkImage(AppNetworkImages.networkThree),
            ),
          ),
          Positioned(
            top: collapseFactor > 0.5 ? 345 * collapseFactor : 150,
            left: collapseFactor > 0.5 ? 60 : null,
            child: Text(
              user.name,
              style: textTheme(context).bodySmall?.copyWith(
                  color: collapseFactor > 0.5 ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: collapseFactor > 0.5 ? 14 : 18),
            ),
          ),
          Positioned(
            top: collapseFactor > 0.5 ? 375 * collapseFactor : 10,
            left: collapseFactor > 0.5 ? 60 : null,
            child: Text(
              '#${user.id}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: collapseFactor > 0.5
                        ? colorScheme(context).onSurface.withOpacity(0.4)
                        : colorScheme(context).onSurface,
                    fontWeight: FontWeight.w500,
                    fontSize: collapseFactor > 0.5 ? 10 : 14,
                  ),
            ),
          ),
          Positioned(
            top: collapseFactor > 0.5 ? 350 * collapseFactor : 130,
            right: collapseFactor > 0.5 ? 6 : null,
            child: Row(
              children: [
                buildTagItem(context, AppColor.tagRed, AppIcons.tagLocation,
                    '35', collapseFactor),
                buildTagItem(context, AppColor.tagBlue, AppIcons.tagMars, '42',
                    collapseFactor),
                buildTagItem(
                    context, AppColor.tagGreen, null, 'Lv.02', collapseFactor),
                if (collapseFactor < 0.5)
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.tagRed,
                    ),
                    child: SvgPicture.asset(AppIcons.tagCrown),
                  ),
              ],
            ),
          ),
          if (collapseFactor > 0.5)
            Positioned(
              top: 375 * collapseFactor,
              right: 6,
              child: GestureDetector(
                onTap: () {
                  context.pushNamed(AppRoute.leaderboardscreen);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.tagRed,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.tagCrown, height: 7),
                      const SizedBox(width: 1),
                      Text(
                        'Check my VIP',
                        style: textTheme(context).labelSmall?.copyWith(
                            letterSpacing: 0,
                            fontSize: 8,
                            color: colorScheme(context).onPrimary),
                      ),
                      const SizedBox(width: 1),
                      Icon(Icons.arrow_forward_ios_rounded,
                          size: 8, color: colorScheme(context).onPrimary)
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
      background: Stack(
        children: [
          Container(color: colorScheme(context).surface),
          Image.network(
            height: 250,
            AppNetworkImages.networkFive,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ],
      ),
    );
  }

  Widget buildTagItem(BuildContext context, Color backgroundColor,
      String? iconPath, String? text, double collapseFactor) {
    return Container(
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor,
      ),
      child: Row(
        children: [
          if (iconPath != null)
            SvgPicture.asset(iconPath, height: collapseFactor > 0.5 ? 6 : 8),
          if (text != null) const SizedBox(width: 1),
          if (text != null)
            Text(
              text,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    letterSpacing: 0,
                    fontSize: collapseFactor > 0.5 ? 6 : 9,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
        ],
      ),
    );
  }

  Column _buildStatColumn(BuildContext context, String number, String label,
      String? imagePath, double collapseFactor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            if (imagePath != null)
              SvgPicture.asset(imagePath,
                  height: collapseFactor > 0.5 ? 14 * collapseFactor : 14),
            if (imagePath != null) const SizedBox(width: 2),
            Text(
              number,
              style: textTheme(context).titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: collapseFactor > 0.5 ? 14 * collapseFactor : 16,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: textTheme(context).labelSmall?.copyWith(
              fontSize: collapseFactor > 0.5 ? 10 * collapseFactor : 12,
              color: colorScheme(context).onSurface.withOpacity(0.5),
              letterSpacing: 0.25),
        ),
      ],
    );
  }
}
