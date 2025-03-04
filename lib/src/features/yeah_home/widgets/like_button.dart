// lib/widgets/like_button.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/for_you_provider.dart';
import '../providers/following_provider.dart';

class LikeButton extends StatelessWidget {
  final int index;
  final bool isForYou;

  const LikeButton({
    super.key,
    required this.index,
    required this.isForYou,
  });

  @override
  Widget build(BuildContext context) {
    // Conditionally get the provider based on `isForYou`
    final provider = isForYou
        ? Provider.of<ForYouProvider>(context, listen: false)
        : Provider.of<FollowingProvider>(context, listen: false);

    final reel = isForYou
        ? (provider as ForYouProvider).reels[index]
        : (provider as FollowingProvider).reels[index];

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            isForYou
                ? (provider as ForYouProvider).toggleLike(index)
                : (provider as FollowingProvider).toggleLike(index);
          },
          child: Icon(
            Icons.favorite,
            color: reel.isLiked
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onPrimary,
            size: 40,
          ),
        ),
        Text(
          "${reel.likeCount}",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ],
    );
  }
}
