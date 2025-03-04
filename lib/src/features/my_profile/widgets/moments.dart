import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/provider/profile_controller.dart';
import 'package:flutter_application_zestilive/src/features/yeah_home/providers/share_provider.dart';
import 'package:flutter_application_zestilive/src/features/yeah_home/widgets/comment_bottomsheet.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../model/moments_model.dart';

class MomentsTab extends StatelessWidget {
  const MomentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    const videoUrl = "https://youtu.be/VYUPMFu4fR8";

    // final controller = Provider.of<ProfileController>(context);
    // final moments = controller.userProfile.moments;


    return Consumer<ProfileController>(
      builder: (context, controller, child) {
        // final moments = controller.moments;
        return moments.isEmpty
            ? Center(
          child: Text(
            'No moments available. Create a new post!',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        )
            : ListView.builder(
          itemCount: moments.length,
          itemBuilder: (context, index) {
            final moment = moments[index];
            final isExpanded = controller.isExpandedList[index];
            final isLiked = controller.isLikedList[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(moment.profileImage),
                  ),
                  title: Text(
                    moment.authorName,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    moment.location,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: AppColor.textGrey),
                  ),
                  trailing: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.more_vert)),
                ),
                SizedBox(
                  height: 370,
                  width: double.infinity,
                  child: Image.asset(
                    moment.postImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('${moment.likes} Likes'),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              controller.toggleLike(index);
                            },
                            icon: Icon(
                              size: 20,
                              isLiked
                                  ? CupertinoIcons.heart_fill
                                  : CupertinoIcons.heart,
                              color: isLiked
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.outline,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return const CommentSection();
                                },
                              );
                            },
                            icon: SvgPicture.asset(AppIcons.commentIcon2),
                          ),
                          Consumer<ShareProvider>(
                            builder: (context, shareProvider, child) {
                              return IconButton(
                                icon: SvgPicture.asset(AppIcons.sendIcon),
                                onPressed: () {
                                  shareProvider.shareVideo(videoUrl);
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${moment.authorName} ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: isExpanded
                                  ? moment.caption
                                  : moment.caption.length > 50
                                  ? '${moment.caption.substring(0, 50)}...'
                                  : moment.caption,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            if (moment.caption.length > 50)
                              TextSpan(
                                text: isExpanded ? ' less' : ' more',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    controller.toggleExpanded(index);
                                  },
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return const CommentSection();
                            },
                          );
                        },
                        child: Text(
                          'View all ${moment.commentCount} comments',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: AppColor.textGrey),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(moment.profileImage),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              onTap: () {
                                context.pushNamed(AppRoute.post);
                                // showModalBottomSheet(
                                //   isScrollControlled: true,
                                //   context: context,
                                //   builder: (context) {
                                //     return const CommentSection();
                                //   },
                                // );
                              },
                              readOnly: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                // hintText: 'Add a comment...',
                                hintText: "What's on your mind?",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: AppColor.textGrey),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(moment.timepassed),
                    ],
                  ),
                ),
                const SizedBox(height: 90),
              ],
            );
          },
        );
      },
    );
  }
}
