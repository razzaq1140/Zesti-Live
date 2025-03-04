import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../common/const/app_images.dart';
import '../../../common/const/global_variables.dart';

class VideoDetailSection extends StatelessWidget {
  final String username;
  final String videoCaption;
  final String musicName;
  final double width;

  const VideoDetailSection({
    super.key,
    required this.username,
    required this.videoCaption,
    required this.musicName,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '@$username',
          style: textTheme(context).bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme(context).onPrimary,
              ),
        ),
        const SizedBox(height: 2),
        Text(
          videoCaption,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: textTheme(context).bodyMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: colorScheme(context).onPrimary,
              ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            SvgPicture.asset(AppIcons.musicIcon),
            const SizedBox(width: 4),
            SizedBox(
              width: width * 0.6,
              child: Text(
                musicName,
                overflow: TextOverflow.fade,
                maxLines: 1,
                style: textTheme(context).bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: colorScheme(context).onPrimary,
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
