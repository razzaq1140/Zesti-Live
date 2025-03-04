import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/ecommerce_feature.dart/main_pages/pages/main_one_page.dart';
import 'package:flutter_application_zestilive/src/features/ecommerce_feature.dart/main_pages/pages/new_ecommmerce_profile.dart';
import 'package:flutter_application_zestilive/src/features/ecommerce_feature.dart/main_pages/pages/new_notification.dart';
import 'package:flutter_application_zestilive/src/features/ecommerce_feature.dart/new_bottom_nav/widgets/new_custom_bottom_nav.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/bottom_navigation_bar/provider/bottom_navigation_bar_provider..dart';

class NewBottomNavPage extends StatefulWidget {
  const NewBottomNavPage({super.key});
  @override
  State<NewBottomNavPage> createState() =>
      _NewBottomNavPageState();
}

class _NewBottomNavPageState extends State<NewBottomNavPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavigationBarProvider>(context);
    final List<Widget> pages = [
      const MainOnePage(),
      const NewNotificationPage(),
      NewEcommmerceProfilePage()
    ];
    return Scaffold(
      body: Stack(
        children: [
          pages[provider.selectedIndex],
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: NewCustomBottomNavigationBar(

              backgroundColor: colorScheme(context).surface,
            ),
          ),
        ],
      ),
    );
  }
}
