import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/multiguest/modals/play_modal.dart';
import 'package:go_router/go_router.dart';
import '../../../router/go_route.dart';

class MultiGuestPlayTab extends StatelessWidget {
  MultiGuestPlayTab({super.key});

  final List<PlayItem> gameItems = [
    PlayItem(
      title: 'Donut Slam Dunk',
      imageUrl: AppImages.multiGuestPlayTab,
      players: 24531,
      tag: 'Hot',
    ),
    PlayItem(
      title: 'Space Invaders',
      imageUrl: AppImages.multiGuestPlayTab,
      players: 15873,
      tag: 'New',
    ),
    PlayItem(
      title: 'Rocket League',
      imageUrl: AppImages.multiGuestPlayTab,
      players: 35261,
      tag: 'Trending',
    ),
    PlayItem(
      title: 'Donut Slam Dunk',
      imageUrl: AppImages.multiGuestPlayTab,
      players: 24531,
      tag: 'Hot',
    ),
    PlayItem(
      title: 'Space Invaders',
      imageUrl: AppImages.multiGuestPlayTab,
      players: 15873,
      tag: 'New',
    ),
    PlayItem(
      title: 'Rocket League',
      imageUrl: AppImages.multiGuestPlayTab,
      players: 35261,
      tag: 'Trending',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(AppImages.multiguestPlayHeader),
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
                itemCount: gameItems.length,
                itemBuilder: (context, index) {
                  final gameItem = gameItems[index];
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(AppRoute.userViewCommentPage);
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
                                borderRadius: BorderRadius.circular(20)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CachedNetworkImage(
                                imageUrl: gameItem.imageUrl,
                                placeholder: (context, url) => const Center(
                                    child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator())),
                                errorWidget: (context, url, error) => Center(
                                    child: Icon(
                                  Icons.error,
                                  color: colorScheme(context).error,
                                  size: 20,
                                )),
                                fit: BoxFit.fill,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -10,
                            left: 10,
                            right: 10,
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(0),
                              title: Text(
                                gameItem.title,
                                style: textTheme(context).bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: colorScheme(context).onPrimary,
                                    ),
                              ),
                              subtitle: Text(
                                '${gameItem.players} players',
                                style: textTheme(context).bodySmall?.copyWith(
                                    color: colorScheme(context)
                                        .onPrimary
                                        .withOpacity(0.5),
                                    fontWeight: FontWeight.w500),
                              ),
                              trailing: Chip(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 4),
                                labelPadding: const EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 2,
                                ),
                                shape: const StadiumBorder(
                                  side: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                label: Text(
                                  gameItem.tag,
                                  style:
                                      textTheme(context).labelSmall?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: colorScheme(context).primary,
                                          ),
                                ),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                visualDensity: const VisualDensity(
                                  vertical: VisualDensity.minimumDensity,
                                ),
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
    );
  }
}
