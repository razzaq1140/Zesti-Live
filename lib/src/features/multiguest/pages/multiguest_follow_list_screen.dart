import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/features/multiguest/modals/follow_modal.dart';

import '../../../common/const/global_variables.dart';

class MultiguestFollowListScreen extends StatelessWidget {
  final VoidCallback onBack;

  const MultiguestFollowListScreen({
    super.key,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final List<MultiguestFollowList> followList = [
      MultiguestFollowList(
          timestamp: "5 minutes ago",
          profiletitle: 'AKshey sayal',
          profilecaption: 'I am the i am',
          profilephoto: AppImages.multiGuestPlayTab),
      MultiguestFollowList(
          timestamp: "5 minutes ago",
          profiletitle: 'AKshey sayal',
          profilecaption: 'I am the i am',
          profilephoto: AppImages.multiGuestPlayTab),
      MultiguestFollowList(
          timestamp: "5 minutes ago",
          profiletitle: 'AKshey sayal',
          profilecaption: 'I am the i am',
          profilephoto: AppImages.multiGuestPlayTab),
      MultiguestFollowList(
          timestamp: "5 minutes ago",
          profiletitle: 'AKshey sayal',
          profilecaption: 'I am the i am',
          profilephoto: AppImages.multiGuestPlayTab),
      MultiguestFollowList(
          timestamp: "5 minutes ago",
          profiletitle: 'AKshey sayal',
          profilecaption: 'I am the i am',
          profilephoto: AppImages.multiGuestPlayTab),
      MultiguestFollowList(
          timestamp: "5 minutes ago",
          profiletitle: 'AKshey sayal',
          profilecaption: 'I am the i am',
          profilephoto: AppImages.multiGuestPlayTab)
    ];
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 120,
        leading: TextButton(onPressed: onBack, child: const Text('Go Back??')),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: followList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final followItem = followList[index];
          return Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: CircleAvatar(
                  foregroundImage: NetworkImage(followItem.profilephoto),
                ),
                title: Text(followItem.profiletitle),
                subtitle: Text(
                  followItem.profilecaption,
                  style: textTheme(context).bodySmall?.copyWith(
                      color: colorScheme(context).onSurface.withOpacity(0.5)),
                ),
                trailing: Column(
                  children: [
                    Text(followItem.timestamp,
                        style: textTheme(context).labelSmall?.copyWith(
                            letterSpacing: 1,
                            color: colorScheme(context)
                                .onSurface
                                .withOpacity(0.5))),
                    const SizedBox(height: 2),
                    Chip(
                      backgroundColor: AppColor.tagBlue,
                      padding: const EdgeInsets.all(4),
                      labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                      shape: const StadiumBorder(
                        side: BorderSide(color: Colors.transparent),
                      ),
                      avatar: Icon(
                        Icons.signal_cellular_alt,
                        color: colorScheme(context).onPrimary,
                        size: 16,
                      ),
                      label: Text(
                        'Live',
                        style: textTheme(context)
                            .labelSmall
                            ?.copyWith(color: colorScheme(context).onPrimary),
                      ),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: const VisualDensity(
                        vertical: VisualDensity.minimumDensity,
                      ),
                    )
                  ],
                ),
              ),
              Divider(color: AppColor.surfaceGrey, thickness: 1),
            ],
          );
        },
      ),
    );
  }
}
