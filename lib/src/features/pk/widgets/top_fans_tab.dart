import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/pk/modals/top_fans_modal.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/features/pk/widgets/profile_bottomsheet.dart';
import 'package:go_router/go_router.dart';

class TopFans extends StatelessWidget {
  const TopFans({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: topFans.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              context.pop();
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return ProfileBottomSheet(
                    index: index,
                  );
                },
              );
            },
            contentPadding: const EdgeInsets.all(0),
            leading: CircleAvatar(
              radius: 20,
              foregroundImage: NetworkImage(topFans[index].avatarUrl),
            ),
            title: Text(
              topFans[index].name,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            subtitle: Text(
              topFans[index].caption,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.5),
                  ),
            ),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppColor.tagBlue,
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(color: Theme.of(context).colorScheme.surface),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.star,
                    size: 8,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    topFans[index].rating,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontSize: 10,
                          letterSpacing: 0,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
