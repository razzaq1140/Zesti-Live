import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/features/multiguest/pages/multiguest_all_tab.dart';
import 'package:flutter_application_zestilive/src/features/multiguest/pages/multiguest_chat_tab.dart';
import 'package:flutter_application_zestilive/src/features/multiguest/pages/multiguest_follow_tab.dart';
import 'package:flutter_application_zestilive/src/features/multiguest/pages/multiguest_play_tab.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../common/const/global_variables.dart';
import '../provider/countryselection_provider.dart';

class MultiGuestTab extends StatelessWidget {
  const MultiGuestTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> languages = [
      'English',
      'Hindi',
      'Español',
      'Français',
      'Japanese',
      'Bangla',
      'Indonesia',
      'Russian',
      'Chinese',
      'Filipino',
      'Portuguese',
      'Bahasa'
    ];
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 0,
          automaticallyImplyLeading: false,
          backgroundColor: colorScheme(context).surface,
          title: SizedBox(
            height: 25,
            child: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              // indicator: BoxDecoration(
              //   color: colorScheme(context).onPrimary,
              //   borderRadius: BorderRadius.circular(30),
              // ),

              labelColor: colorScheme(context).primary,
              unselectedLabelColor: colorScheme(context).onSurface,
              labelPadding: const EdgeInsets.symmetric(horizontal: 12),
              labelStyle: textTheme(context)
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.w700),
              unselectedLabelStyle: textTheme(context)
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.w400, letterSpacing: 0.25),
              tabs: const [
                Tab(
                  text: 'Follow',
                ),
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: 'Play',
                ),
                Tab(
                  text: 'Chat',
                ),
                Tab(
                  text: 'Draw',
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (BuildContext context) {
                    final screenHeight =
                        MediaQuery.of(context).size.height * 0.6;

                    return Container(
                      height: screenHeight,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Select Country/Region',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.w800),
                              ),
                              const Spacer(),
                              TextButton.icon(
                                icon: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  size: 12,
                                ),
                                label: Text(
                                  'More',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.w800),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          // Country Selection Grid
                          Consumer<CountrySelectionProvider>(
                            builder: (context, countryProvider, child) {
                              return GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 8.0,
                                  mainAxisSpacing: 8.0,
                                  childAspectRatio: 3,
                                ),
                                itemCount: languages.length,
                                itemBuilder: (context, index) {
                                  bool isSelected =
                                      countryProvider.selectedCountryIndex ==
                                          index;

                                  return ToggleButtons(
                                    isSelected: [isSelected],
                                    onPressed: (int newIndex) {
                                      countryProvider.selectCountry(index);
                                    },
                                    borderRadius: BorderRadius.circular(20.0),
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    selectedColor:
                                        Theme.of(context).colorScheme.surface,
                                    fillColor:
                                        Theme.of(context).colorScheme.primary,
                                    borderColor:
                                        Theme.of(context).colorScheme.primary,
                                    selectedBorderColor:
                                        Theme.of(context).colorScheme.primary,
                                    constraints: const BoxConstraints(
                                      minWidth: 100,
                                      minHeight: 40,
                                    ),
                                    children: [
                                      Center(
                                        child: Text(
                                          languages[index],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                color: isSelected
                                                    ? Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary
                                                    : Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                fontWeight: FontWeight.w800,
                                              ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                          // Submit Button
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 10,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Submit',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: SvgPicture.asset(AppIcons.filterIcon),
            )
          ],
        ),
        body: Expanded(
          child: TabBarView(
            children: [
              _buildTabNavigator(
                const MultiguestFollowTab(),
              ),
              _buildTabNavigator(
                MultiguestAllTab(),
              ),
              _buildTabNavigator(
                MultiGuestPlayTab(),
              ),
              _buildTabNavigator(
                const MultiguestChatTab(),
              ),
              const Center(
                child: Text('Draw'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabNavigator(Widget screen) {
    return Navigator(
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => screen,
        );
      },
    );
  }
}
