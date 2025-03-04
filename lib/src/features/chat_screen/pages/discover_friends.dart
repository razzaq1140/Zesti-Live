import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../common/const/app_colors.dart';
import '../../../common/const/app_images.dart';
import '../../../router/go_route.dart';

class DiscoverFriendsScreen extends StatelessWidget {
  const DiscoverFriendsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme(context).primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(context),
        ),
        title: Text(
          "Discover Friends",
          style: textTheme(context)
              .titleSmall
              ?.copyWith(color: colorScheme(context).onPrimary),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
              onTap: () {
                context.pushNamed(AppRoute.invitefacebookscreen);
              },
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                'Facebook Friends',
                style: textTheme(context)
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              leading: CircleAvatar(
                backgroundColor: AppColor.tagBlue,
                radius: 20,
                backgroundImage: const AssetImage(AppImages.facebook),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
              )),
          Divider(
            color: colorScheme(context).outlineVariant,
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            onTap: () {
              context.pushNamed(AppRoute.invitecontactsscreen);
            },
            leading: CircleAvatar(
              backgroundColor: AppColor.appGreen,
              radius: 20,
              child: SvgPicture.asset(AppIcons.contactsIcon),
            ),
            title: Text(
              'Contacts',
              style: textTheme(context)
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
            ),
          ),
        ],
      ),
    );
  }
}
