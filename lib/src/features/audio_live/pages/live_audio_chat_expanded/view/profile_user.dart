import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/pages/live_audio_chat_expanded/model/user_model.dart';
import 'package:flutter_application_zestilive/src/features/pk/provider/pk_match_screen_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProfileBottomSheet1 extends StatelessWidget {
  final int index;
  const ProfileBottomSheet1({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AudioUsers[index].name,
                style: textTheme(context).titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    size: 16,
                    color: colorScheme(context).onSurface.withOpacity(0.5),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(AudioUsers[index].diamondsToReach.toString(),
                      style: textTheme(context).labelLarge!.copyWith(
                          letterSpacing: 0,
                          color:
                              colorScheme(context).onSurface.withOpacity(0.5))),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: AudioUsers[index].tags.map((tag) {
                  return buildTagItem(
                    context: context,
                    backgroundColor: tag.backgroundColor,
                    iconPath: tag.iconPath,
                    text: tag.text,
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatColumn(
                      context, AudioUsers[index].fans, 'Fans', null),
                  _buildStatColumn(
                      context, AudioUsers[index].following, 'Following', null),
                  _buildStatColumn(context, AudioUsers[index].zircon, 'Zircon',
                      AppIcons.zircon),
                  _buildStatColumn(
                      context, AudioUsers[index].ruby, 'Ruby', AppIcons.ruby),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Consumer<PkMatchProvider>(
                    builder: (context, buttonColorProvider, child) {
                      return SizedBox(
                        width: 150,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            buttonColorProvider.toggleButton();
                          },
                          icon: Icon(
                            buttonColorProvider.isFollwoed
                                ? Icons.check
                                : Icons.add,
                            size: 16,
                          ),
                          label: Text(
                              buttonColorProvider.isFollwoed
                                  ? 'Following'
                                  : 'Follow',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: buttonColorProvider.isFollwoed
                                          ? colorScheme(context).onSurface
                                          : Theme.of(context)
                                              .colorScheme
                                              .onPrimary)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColorProvider.isFollwoed
                                ? AppColor.surfaceGrey
                                : colorScheme(context).primary,
                            foregroundColor: buttonColorProvider.isFollwoed
                                ? colorScheme(context).onSurface
                                : colorScheme(context).onPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 150,
                    child: OutlinedButton.icon(
                      icon: const Icon(
                        Icons.message_outlined,
                        size: 16,
                      ),
                      onPressed: () {},
                      label: Text(
                        'Chat',
                        style: textTheme(context)
                            .bodyLarge
                            ?.copyWith(color: colorScheme(context).primary),
                      ),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: colorScheme(context).primary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              )
            ],
          ),
        ),
        Positioned(
          top: -10,
          child: CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(AppImages.profilePhoto),
            backgroundColor: AppColor.surfaceGrey,
          ),
        ),
      ],
    );
  }

  Column _buildStatColumn(
      BuildContext context, String number, String label, String? imagepath) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            if (imagepath != null) SvgPicture.asset(imagepath),
            if (imagepath != null) const SizedBox(width: 2),
            Text(
              number,
              style: textTheme(context).titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            )
          ],
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style:
              textTheme(context).labelSmall?.copyWith(color: AppColor.textGrey),
        ),
      ],
    );
  }

  Widget buildTagItem({
    required BuildContext context,
    required Color backgroundColor,
    String? iconPath,
    String? text,
  }) {
    return Container(
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor,
      ),
      child: Row(
        children: [
          if (iconPath != null)
            SvgPicture.asset(
              iconPath,
              height: 12,
            ),
          if (text != null) const SizedBox(width: 4),
          if (text != null)
            Text(
              text,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    letterSpacing: 0,
                    fontSize: 10,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
        ],
      ),
    );
  }
}
