import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/meet_love/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/bottom_navigation_bar/pages/bottom_navigation_bar.dart';
import 'package:flutter_application_zestilive/src/features/bottom_navigation_bar/provider/bottom_navigation_bar_provider..dart';
import 'package:flutter_application_zestilive/src/features/home/pages/home_page.dart';
import 'package:flutter_application_zestilive/src/features/liveoptions/liveoptions.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/pages/my_profile_screen.dart';
import '../../explore/explore_page.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});
  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavigationBarProvider>(context);
    final List<Widget> pages = [
      const HomePage(),
      const ExplorePage(),
      const LiveOptionScreen(),
      MeetUpHomePage(),
      MyProfileScreen()
    ];
    return Scaffold(
      body: Stack(
        children: [
          pages[provider.selectedIndex],
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: CustomBottomNavigationBar(
              backgroundColor: colorScheme(context).surface,
            ),
          ),
        ],
      ),
    );
  }
}
