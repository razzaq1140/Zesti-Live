import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/bottom_navigation_bar/provider/bottom_navigation_bar_provider..dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class NewCustomBottomNavigationBar extends StatelessWidget {
  final Color? backgroundColor;

  const NewCustomBottomNavigationBar({
    super.key,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavigationBarProvider>(context);
    final colorSchemeData = colorScheme(context);

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: backgroundColor ?? colorSchemeData.surface,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            context,
            icon: provider.selectedIndex == 0
                ? AppIcons.selecthome
                : AppIcons.unselecthome,
            index: 0,
          ),
          _buildNavItem(
            context,
            icon: provider.selectedIndex == 1
                ? AppIcons.selectnotification
                : AppIcons.unselectbell,
            index: 1,
          ),
          _buildNavItem(
            context,
            icon: provider.selectedIndex == 2
                ? AppIcons.selectedprofileBottombar
                : AppIcons.unselectedprofileBottombar,
            index: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context,
      {required String icon, required int index}) {
    final provider =
        Provider.of<BottomNavigationBarProvider>(context, listen: false);
    colorScheme(context);

    return GestureDetector(
      onTap: () {
        // provider.changeIndex(index);
        provider.changeIndex(index); // Updates the provider's selected index
      },
      child: SvgPicture.asset(
        icon,
      ),
    );
  }
}
