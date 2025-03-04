import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/pages/live_audio_chat_expanded/model/audio_viewer_model.dart';

class AudioLiveDrawer extends StatelessWidget {
  const AudioLiveDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final int vipCount =
        drawerviewers.where((viewer) => viewer.isVIP == true).length;
    return Container(
      color: colorScheme(context).onPrimary,
      width: MediaQuery.of(context).size.width * 0.7,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10, top: 16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '${drawerviewers.length} Viewers',
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
                itemCount: drawerviewers.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        leading: CircleAvatar(
                          foregroundImage:
                              AssetImage(drawerviewers[index].image!),
                        ),
                        title: Text(
                          "${drawerviewers[index].name} 😎 ❤️ 😍 ",
                          style: textTheme(context)
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          drawerviewers[index].status,
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
