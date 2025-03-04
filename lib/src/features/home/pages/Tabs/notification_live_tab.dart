import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';

import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/home/modals/notification_live_modal.dart';
import 'package:flutter_application_zestilive/src/features/home/widget/live_user_widget.dart';

class NotificationLiveTab extends StatelessWidget {
  NotificationLiveTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: liveUsers.isEmpty
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
              itemCount: liveUsers.length,
              itemBuilder: (context, index) {
                return LiveUserWidget(liveUser: liveUsers[index]);
              },
            ),
    );
  }
}
