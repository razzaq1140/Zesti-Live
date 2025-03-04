import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';

import '../image_provider/image_provider.dart';
import '../pages/meet_up_detail_pf.dart';
import '../pages/swipe_images.dart';

class MeetUpWidget extends StatelessWidget {
  final double? fontSize;
  final double? fontSize2;
  final double? iconSize;
  final Container? container;
  final VoidCallback? onTapDetail;

  const MeetUpWidget({
    super.key,
    this.fontSize,
    this.container,
    this.fontSize2,
    this.iconSize,
    this.onTapDetail,
  });

  @override
  Widget build(BuildContext context) {
    return CardSwiper(
      threshold: 100,
      cardsCount: swipItems.length,
      backCardOffset: const Offset(0, 0),
      isLoop: true,
      cardBuilder: (context, index, horizontalOffsetPercentage, verticalOffsetPercentage) {
        final item = swipItems[index];
        return Stack(
          alignment: Alignment.center,
          children: [
            // Background Image
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: AppColor.meetupContainer,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: item.meetUpImage ?? const SizedBox(),
              ),
            ),
            // Foreground Detail Button
            Positioned(
              bottom: 20,
              child: GestureDetector(
                onTap: () {
                  if (item.meetUpImage is CachedNetworkImage) {
                    final imageUrl = (item.meetUpImage as CachedNetworkImage).imageUrl;
                    Provider.of<SelectedImageProvider>(context, listen: false)
                        .setSelectedImage(imageUrl);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MeetUpDetail(
                          name: item.meetUpName,
                          address: item.meetUpAddress,
                          child: item.meetUpImage,
                          verified: item.verified,
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  width: 279,
                  height: 72,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colorScheme(context).surface,
                  ),
                  child: Row(
                    children: [
                      // Name and Address
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 15),
                              Text(
                                item.meetUpName ?? '',
                                style: textTheme(context).bodySmall?.copyWith(
                                  fontSize: fontSize ?? 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 4),
                              item.verified == true? // Only show if verified
                                Icon(
                                  Icons.check_circle,
                                  size: iconSize ?? 17,
                                  color: AppColor.checkIcon,
                                ):SizedBox(),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 8),
                              Icon(
                                Icons.location_on_sharp,
                                size: iconSize ?? 14,
                                color: colorScheme(context).primary,
                              ),
                              Text(
                                item.meetUpAddress ?? '',
                                style: textTheme(context).bodySmall?.copyWith(
                                  fontSize: fontSize2 ?? 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      // Arrow Icon
                      container ??
                          Container(
                            height: 31,
                            width: 31,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorScheme(context).primary,
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              size: 22,
                              color: colorScheme(context).surface,
                            ),
                          ),
                      const SizedBox(width: 15),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
