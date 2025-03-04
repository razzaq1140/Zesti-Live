import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/yeah_home/widgets/animated_disk.dart';
import 'package:flutter_application_zestilive/src/features/yeah_home/widgets/comment_bottomsheet.dart';
import 'package:flutter_application_zestilive/src/features/yeah_home/widgets/like_button.dart';
import 'package:flutter_application_zestilive/src/features/yeah_home/widgets/share_bottomsheet.dart';
import 'package:flutter_application_zestilive/src/features/yeah_home/widgets/user_avatar.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_application_zestilive/src/features/yeah_home/modals/reels_modal.dart';
import 'package:flutter_application_zestilive/src/features/yeah_home/providers/for_you_provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../common/const/global_variables.dart';
import '../widgets/video_detail.dart';

class ForYouPage extends StatelessWidget {
  final PageController pageController;

  const ForYouPage({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final forYouProvider = Provider.of<ForYouProvider>(context);
    final reels = forYouProvider.reels;
    final controllers = forYouProvider.controllers;
    final double width = MediaQuery.of(context).size.width;

    return PageView.builder(
      controller: pageController,
      itemCount: reels.length,
      onPageChanged: (index) {
        forYouProvider.pauseAllVideos();
        forYouProvider.playVideo(index);
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
                          isforyou: true,
                          profileUrl: reel.avatarUrl,
                        ),
                        const SizedBox(height: 24),
                        LikeButton(
                          index: index,
                          isForYou: true,
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
              )),
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
