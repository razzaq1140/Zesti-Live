import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/home/pages/zesti_all.dart';
import 'package:flutter_application_zestilive/src/features/home/pages/zesti_voices.dart';
import 'package:flutter_application_zestilive/src/features/multiguest/pages/multiguest_tab.dart';
import 'package:flutter_application_zestilive/src/features/pk/pages/pk_screen.dart';

import '../../../common/const/global_variables.dart';
import '../../popular/pages/popular_screen.dart';

class HomeZestiScreen extends StatefulWidget {
  const HomeZestiScreen({super.key});
  @override
  State<HomeZestiScreen> createState() => _HomeZestiScreenState();
}

class _HomeZestiScreenState extends State<HomeZestiScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 0,
          automaticallyImplyLeading: false,
          backgroundColor: colorScheme(context).primary,
          title: SizedBox(
            height: 25,
            child: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              dividerColor: colorScheme(context).primary,
              dividerHeight: 0,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: colorScheme(context).onPrimary,
                borderRadius: BorderRadius.circular(30),
              ),
              labelStyle: textTheme(context)
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.w700),
              unselectedLabelStyle: textTheme(context)
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.w400, letterSpacing: 0.25),
              labelColor: colorScheme(context).primary,
              unselectedLabelColor: colorScheme(context).onPrimary,
              labelPadding: const EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(0),
              tabs: const [
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: 'Popular',
                ),
                Tab(
                  text: 'Multiguest',
                ),
                Tab(
                  text: 'Pk',
                ),
                Tab(
                  text: 'Voices',
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  ZestiAllScreen(),
                  PopularScreen(),
                  MultiGuestTab(),
                  PkScreen(),
                  ZestiVoicesScreen()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
