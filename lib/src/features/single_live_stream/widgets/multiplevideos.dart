import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/const/app_colors.dart';
import '../../../common/const/app_images.dart';
import '../../../common/const/global_variables.dart';
import '../modals/friendslivemodal.dart';

class SingleLiveMultipleVideos extends StatelessWidget {
  const SingleLiveMultipleVideos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    // int counter = 1;

    return Column(
      children: [
        const SizedBox(
          height: 80,
        ),
        Container(
          color: AppColor.appYellow,
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: friendLive.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final friendlive = friendLive[index];

              return Stack(
                children: [
                  // User Image
                  Positioned.fill(
                    child: ClipRRect(
                      child: Image.network(
                        friendlive.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Name and Fire Count at the Bottom
                  Positioned(
                    bottom: 8,
                    left: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // User name
                          Text(friendlive.name,
                              style: textTheme(context).labelSmall?.copyWith(
                                  fontSize: 10,
                                  color: colorScheme(context).onPrimary,
                                  letterSpacing: 0)),
                          // Fire icon and count
                          Row(
                            children: [
                              SvgPicture.asset(
                                height: 12,
                                AppIcons.starYellow,
                              ),
                              const SizedBox(width: 4),
                              Text(friendlive.fireCount,
                                  style: textTheme(context)
                                      .labelSmall
                                      ?.copyWith(
                                          fontSize: 10,
                                          color: colorScheme(context).onPrimary,
                                          letterSpacing: 0)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Conditionally display label or counter
                  if (friendlive.label.isNotEmpty)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 4,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme(context).surface,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          friendlive.label,
                          style: TextStyle(
                            color: colorScheme(context).primary,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    )
                  else
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 6,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme(context).surface.withOpacity(0.4),
                        ),
                        child: Text('${index + 1}',
                            style: textTheme(context).labelSmall?.copyWith(
                                fontSize: 10,
                                color: colorScheme(context).onPrimary)),
                      ),
                    ),

                  // Mic status icon
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Icon(
                      friendlive.micStatus == 'muted'
                          ? Icons.mic_off
                          : Icons.mic,
                      color: friendlive.micStatus == 'muted'
                          ? AppColor.textGrey
                          : colorScheme(context).surface,
                      size: 18,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
