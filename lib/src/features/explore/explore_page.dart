import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import '../../common/const/global_variables.dart';
import '../../router/go_route.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});
  final List<Map<String, dynamic>> images = const [
    {
      "url":
          'https://images.pexels.com/photos/1386604/pexels-photo-1386604.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      "isLive": true,
    },
    {
      "url":
          'https://static.vecteezy.com/system/resources/previews/005/346/410/non_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
      "isLive": false,
    },
    {
      "url":
          'https://images.pexels.com/photos/1386604/pexels-photo-1386604.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      "isLive": false,
    },
    {
      "url":
          'https://static.vecteezy.com/system/resources/previews/005/346/410/non_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
      "isLive": false,
    },
    {
      "url":
          'https://images.pexels.com/photos/1386604/pexels-photo-1386604.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      "isLive": false,
    },
    {
      "url":
          'https://static.vecteezy.com/system/resources/previews/005/346/410/non_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
      "isLive": false,
    },
    {
      "url":
          'https://static.vecteezy.com/system/resources/previews/005/346/410/non_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
      "isLive": true,
    },
    {
      "url":
          'https://static.vecteezy.com/system/resources/previews/005/346/410/non_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
      "isLive": false,
    },
  ];

  final List<Map<String, String>> exploreItems = const [
    {
      "label": "New Host",
      "imageUrl":
          'https://images.pexels.com/photos/1386604/pexels-photo-1386604.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    },
    {
      "label": "#girl",
      "imageUrl":
          'https://images.pexels.com/photos/1386604/pexels-photo-1386604.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    },
    {
      "label": "#music",
      "imageUrl":
          'https://images.pexels.com/photos/1386604/pexels-photo-1386604.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    },
    {
      "label": "Gaming",
      "imageUrl":
          'https://images.pexels.com/photos/1386604/pexels-photo-1386604.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    },
    {
      "label": "#travel",
      "imageUrl":
          'https://images.pexels.com/photos/1386604/pexels-photo-1386604.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: colorScheme(context).primary,
                  height: 230,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 50),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Explore",
                          style: TextStyle(
                            color: colorScheme(context).surface,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                            onTap: () {
                              context.pushNamed(AppRoute.searchscreen);
                            },
                            child: Icon(Icons.search,
                                color: colorScheme(context).surface)),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(AppRoute.notificationPage);
                          },
                          child: Icon(Icons.notifications_outlined,
                              color: colorScheme(context).surface),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 130,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: exploreItems.length,
                        itemBuilder: (context, index) {
                          final item = exploreItems[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4.0, vertical: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Stack(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: item['imageUrl']!,
                                    width: 120,
                                    height: 130,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                  Container(
                                    width: 120,
                                    height: 130,
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                  Positioned(
                                    bottom: 8,
                                    left: 8,
                                    child: Text(
                                      item['label']!,
                                      style: TextStyle(
                                        color: colorScheme(context).surface,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
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
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Countries & Regions",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppRoute.countryselectionscreen);
                    },
                    child: Row(
                      children: [
                        Text(
                          "More",
                          style: TextStyle(
                            color: colorScheme(context).onSurface,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 70.0,
              runSpacing: 15.0,
              children: [
                for (var country in [
                  {"name": "India", "emoji": "🇮🇳"},
                  {"name": "Indonesia", "emoji": "🇮🇩"},
                  {"name": "Russia", "emoji": "🇷🇺"},
                  {"name": "China", "emoji": "🇨🇳"},
                  {"name": "England", "emoji": "🇬🇧"},
                  {"name": "España", "emoji": "🇪🇸"},
                  {"name": "France", "emoji": "🇫🇷"},
                  {"name": "Japan", "emoji": "🇯🇵"},
                ])
                  _buildCountryItem(
                      country["name"]!, country["emoji"]!, context),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Trending Live",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(AppRoute.exploreDetailScreen);
                          },
                          child: Text(
                            "See all",
                            style: TextStyle(
                              color: colorScheme(context).onSurface,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            MasonryGridView.count(
              padding: EdgeInsets.zero,
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: images.length,
              itemBuilder: (context, index) {
                final image = images[index];
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: image['url'],
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    if (image['isLive'])
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            "LIVE HOUSE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create a country item with an emoji flag
  Widget _buildCountryItem(
      String countryName, String emojiFlag, BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          AppRoute.detailcountryscreen,
          pathParameters: {'countryName': countryName},
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            emojiFlag,
            style: const TextStyle(fontSize: 28),
          ),
          const SizedBox(height: 4),
          Text(
            countryName,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
