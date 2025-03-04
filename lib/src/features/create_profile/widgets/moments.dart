import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/model/moments_model.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/provider/profile_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MomentsTab extends StatelessWidget {
  const MomentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProfileController>(context);
    // final moments = controller.moments; // Access the moments list

    return moments.isEmpty
        ? Center(child: Text('No moments available.')) // Show a message if moments list is empty
        : ListView.builder(
      itemCount: moments.length, // Set item count based on actual moments list size
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
                      Expanded(
                        child: Text('${moment.likes} Likes'),
                      ),
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
                        onPressed: () {},
                        icon: SvgPicture.asset(AppIcons.commentIcon2),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(AppIcons.sendIcon),
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
                    onPressed: () {},
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
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Add a comment...',
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
  }
}

