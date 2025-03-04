import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/features/post_section/model/moment_post_model.dart';
import 'package:flutter_application_zestilive/src/features/yeah_home/providers/share_provider.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MomentPostWidget extends StatefulWidget {
  const MomentPostWidget({super.key});

  @override
  MomentPostWidgetState createState() => MomentPostWidgetState();
}

class MomentPostWidgetState extends State<MomentPostWidget> {
  String videoUrl = "bhdhcsdkwkdhckdhc";

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: momentPostList.length,
      itemBuilder: (context, index) {
        final moment = momentPostList[index];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Check if the post is reported
            if (moment.isReported)
              _buildReportedMessage(moment)
            else
              _buildPostContent(context, moment),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }

  // Widget for the post content
  Widget _buildPostContent(BuildContext context, MomentPost moment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 7.0),
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
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {
                              context.pop();
                              context.pushNamed(AppRoute.reportpage);

                              _showReportDialog(moment);
                            },
                            child: Text("Report",
                                style: Theme.of(context).textTheme.titleSmall),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text("Copy Link",
                                style: Theme.of(context).textTheme.titleSmall),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text("Share Link",
                                style: Theme.of(context).textTheme.titleSmall),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text("Unfollow",
                                style: Theme.of(context).textTheme.titleSmall),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.more_vert),
          ),
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
                      setState(() {
                        moment.isLiked = !moment.isLiked;
                        moment.isLiked ? moment.likes++ : moment.likes--;
                      });
                    },
                    icon: Icon(
                        size: 20,
                        moment.isLiked
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        color: moment.isLiked
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.outline),
                  ),
                  IconButton(
                    onPressed: () {
                      context.pushNamed(AppRoute.commentpage);
                    },
                    icon: SvgPicture.asset(AppIcons.commentIcon2),
                  ),
                  Consumer<ShareProvider>(
                    builder: (context, value, child) {
                      return IconButton(
                          onPressed: () {
                            value.shareVideo(videoUrl);
                          },
                          icon: SvgPicture.asset(AppIcons.sendIcon));
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
                      text: moment.isExpanded
                          ? moment.caption
                          : moment.caption.length > 50
                              ? '${moment.caption.substring(0, 50)}...'
                              : moment.caption,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    if (moment.caption.length > 50)
                      TextSpan(
                        text: moment.isExpanded ? ' less' : ' more',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              moment.isExpanded = !moment.isExpanded;
                            });
                          },
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              TextButton(
                onPressed: () {
                  context.pushNamed(AppRoute.commentpage);
                },
                child: Text(
                  'View all ${moment.commentCount} comments',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColor.textGrey),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReportedMessage(MomentPost moment) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 40,
          ),
          const SizedBox(height: 16),
          Text(
            "Thanks for reporting this post",
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            "We use spam reports as an indicator to understand problems that we're having with spam. If you think that this post breaches our Community Guidelines and should be removed, mark it as inappropriate.",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColor.textGrey.withOpacity(0.7)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              setState(() {
                moment.isReported = false; // Reset to show the post again
              });
            },
            child: Text(
              "Show Post",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  // Show the report dialog and update the post state
  void _showReportDialog(MomentPost moment) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.report, color: Colors.red, size: 40),
                const SizedBox(height: 16),
                Text(
                  "Report Post",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                Text(
                  "This post has been flagged as spam or inappropriate. Thank you for helping keep our community safe.",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    setState(() {
                      moment.isReported = true;
                    });
                    Navigator.pop(context);
                  },
                  child: const Text("Confirm Report"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
