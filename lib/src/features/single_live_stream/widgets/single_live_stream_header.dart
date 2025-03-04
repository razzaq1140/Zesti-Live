import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../common/const/app_colors.dart';
import '../../../common/const/app_images.dart';
import '../../../common/const/global_variables.dart';
import '../../pk/widgets/fans_bottom_sheet.dart';

class SIngleLiveStreamHeader extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SIngleLiveStreamHeader({
    super.key,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Container(
                      height: 36,
                      width: 135,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: AppColor.surfaceGrey.withOpacity(0.2),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(width: 40),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Jeannette King',
                                  style: textTheme(context)
                                      .labelSmall
                                      ?.copyWith(
                                          letterSpacing: 0,
                                          color: colorScheme(context).onPrimary,
                                          fontSize: 10),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.person,
                                      size: 9,
                                      color: colorScheme(context).onPrimary,
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      '139',
                                      style: textTheme(context)
                                          .labelSmall
                                          ?.copyWith(
                                              color: colorScheme(context)
                                                  .onPrimary,
                                              letterSpacing: 0,
                                              fontSize: 9),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Icon(
                              Icons.add_circle,
                              size: 18,
                              color: AppColor.textGrey,
                            ),
                          ],
                        ),
                      )),
                  CircleAvatar(
                      backgroundColor: Colors.transparent,
                      foregroundImage: const AssetImage(AppImages.goldlevel),
                      radius: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(AppImages.allPopularScreen)),
                      )),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  buildAvatar(AppImages.groupFrameOne, 17),
                  buildAvatar(AppImages.groupFrameTwo, 17),
                  buildAvatar(AppImages.groupFrameThree, 17),
                ],
              ),
              const Spacer(),
              IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                  icon: SvgPicture.asset(AppIcons.eyeIcon)),
              IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: SvgPicture.asset(AppIcons.closeicon),
              )
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return const FansTabbarBottomSheet();
                    },
                  );
                },
                child: Container(
                  height: 22,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: AppColor.surfaceGrey.withOpacity(0.2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(AppIcons.zircon),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        '4523653',
                        style: textTheme(context).labelSmall?.copyWith(
                            letterSpacing: 0, color: AppColor.appYellow),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Icon(Icons.arrow_upward_rounded,
                          size: 12, color: colorScheme(context).onPrimary),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                padding: const EdgeInsets.all(4),
                height: 22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: AppColor.surfaceGrey.withOpacity(0.2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(AppIcons.starBlue),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      '45 stars',
                      style: textTheme(context).labelSmall?.copyWith(
                          letterSpacing: 0,
                          color: colorScheme(context).onPrimary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildAvatar(String imagePath, double radius) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        foregroundImage: AssetImage(imagePath),
        radius: radius,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(AppImages.allPopularScreen),
          ),
        ),
      ),
    );
  }
}
