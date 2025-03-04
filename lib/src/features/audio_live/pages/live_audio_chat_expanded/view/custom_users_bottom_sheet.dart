import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/pages/live_audio_chat_expanded/model/user_model.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/pages/live_audio_chat_expanded/view/profile_user.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HourlyBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Hourly',
            style: textTheme(context)
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: AudioUsers.length,
              itemBuilder: (context, index) {
                return _buildAudioUserRow(context, AudioUsers[index], index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAudioUserRow(
      BuildContext context, AudioUser audioUser, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9.0),
      child: Row(
        children: [
          Text(
            '${audioUser.rank}',
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                context.pop(context);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return ProfileBottomSheet1(index: index);
                  },
                );
              },
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(audioUser.imageUrl),
                    ),
                  ),
                ),
                title: Row(
                  children: [
                    Text(
                      audioUser.name,
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    index == 0
                        ? SizedBox(
                            height: 15,
                            width: 15,
                            child: audioUser.ic,
                          )
                        : SizedBox(
                            height: 15,
                            width: 15,
                            child: audioUser.ic2,
                          ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: AppColor.purple,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppIcons.star),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            "1 Star",
                            style: textTheme(context).bodySmall?.copyWith(
                                color: colorScheme(context).onPrimary),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                subtitle: Row(
                  children: [
                    Text(
                      audioUser.status,
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    const SizedBox(width: 2),
                    index == 0
                        ? SizedBox()
                        : SizedBox(
                            height: 15, width: 15, child: audioUser.diamond),
                    const SizedBox(width: 2),
                    index == 0
                        ? const Text("")
                        : Text(
                            audioUser.diamondsToReach.toString(),
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                  ],
                ),
                trailing: SizedBox(
                  width: 70,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      index == 0 || index == 3
                          ? Container(
                              height: 20,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: const Center(
                                child: Text(
                                  'Live',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            )
                          : Text(""),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: index == 0
                            ? audioUser.done
                            : (index == 1 ||
                                    index == 2 ||
                                    index == 4 ||
                                    index == 5)
                                ? audioUser.select
                                : const SizedBox.shrink(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
