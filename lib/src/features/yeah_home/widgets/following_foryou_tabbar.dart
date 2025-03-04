import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/const/global_variables.dart';
import '../providers/tab_provider.dart';

class FollowingForYouTabBar extends StatelessWidget {
  const FollowingForYouTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            tabProvider.updateSelectedIndex(0);
          },
          child: Text(
            "Following",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: tabProvider.selectedIndex == 0
                      ? colorScheme(context).onPrimary
                      : colorScheme(context).onPrimary.withOpacity(0.6),
                ),
          ),
        ),
        Container(
          height: 20,
          width: 1,
          color: colorScheme(context).surface,
          margin: const EdgeInsets.symmetric(horizontal: 10),
        ),
        GestureDetector(
          onTap: () {
            tabProvider.updateSelectedIndex(1);
          },
          child: Text(
            "For You",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: tabProvider.selectedIndex == 1
                      ? colorScheme(context).onPrimary
                      : colorScheme(context).onPrimary.withOpacity(0.6),
                ),
          ),
        ),
      ],
    );
  }
}
