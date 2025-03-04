import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/multiguest/modals/all_modal.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../common/const/app_images.dart';
import '../../../common/const/global_variables.dart';

class MultiguestAllTab extends StatelessWidget {
  MultiguestAllTab({super.key});

  // Example list of items using the MultiGuestItem model
  final List<MultiguestAllItem> multiGuestItems = [
    MultiguestAllItem(
      imageUrl: AppImages.allPopularScreen,
      chipLabel: 'Let\'s go',
      viewCount: '400',
      caption: 'Superstar',
    ),
    MultiguestAllItem(
      imageUrl: AppImages.allPopularScreen,
      chipLabel: 'Join Now',
      viewCount: '500',
      caption: 'Vs124',
    ),
    MultiguestAllItem(
      imageUrl: AppImages.allPopularScreen,
      chipLabel: 'New Game',
      viewCount: '600',
      caption: 'yo yi yo',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage(AppImages.popularAllHeader),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 1,
                  ),
                  itemCount: multiGuestItems.length,
                  itemBuilder: (context, index) {
                    final item = multiGuestItems[index];
                    return GestureDetector(
                      onTap: () {
                        context.pushNamed(AppRoute.singleLiveStreamScreen);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                  imageUrl: item.imageUrl,
                                  placeholder: (context, url) => const Center(
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Center(
                                    child: Icon(
                                      Icons.error,
                                      size: 20,
                                    ),
                                  ),
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 10,
                              right: 10,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Chip(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 4),
                                        labelPadding:
                                            const EdgeInsets.symmetric(
                                          vertical: 0,
                                          horizontal: 2,
                                        ),
                                        avatar: SvgPicture.asset(
                                          AppIcons.starLiveIcon,
                                          width: 16,
                                          height: 16,
                                        ),
                                        avatarBoxConstraints:
                                            const BoxConstraints(
                                          maxHeight: 16,
                                          maxWidth: 16,
                                        ),
                                        shape: const StadiumBorder(
                                          side: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        label: Text(
                                          item.chipLabel,
                                          style: textTheme(context)
                                              .labelSmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: colorScheme(context)
                                                    .primary,
                                              ),
                                        ),
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        visualDensity: const VisualDensity(
                                          vertical:
                                              VisualDensity.minimumDensity,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    item.viewCount,
                                    style: textTheme(context)
                                        .bodyMedium
                                        ?.copyWith(
                                            color:
                                                colorScheme(context).onPrimary,
                                            fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Container(
                                width: 100,
                                height: 18,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppIcons.fireIcon),
                                    const SizedBox(width: 2),
                                    Text(
                                      item.caption,
                                      style: textTheme(context)
                                          .labelLarge
                                          ?.copyWith(
                                            color:
                                                colorScheme(context).onPrimary,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
