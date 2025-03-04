import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/pk/modals/top_fans_modal.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/features/pk/widgets/profile_bottomsheet.dart';
import 'package:go_router/go_router.dart';
import '../../../common/const/global_variables.dart';

class TopFansTodayTab extends StatelessWidget {
  const TopFansTodayTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
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
                    return  ProfileBottomSheet(index:index ,);
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
                style: textTheme(context)
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                topFans[index].caption,
                style: textTheme(context).bodyMedium?.copyWith(
                      color: colorScheme(context).onSurface.withOpacity(0.5),
                    ),
              ),
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColor.tagBlue,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: colorScheme(context).surface),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      size: 8,
                      color: colorScheme(context).onPrimary,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      topFans[index].rating,
                      style: textTheme(context).labelSmall?.copyWith(
                            fontSize: 10,
                            letterSpacing: 0,
                            color: colorScheme(context).onPrimary,
                          ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
