import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(98),
        child: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.tagRed,
          title: Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Text(
              'Settings',
              style: textTheme(context).titleSmall?.copyWith(
                  color: colorScheme(context).surface,
                  fontWeight: FontWeight.w700),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: IconButton(
              icon:
                  Icon(Icons.arrow_back, color: colorScheme(context).onPrimary),
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          _buildListTile(
            'Notifications',
            Icons.notifications,
            context,
            () {
              context.pushNamed(AppRoute.notificationPage);
            },
          ),
          Divider(
            height: 2,
            color: colorScheme(context).outlineVariant,
          ),
          _buildListTile(
            'Privacy',
            Icons.lock,
            context,
            () {
              context.pushNamed(AppRoute.privacyPage);
            },
          ),
          Divider(
            height: 2,
            color: colorScheme(context).outlineVariant,
          ),
          _buildListTile(
            'Blocked List',
            Icons.block,
            context,
            () {
              context.pushNamed(AppRoute.blockedListPage);
            },
          ),
          Divider(
            height: 2,
            color: colorScheme(context).outlineVariant,
          ),
          _buildConnectedAccountTile(context),
          Divider(
            height: 2,
            color: colorScheme(context).outlineVariant,
          ),
          _buildListTile(
            'About Us',
            Icons.info_outline,
            context,
            () {
              context.pushNamed(AppRoute.aboutUsPage);
            },
          ),
          Divider(
            height: 2,
            color: colorScheme(context).outlineVariant,
          ),
          _buildListTile(
            'Help Us Translate',
            Icons.translate,
            context,
            () {
              context.pushNamed(AppRoute.helpUsPage);
            },
          ),
          Divider(
            height: 2,
            color: colorScheme(context).outlineVariant,
          ),
          _buildListTile(
            'Clean Cache',
            Icons.delete_sweep,
            context,
            () {},
          ),
          Divider(
            height: 2,
            color: colorScheme(context).outlineVariant,
          ),
          _buildListTile(
            'Log Out',
            Icons.logout,
            context,
            () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      "Are you sure want to logout ?",
                      style: textTheme(context)
                          .bodyLarge
                          ?.copyWith(color: colorScheme(context).onSurface),
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            child: Text(
                              "No",
                              style: textTheme(context).bodyLarge?.copyWith(
                                  color: colorScheme(context).primary),
                            ),
                            onPressed: () {
                              context.pop();
                            },
                          ),
                          TextButton(
                            child: Text(
                              "Yes",
                              style: textTheme(context).bodyLarge?.copyWith(
                                  color: colorScheme(context).primary),
                            ),
                            onPressed: () {
                              context.pop();
                              MyAppRouter.clearAndNavigate(
                                  context, AppRoute.selectSignupPage);
                            },
                          ),
                        ],
                      )
                    ],
                  );
                },
              );
            },
          ),
          Divider(
            height: 2,
            color: colorScheme(context).outlineVariant,
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(
      String title, IconData icon, BuildContext context, VoidCallback onTap) {
    return ListTile(
      title: Text(title,
          style: textTheme(context).titleSmall?.copyWith(
                color: colorScheme(context).onSurface,
              )),
      onTap: onTap, // Call the passed function on tap
    );
  }

  Widget _buildConnectedAccountTile(
    BuildContext context,
  ) {
    return ListTile(
      title: const Text(
        'Connected Account',
        style: TextStyle(fontSize: 16),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.shield_outlined,
            size: 16,
            color: colorScheme(context).error,
          ),
          const SizedBox(width: 5),
          Text(
            'Unprotected',
            style: TextStyle(color: colorScheme(context).error, fontSize: 14),
          ),
        ],
      ),
      onTap: () {
        context.pushNamed(AppRoute.connectedAccountPage);
      },
    );
  }
}
