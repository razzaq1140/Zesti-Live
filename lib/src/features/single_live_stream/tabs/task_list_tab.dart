import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/features/single_live_stream/provider/single_live_stream_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../common/const/global_variables.dart';

class TaskListTab extends StatelessWidget {
  const TaskListTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TaskListModal> newcomerTasks = [
      TaskListModal(
        image: AppImages.addTask,
        title: "Follow a broadcaster",
        coinCount: "coins x 300",
      ),
      TaskListModal(
        image: AppImages.giftTask,
        title: "Send gifts to broadcaster",
        coinCount: "coins x 300",
      ),
      TaskListModal(
        image: AppImages.giftTask,
        title: "Send gifts to broadcast",
        coinCount: "coins x 300",
      ),
    ];

    final List<TaskListModal> dailyTasks = [
      TaskListModal(
        image: AppImages.checkinTask,
        title: "Check In",
      )
    ];

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Newcomer Task',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: newcomerTasks.length,
              itemBuilder: (context, index) {
                return TaskItem(task: newcomerTasks[index]);
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Daily Task',
              style: textTheme(context)
                  .titleSmall
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: dailyTasks.length,
              itemBuilder: (context, index) {
                return TaskItem(task: dailyTasks[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// TaskItem Widget
class TaskItem extends StatelessWidget {
  final TaskListModal task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    // Get the provider to check task status
    final taskProvider = Provider.of<SingleLiveStreamProvider>(context);

    bool isTapped = taskProvider.isTaskTapped(task.title);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            children: [
              // Icon
              CircleAvatar(
                radius: 21,
                backgroundImage: AssetImage(task.image),
              ),
              const SizedBox(width: 10),
              // Task description and reward
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task.title,
                        style: textTheme(context)
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w500)),
                    if (task.coinCount != null)
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.coinsGrey),
                          const SizedBox(width: 4),
                          Text(task.coinCount!,
                              style: textTheme(context).bodySmall?.copyWith(
                                  color: colorScheme(context)
                                      .onSurface
                                      .withOpacity(0.5))),
                        ],
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 22,
                child: ElevatedButton(
                  onPressed: () {
                    taskProvider.toggleTaskStatus(task.title);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isTapped
                        ? AppColor.surfaceGrey
                        : colorScheme(context).primary,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    isTapped ? 'Unfinished' : 'Receive',
                    style: textTheme(context).labelSmall?.copyWith(
                          color: isTapped
                              ? colorScheme(context).onSurface.withOpacity(0.5)
                              : colorScheme(context).onPrimary,
                          letterSpacing: 0,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}

// TaskListModal class to represent a task
class TaskListModal {
  final String image;
  final String title;
  final String? coinCount;

  TaskListModal({
    required this.image,
    required this.title,
    this.coinCount,
  });
}
