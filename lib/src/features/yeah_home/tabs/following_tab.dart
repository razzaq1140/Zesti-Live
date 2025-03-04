// lib/widgets/following_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../providers/following_provider.dart';
import '../modals/reels_modal.dart';
import '../widgets/animated_disk.dart';
import '../widgets/comment_bottomsheet.dart';
import '../widgets/like_button.dart';
import '../widgets/share_bottomsheet.dart';
import '../widgets/user_avatar.dart';
import '../widgets/video_detail.dart';

class FollowingPage extends StatelessWidget {
  final PageController pageController;

  const FollowingPage({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final followingProvider = Provider.of<FollowingProvider>(context);
    final reels = followingProvider.reels;
    final controllers = followingProvider.controllers;
    final double width = MediaQuery.of(context).size.width;

    return PageView.builder(
      controller: pageController,
      itemCount: reels.length,
      onPageChanged: (index) {
        followingProvider.pauseAllVideos();
        followingProvider.playVideo(index);
      },
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        if (index >= controllers.length || index >= reels.length) {
          return const Center(child: Text("No video available"));
        }
        final videoController = controllers[index];
        final reel = reels[index];
        return _buildVideoContent(videoController, reel, width, context, index);
      },
    );
  }

Widget _buildVideoContent(VideoPlayerController videoController,
    ReelModal reel, double width, BuildContext context, int index) {
  return VisibilityDetector(
    key: Key('video_$index'),
    onVisibilityChanged: (VisibilityInfo info) {
      if (info.visibleFraction == 0) {
        videoController.pause(); 
      } else {
        videoController.play(); 
      }
    },
    child: Stack(
      children: [
        Positioned.fill(
          child: videoController.value.isInitialized
              ? VideoPlayer(videoController)
              : Container(
                  width: double.infinity,
                  color: colorScheme(context).onSurface.withOpacity(0.2),
                  child: const Center(child: CircularProgressIndicator())),
        ),
        Positioned.fill(
          right: 15,
          bottom: 150,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 20),
            child: Column(
              children: [
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      UserAvatar(
                        profileUrl: reel.avatarUrl,
                        isforyou: false,
                      ),
                      const SizedBox(height: 24),
                      LikeButton(
                        index: index,
                        isForYou: false,
                      ),
                      const SizedBox(height: 12),
                      const CommentButton(),
                      const SizedBox(height: 12),
                      const ShareButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          width: width * 0.7,
          left: 10,
          bottom: 80,
          child: VideoDetailSection(
            username: reel.username,
            videoCaption: reel.videoCaption,
            musicName: reel.musicName,
            width: width,
          ),
        ),
        const Positioned(
          bottom: 80,
          right: 5,
          child: AnimatedDisc(),
        ),
      ],
    ),
  );
}
}
