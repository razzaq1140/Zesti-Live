import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/features/pk/widgets/top_fans_tab.dart';
import 'package:flutter_application_zestilive/src/features/pk/widgets/top_fans_today_tab.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../common/const/global_variables.dart';

class FansTabbarBottomSheet extends StatelessWidget {
  const FansTabbarBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: const EdgeInsetsDirectional.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Broadcaster zircon ranking',
                    style: textTheme(context)
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIcons.rewardBoxIcon),
                        const SizedBox(width: 2),
                        Text(
                          'Rewards',
                          style: textTheme(context).bodySmall?.copyWith(
                              color: colorScheme(context)
                                  .onSurface
                                  .withOpacity(0.6)),
                        ),
                        const SizedBox(width: 2),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 8,
                          color:
                              colorScheme(context).onSurface.withOpacity(0.6),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 74,
                  width: 110,
                  decoration: BoxDecoration(
                    color: AppColor.tagBlue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'This Week',
                        style: textTheme(context).bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme(context).onPrimary),
                      ),
                      Text(
                        '100+',
                        style: textTheme(context).titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme(context).onPrimary),
                      ),
                      Wrap(
                        children: [
                          SvgPicture.asset(AppIcons.zircon),
                          Text(
                            '121',
                            style: textTheme(context).labelSmall?.copyWith(
                                color: colorScheme(context).onPrimary),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 74,
                  width: 110,
                  decoration: BoxDecoration(
                    color: AppColor.tagRed,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'This Hour',
                        style: textTheme(context).bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme(context).onPrimary),
                      ),
                      Text(
                        '200+',
                        style: textTheme(context).titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme(context).onPrimary),
                      ),
                      Wrap(
                        children: [
                          SvgPicture.asset(AppIcons.zircon),
                          Text(
                            '121',
                            style: textTheme(context).labelSmall?.copyWith(
                                color: colorScheme(context).onPrimary),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 74,
                  width: 110,
                  decoration: BoxDecoration(
                    color: AppColor.tagGreen,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'This Month',
                        style: textTheme(context).bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme(context).onPrimary),
                      ),
                      Text(
                        '500+',
                        style: textTheme(context).titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme(context).onPrimary),
                      ),
                      Wrap(
                        children: [
                          SvgPicture.asset(AppIcons.zircon),
                          Text(
                            '123',
                            style: textTheme(context).labelSmall?.copyWith(
                                color: colorScheme(context).onPrimary),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(tabs: [
                      Tab(text: 'Top Fans Today'),
                      Tab(text: 'Top Fans'),
                    ]),
                    Expanded(
                      child:
                          TabBarView(children: [TopFansTodayTab(), TopFans()]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
