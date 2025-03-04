import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/multiguest/modals/follow_modal.dart';
import 'package:flutter_application_zestilive/src/features/multiguest/pages/multiguest_follow_list_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../common/const/app_colors.dart';
import '../../../common/const/app_images.dart';
import '../../../common/const/global_variables.dart';
import '../../../router/go_route.dart';
import '../provider/followlist_provider.dart';

class MultiguestFollowTab extends StatefulWidget {
  const MultiguestFollowTab({super.key});

  @override
  State<MultiguestFollowTab> createState() => _MultiguestFollowTabState();
}

class _MultiguestFollowTabState extends State<MultiguestFollowTab> {
  @override
  Widget build(BuildContext context) {
    final MultiguestHeader multiguestHeader = MultiguestHeader(avatarUrls: [
      AppImages.multiGuestPlayTab,
      AppImages.multiGuestPlayTab,
      AppImages.multiGuestPlayTab
    ], onlineUsersText: '5477685');
    final List<MultiguestFollowList> followList = [
      MultiguestFollowList(
          profiletitle: 'AKshey sayal',
          profilecaption: 'I am the i am ',
          timestamp: "5 minutes ago",
          profilephoto: AppImages.multiGuestPlayTab),
      MultiguestFollowList(
          profiletitle: 'AKshey sayal',
          timestamp: "5 minutes ago",
          profilecaption: 'I am the i am ',
          profilephoto: AppImages.multiGuestPlayTab)
    ];
    final List<MultiguestGridFollow> multiguestFollow = [
      MultiguestGridFollow(
        imageUrl: AppImages.allPopularScreen,
        views: "456 views",
        tag: "Let's go",
        trendcaption: 'abcdef',
      ),
      MultiguestGridFollow(
        imageUrl: AppImages.allPopularScreen,
        views: "80 views",
        tag: "Join Now",
        trendcaption: 'asdfgh',
      ),
      MultiguestGridFollow(
        imageUrl: AppImages.allPopularScreen,
        views: "45 views",
        tag: "Let's go",
        trendcaption: 'abcdef',
      ),
      MultiguestGridFollow(
        imageUrl: AppImages.allPopularScreen,
        views: "80 views",
        tag: "Join Now",
        trendcaption: 'asdfgh',
      ),
    ];

    final followListProvider = Provider.of<FollowListProvider>(context);

    return Scaffold(
      body: PageView(controller: followListProvider.pageController, children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                minLeadingWidth: 90,
                leading: SizedBox(
                  width: 80,
                  child: Stack(
                    alignment: Alignment.center,
                    children: multiguestHeader.avatarUrls
                        .asMap()
                        .entries
                        .map((entry) {
                      int i = entry.key;
                      String avatarUrl = entry.value;
                      return Positioned(
                        left: i * 20.0,
                        child: CircleAvatar(
                          foregroundImage: NetworkImage(avatarUrl),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                title: Text(
                  '${multiguestHeader.onlineUsersText} online users',
                  style: textTheme(context)
                      .bodySmall
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                trailing: SizedBox(
                  height: 26,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        backgroundColor: AppColor.tagBlue),
                    onPressed: followListProvider.showFollowListScreen,
                    child: Text('see all',
                        style: textTheme(context)
                            .bodySmall
                            ?.copyWith(color: colorScheme(context).onPrimary)),
                  ),
                ),
              ),
              Divider(
                color: AppColor.surfaceGrey,
                thickness: 1,
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Text(
                  'Let\'s Party',
                  style: textTheme(context)
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                trailing: TextButton.icon(
                  style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
                  onPressed: () {},
                  iconAlignment: IconAlignment.end,
                  label: Text(
                    'See all',
                    style: textTheme(context).bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme(context).onSurface,
                        ),
                  ),
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                    color: colorScheme(context).onSurface,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                itemCount: followList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final followItem = followList[index];
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(AppRoute.singleLiveStreamScreen);
                    },
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: CircleAvatar(
                            foregroundImage:
                                NetworkImage(followItem.profilephoto),
                          ),
                          title: Text(followItem.profiletitle,
                              style: textTheme(context).bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: colorScheme(context).onSurface)),
                          subtitle: Text(
                            followItem.profilecaption,
                            style: textTheme(context).bodySmall?.copyWith(
                                color: colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.5)),
                          ),
                          trailing: Column(
                            children: [
                              Text(followItem.timestamp,
                                  style: textTheme(context)
                                      .labelSmall
                                      ?.copyWith(
                                          letterSpacing: 1,
                                          color: colorScheme(context)
                                              .onSurface
                                              .withOpacity(0.5))),
                              const SizedBox(height: 2),
                              Chip(
                                backgroundColor: AppColor.tagBlue,
                                padding: const EdgeInsets.all(4),
                                labelPadding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                shape: const StadiumBorder(
                                  side: BorderSide(color: Colors.transparent),
                                ),
                                avatar: Icon(
                                  Icons.signal_cellular_alt,
                                  color: colorScheme(context).onPrimary,
                                  size: 16,
                                ),
                                label: Text(
                                  'Live',
                                  style: textTheme(context)
                                      .labelSmall
                                      ?.copyWith(
                                          color:
                                              colorScheme(context).onPrimary),
                                ),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                visualDensity: const VisualDensity(
                                  vertical: VisualDensity.minimumDensity,
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(color: AppColor.surfaceGrey, thickness: 1),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              Text(
                'Trends',
                style: textTheme(context)
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 1,
                ),
                itemCount: multiguestFollow.length,
                itemBuilder: (context, index) {
                  final trendData = multiguestFollow[index];
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(AppRoute.createRoom);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              imageUrl: trendData.imageUrl,
                              placeholder: (context, url) => const Center(
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Center(
                                child: Icon(Icons.error, size: 20),
                              ),
                              fit: BoxFit.fill,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          Positioned(
                            top: 10,
                            left: 10,
                            right: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Chip(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 4),
                                  labelPadding: const EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: 2,
                                  ),
                                  avatar: SvgPicture.asset(
                                    AppIcons.starLiveIcon,
                                    width: 16,
                                    height: 16,
                                  ),
                                  avatarBoxConstraints: const BoxConstraints(
                                    maxHeight: 16,
                                    maxWidth: 16,
                                  ),
                                  shape: const StadiumBorder(
                                    side: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  label: Text(
                                    trendData.tag,
                                    style: textTheme(context)
                                        .labelSmall
                                        ?.copyWith(
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
                                Text(
                                  trendData.views,
                                  style: textTheme(context).bodySmall?.copyWith(
                                      color: colorScheme(context).onPrimary,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              left: 10,
                              bottom: 10,
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppIcons.fireIcon),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    trendData.trendcaption,
                                    style: textTheme(context)
                                        .bodyMedium
                                        ?.copyWith(
                                            color:
                                                colorScheme(context).onPrimary),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        MultiguestFollowListScreen(onBack: followListProvider.showMainScreen),
      ]),
    );
  }
}
