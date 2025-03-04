import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/features_e_commerce/pages/all_item_page.dart';
import 'package:flutter_application_zestilive/src/features/home/pages/Tabs/notification_live_tab.dart';
import 'package:flutter_application_zestilive/src/features/home/pages/Tabs/notification_moments_tab.dart';
import 'package:flutter_application_zestilive/src/features/home/pages/home_zesti.dart';
import 'package:flutter_application_zestilive/src/features/multiguest/pages/multiguest_play_tab.dart';
import 'package:flutter_application_zestilive/src/features/search/pages/home_search_screen.dart';
import '../../yeah_home/pages/yeah_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _maintabcontroller;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _maintabcontroller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        width: 300,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Notifications',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: colorScheme(context).primary)),
                  width: double.infinity,
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    controller: _tabController,
                    indicator: BoxDecoration(
                      color: colorScheme(context).primary,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    labelColor: Theme.of(context).colorScheme.surface,
                    unselectedLabelColor: Theme.of(context).primaryColor,
                    tabs: const [
                      Tab(text: 'LIVE'),
                      Tab(text: 'MOMENTS'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: [NotificationLiveTab(), NotificationMomentsTab()]),
          ),
        ]),
      ),
      appBar: AppBar(
        elevation: 0,
        title: TabBar(
          controller: _maintabcontroller,
          indicator: const BoxDecoration(color: Colors.transparent),
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          tabs: const [
            Tab(text: 'ZESTI'),
            Tab(text: 'GAMES'),
            Tab(text: 'VIDEOS'),
            Tab(text: 'SHOPPING'),
          ],
          indicatorColor: colorScheme(context).onPrimary,
          labelColor: colorScheme(context).onPrimary,
          labelStyle: textTheme(context)
              .bodySmall
              ?.copyWith(fontWeight: FontWeight.w700),
          unselectedLabelStyle: textTheme(context)
              .labelSmall
              ?.copyWith(fontWeight: FontWeight.w400),
          dividerColor: colorScheme(context).primary,
          dividerHeight: 0,
          unselectedLabelColor: colorScheme(context).onPrimary,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search,
                size: 20, color: colorScheme(context).onPrimary),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeSearchScreen(),
                  ));
            },
          ),
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.notifications_none,
                    size: 20, color: colorScheme(context).onPrimary),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          )
        ],
        automaticallyImplyLeading: false,
        toolbarHeight: 50,
        scrolledUnderElevation: 0,
        backgroundColor: colorScheme(context).primary,
      ),
      backgroundColor: colorScheme(context).primary,
      body: TabBarView(
        controller: _maintabcontroller,
        children: [
          const HomeZestiScreen(),
          MultiGuestPlayTab(),
          const YeahScreen(),
          AllItemPage(),
        ],
      ),
    );
  }
}
