import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/home/modals/notification_moments_modal.dart';

import '../../../../common/const/app_images.dart';
import '../../../../common/const/global_variables.dart';

class NotificationMomentsTab extends StatelessWidget {
  NotificationMomentsTab({super.key});

  final List<NotificationMomentsItem> notificationsMoment = [
    NotificationMomentsItem(
      username: 'Katy Perry',
      message: 'Liked your post ❤️',
      time: '2 min',
      profileImageUrl: AppImages.allPopularScreen,
      postImage: AppImages.allPopularScreen,
    ),
    NotificationMomentsItem(
      username: 'Nikki',
      message: 'Liked your post ❤️',
      time: '2 min',
      profileImageUrl: AppImages.allPopularScreen,
      postImage: AppImages.allPopularScreen,
    ),
    NotificationMomentsItem(
      username: 'Simran Mallik',
      message: 'Liked your post ❤️',
      time: '3 min',
      profileImageUrl: AppImages.allPopularScreen,
      postImage: AppImages.allPopularScreen,
    ),
    NotificationMomentsItem(
      username: 'Sherry Silva',
      message: 'Liked your post ❤️',
      time: '4 min',
      profileImageUrl: AppImages.allPopularScreen,
      postImage: AppImages.allPopularScreen,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: notificationsMoment.isEmpty
          ? SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  const Spacer(),
                  Image.asset(AppImages.yeahLive),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Nothing is here',
                    style: textTheme(context).bodyMedium?.copyWith(
                        fontSize: 13,
                        color: colorScheme(context).onSurface.withOpacity(0.5)),
                  ),
                  const Spacer()
                ],
              ),
            )
          : ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: notificationsMoment.length,
              itemBuilder: (context, index) {
                final notification = notificationsMoment[index];
                return Column(
                  children: [
                    ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        leading: CircleAvatar(
                          foregroundImage:
                              NetworkImage(notification.profileImageUrl),
                        ),
                        title: Text(
                          notification.username,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              notification.message,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withOpacity(0.5),
                                  ),
                            ),
                            const SizedBox(width: 2.0),
                            Text(notification.time,
                                style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                        trailing: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(notification.postImage),
                            ),
                          ),
                        )),
                    Divider(
                      color: Theme.of(context).colorScheme.outlineVariant,
                      thickness: 1,
                    ),
                  ],
                );
              },
            ),
    );
  }
}
