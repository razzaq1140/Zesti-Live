import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/single_live_stream/tabs/task_list_tab.dart';
import '../../../common/const/app_images.dart';
import '../../../common/const/global_variables.dart';

class CarosuelTabBarBottomSheet extends StatelessWidget {
  const CarosuelTabBarBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TabBar(dividerColor: Colors.transparent, tabs: [
              Tab(text: 'Play Center'),
              Tab(text: 'Task'),
            ]),
            Expanded(
              child: TabBarView(children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    shrinkWrap: true,
                    children: [
                      _buildGridItem(
                          AppImages.pkPrediction, 'PK Prediction', context),
                      _buildGridItem(
                          AppImages.wheelPlayCenter, 'Crazy Wheel', context),
                      _buildGridItem(AppImages.vipPlaycenter, 'VIP', context),
                      _buildGridItem(
                          AppImages.storePlayCenter, 'Store', context),
                    ],
                  ),
                ),
                const TaskListTab()
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(String imagePath, String label, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 27,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(height: 8),
        Text(label,
            style: textTheme(context).labelSmall?.copyWith(
                fontWeight: FontWeight.w500,
                letterSpacing: 0,
                color: colorScheme(context).onSurface.withOpacity(0.5))),
      ],
    );
  }
}
