
import 'package:flutter/material.dart';
import '../../../common/const/app_colors.dart';
import '../../../common/const/global_variables.dart';
import '../modals/viewer_modal.dart';

class SingleLiveDrawer extends StatelessWidget {
  const SingleLiveDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final int vipCount =
        singleDrawerviewers.where((viewer) => viewer.isVIP == true).length;
    return Drawer(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10, top: 16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '${singleDrawerviewers.length} Viewers',
                  style: textTheme(context)
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '($vipCount VIPs)',
                  style: textTheme(context)
                      .bodyMedium
                      ?.copyWith(color: AppColor.appYellow, fontSize: 13),
                ),
              ],
            ),
            SizedBox(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(8),
                itemCount: singleDrawerviewers.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        leading: CircleAvatar(
                          foregroundImage: NetworkImage(
                              singleDrawerviewers[index].profileImage),
                        ),
                        title: Text(
                          singleDrawerviewers[index].name,
                          style: textTheme(context)
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          singleDrawerviewers[index].status,
                          style: textTheme(context).bodySmall?.copyWith(
                              color: colorScheme(context)
                                  .onSurface
                                  .withOpacity(0.5)),
                        ),
                      ),
                      Divider(color: AppColor.surfaceGrey, thickness: 1),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
