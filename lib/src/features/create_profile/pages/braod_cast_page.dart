import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:go_router/go_router.dart';
import '../../../common/const/app_images.dart';
import '../../../common/const/global_variables.dart';
import '../models/broad_cast_model.dart';


class BroadcasterPage extends StatelessWidget {
  final List<Broadcaster> broadcasters = [
    Broadcaster(
      isVerified: true,
      imageUrl: AppNetworkImages.networkEleven,
      title: 'Gina Rodriquez',
      subtitle: '00458547',
    ),
    Broadcaster(
      isVerified: true,
      imageUrl: AppNetworkImages.networkNine,
      title: 'Javier Robertson',
      subtitle: '00458547',
    ),
    Broadcaster(
      isVerified: true,
      imageUrl: AppNetworkImages.networkOne,
      title: 'Scarlett',
      subtitle: '00458547',
    ),
    Broadcaster(
      isVerified: false,
      imageUrl: AppNetworkImages.networkTwo,
      title: 'Mary Reid',
      subtitle: '00458547',
    ),
    Broadcaster(
      isVerified: false,
      imageUrl: AppNetworkImages.networkThree,
      title: 'Scarlett',
      subtitle: '00458547',
    ),
    Broadcaster(
      isVerified: true,
      imageUrl: AppNetworkImages.networkFour,
      title: 'Jeanette King',
      subtitle: '00458547',
    ),
    Broadcaster(
      isVerified: true,
      imageUrl: AppNetworkImages.networkFive,
      title: 'Nicole',
      subtitle: '00458547',
    ),
    Broadcaster(
      isVerified: true,
      imageUrl: AppNetworkImages.networkSix,
      title: 'Scarlett',
      subtitle: '00458547',
    ),
    Broadcaster(
      isVerified: true,
      imageUrl: AppNetworkImages.networkSeven,
      title: 'Jeanette King',
      subtitle: '00458547',
    ),
    Broadcaster(
      isVerified: true,
      imageUrl: AppNetworkImages.networkEight,
      title: 'Ryan Horton',
      subtitle: '00458547',
    ),
    Broadcaster(
      isVerified: true,
      imageUrl: AppNetworkImages.networkNine,
      title: 'Nicole',
      subtitle: '00458547',
    ),
    Broadcaster(
      isVerified: true,
      imageUrl: AppNetworkImages.networkTen,
      title: 'Mary Reid',
      subtitle: '00458547',
    ),
  ];

  BroadcasterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        title: Text(
          'Top Trending Broadcasters',
          style: textTheme(context).titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: colorScheme(context).onSurface),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              context.pushReplacementNamed(AppRoute.bottomNavigationBarScreen);
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Text(
                    'Skip',
                    style: textTheme(context).titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme(context).onSurface),
                  ),
                  const Icon(Icons.keyboard_double_arrow_right),
                ],
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.7,
                ),
                itemCount: broadcasters.length,
                itemBuilder: (context, index) {
                  final broadcaster = broadcasters[index];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CachedNetworkImage(
                            imageUrl: broadcaster.imageUrl,
                            imageBuilder: (context, imageProvider) =>
                                CircleAvatar(
                              radius: width * 0.11,
                              backgroundImage: imageProvider,
                            ),
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          if (broadcaster.isVerified)
                            Positioned(
                              bottom: 2,
                              right: 2,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: AppColor.appGreen,
                                child: Icon(
                                  Icons.check,
                                  color: colorScheme(context).onPrimary,
                                  size: 16,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        broadcaster.title,
                        style: textTheme(context).bodyLarge?.copyWith(
                            color: colorScheme(context).onSurface,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person,
                              size: width * 0.05,
                              color: colorScheme(context)
                                  .onSurface
                                  .withOpacity(0.4)),
                          Text(
                            broadcaster.subtitle,
                            style: textTheme(context).bodyLarge?.copyWith(
                                color: colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.4),
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
            CustomButton(
              buttonText: 'Done',
              onPressed: () {
                context.pushNamed(AppRoute.interestSelectionPage);
              },
            )
          ],
        ),
      ),
    );
  }
}
