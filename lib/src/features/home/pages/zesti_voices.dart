import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../common/const/app_images.dart';
import '../../../common/const/global_variables.dart';
import '../../../router/go_route.dart';
import '../../popular/modal/popular_modal.dart';

class ZestiVoicesScreen extends StatelessWidget {
  const ZestiVoicesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<PopularItem> ZestiVoiceItems = [
      PopularItem(
        ontap: () {
          context.pushNamed(AppRoute.streamuserview);
        },
        imageUrl: AppNetworkImages.networkFive,
        title: 'SuperStar',
        views: '1200',
        status: 'Let\'s Join',
      ),
      PopularItem(
        ontap: () {
          context.pushNamed(AppRoute.streamuserview);
        },
        imageUrl: AppNetworkImages.networkFour,
        title: 'SuperStar',
        views: '3400',
        status: 'Let\'s Join',
      ),
      PopularItem(
        ontap: () {
          context.pushNamed(AppRoute.streamuserview);
        },
        imageUrl: AppNetworkImages.networkThirteen,
        title: 'SuperStar',
        views: '2500',
        status: 'Let\'s Join',
      ),
      PopularItem(
        ontap: () {
          context.pushNamed(AppRoute.streamuserview);
        },
        imageUrl: AppNetworkImages.networkSix,
        title: 'SuperStar',
        views: '2500',
        status: 'Let\'s Join',
      ),
      PopularItem(
        ontap: () {
          context.pushNamed(AppRoute.streamuserview);
        },
        imageUrl: AppNetworkImages.networkSeven,
        title: 'Pc Game stream',
        views: '2500',
        status: 'Let\'s Join',
      ),
    ];
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
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
                  itemCount: ZestiVoiceItems.length,
                  itemBuilder: (context, index) {
                    final zestiVoiceItems = ZestiVoiceItems[index];
                    return GestureDetector(
                      onTap: zestiVoiceItems.ontap, // Call onTap from the item
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
                                  imageUrl: zestiVoiceItems.imageUrl,
                                  placeholder: (context, url) => const Center(
                                      child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator())),
                                  errorWidget: (context, url, error) =>
                                      const Center(
                                          child: Icon(
                                    Icons.error,
                                    size: 20,
                                  )),
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 5,
                              right: 5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Chip(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 4),
                                    avatar: SvgPicture.asset(
                                      AppIcons.starLiveIcon,
                                      width: 16,
                                      height: 16,
                                    ),
                                    avatarBoxConstraints: const BoxConstraints(
                                      maxHeight: 16,
                                      maxWidth: 16,
                                    ),
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
                                      zestiVoiceItems.status,
                                      style: textTheme(context)
                                          .labelSmall
                                          ?.copyWith(
                                            letterSpacing: 0,
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
                                    zestiVoiceItems.views,
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
                                height: 18,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppIcons.fireIcon),
                                    const SizedBox(width: 2),
                                    Text(
                                      zestiVoiceItems.title,
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
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
