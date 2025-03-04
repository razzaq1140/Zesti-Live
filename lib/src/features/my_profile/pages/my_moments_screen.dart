import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/data/user_data.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/model/profile_modal.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/widgets/detailed_profile_screen.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/widgets/moments.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/widgets/shorts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/widgets/profile_header.dart';

class MyMomentsScreen extends StatelessWidget {
  final UserProfile userProfile;
  MyMomentsScreen({super.key}) : userProfile = getDefaultUserProfile();
  @override
  Widget build(BuildContext context) {
    final user = userProfile;

    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
            length: 3,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  iconTheme: IconThemeData(
                    color: colorScheme(context).onPrimary,
                  ),
                  pinned: false,
                  scrolledUnderElevation: 0,
                  expandedHeight: 380.0,
                  collapsedHeight: 300.0,
                  backgroundColor: colorScheme(context).surface,
                  flexibleSpace: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      final maxExtent = 420.0;
                      final minExtent = 240.0;
                      final t = (constraints.maxHeight - minExtent) /
                          (maxExtent - minExtent);

                      return ProfileFlexibleSpace(
                        user: user,
                        collapseFactor: t,
                      );
                    },
                  ),
                ),
                SliverFillRemaining(
                  child: Column(
                    children: [
                      const Divider(
                        thickness: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 6, left: 12),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppIcons.trophyIcon,
                              height: 40,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Contributions',
                              style: textTheme(context).titleSmall?.copyWith(
                                  color: colorScheme(context)
                                      .onSurface
                                      .withOpacity(0.5)),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                foregroundImage:
                                    const AssetImage(AppImages.groupFrameFive),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                          AppImages.multiGuestPlayTab)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                foregroundImage:
                                    const AssetImage(AppImages.groupFrameFive),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                          AppImages.multiGuestPlayTab)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                foregroundImage:
                                    const AssetImage(AppImages.groupFrameFive),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                          AppImages.multiGuestPlayTab)),
                                ),
                              ),
                            ),
                            const Icon(Icons.arrow_forward_ios_rounded),
                          ],
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        width: double.infinity,
                        child: TabBar(
                          labelPadding: const EdgeInsets.all(0),
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: const [
                            Tab(text: 'Moments'),
                            Tab(text: 'Shorts'),
                            Tab(text: 'Detailed Profile'),
                          ],
                          indicatorColor: Theme.of(context).colorScheme.primary,
                          labelColor: Theme.of(context).colorScheme.primary,
                          unselectedLabelColor: Colors.grey,
                          labelStyle: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            const MomentsTab(),
                            ShortsScreen(shorts: user.shorts),
                            DetailedProfileScreen(userProfile: user),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
