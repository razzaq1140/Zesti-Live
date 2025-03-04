import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:go_router/go_router.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(98),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.tagRed,
          title: Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Text(
              'About Us',
              style: textTheme(context).titleSmall?.copyWith(
                  color: colorScheme(context).surface,
                  fontWeight: FontWeight.w700),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Column(children: [
        _buildListTile(
          'Privacy Policy',
          Icons.notifications,
          context,
          () {
            context.pushNamed(AppRoute.privacyPolicyPage);
          },
        ),
        Divider(
          height: 2,
          color: colorScheme(context).onSurface.withOpacity(0.15),
        ),
        _buildListTile(
          'User Agreement',
          Icons.notifications,
          context,
          () {
            context.pushNamed(AppRoute.userAgreementPage);
          },
        ),
        Divider(
          height: 2,
          color: colorScheme(context).onSurface.withOpacity(0.15),
        ),
        _buildListTile(
          'Broadcaster Agreement',
          Icons.notifications,
          context,
          () {
            context.pushNamed(AppRoute.broadcasterAgreementPage);
          },
        ),
        Divider(
          height: 2,
          color: colorScheme(context).onSurface.withOpacity(0.15),
        ),
        _buildListTile(
          'About Our Company',
          Icons.notifications,
          context,
          () {
            context.pushNamed(AppRoute.aboutOurCompanyPage);
          },
        ),
        Divider(
          height: 2,
          color: colorScheme(context).onSurface.withOpacity(0.15),
        ),
        _buildListTile(
          'Community convention',
          Icons.notifications,
          context,
          () {},
        ),
        Divider(
          height: 2,
          color: colorScheme(context).onSurface.withOpacity(0.15),
        ),
      ]),
    );
  }

  Widget _buildListTile(
      String title, IconData icon, BuildContext context, VoidCallback onTap) {
    return ListTile(
      title: Text(title,
          style: textTheme(context).titleSmall?.copyWith(
                color: colorScheme(context).onSurface,
              )),
      trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_forward_ios,
            color: AppColor.textGrey,
            size: 20,
          )),
      onTap: onTap,
    );
  }
}
