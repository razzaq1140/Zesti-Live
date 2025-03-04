import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ConnectedAccountPage extends StatefulWidget {
  const ConnectedAccountPage({super.key});

  @override
  State<ConnectedAccountPage> createState() => _ConnectedAccountPageState();
}

class _ConnectedAccountPageState extends State<ConnectedAccountPage> {
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
              'Connected Account',
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
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAccountTile(
              svgIconPath: AppIcons.phone,
              platform: 'Phone',
              detail: '+91 9876543210',
              onTap: () {
                context.pushNamed(AppRoute.phonePage);
              },
            ),
            Divider(
              height: 2,
              color: colorScheme(context).onSurface.withOpacity(0.15),
            ),
            _buildAccountTile(
              svgIconPath: AppIcons.facebook,
              platform: 'Facebook',
              detail: 'Akshay Syal',
              onTap: () {
                context.pushNamed(AppRoute.facebookLinkPage);
              },
            ),
            Divider(
              height: 2,
              color: colorScheme(context).onSurface.withOpacity(0.15),
            ),
            _buildAccountTile(
              svgIconPath: AppIcons.skype,
              platform: 'Twitter',
              detail: 'AkshaySyal10',
              onTap: () {
                context.pushNamed(AppRoute.twitterLinkPage);
              },
            ),
            Divider(
              height: 2,
              color: colorScheme(context).onSurface.withOpacity(0.15),
            ),
            _buildAccountTile(
              svgIconPath: AppIcons.google,
              platform: 'Google',
              detail: '',
              onTap: () {
                context.pushNamed(AppRoute.googleLinkPage);
              },
            ),
            Divider(
              height: 2,
              color: colorScheme(context).onSurface.withOpacity(0.15),
            ),
            _buildAccountTile(
              svgIconPath: AppIcons.instagram,
              platform: 'Instagram',
              detail: 'Akshay.syal96',
              onTap: () {},
            ),
            Divider(
              height: 2,
              color: colorScheme(context).onSurface.withOpacity(0.15),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Why to Connect Account?',
                    style: textTheme(context).bodyLarge?.copyWith(
                        color: colorScheme(context).onSurface,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _buildDescriptionText(
                      '• Connect to Phone is recommended to protect your Yeah! Live account'),
                  const SizedBox(height: 10),
                  _buildDescriptionText(
                      '• Your connected phone will be used to receive verification code when account setting changed'),
                  const SizedBox(height: 10),
                  _buildDescriptionText(
                      '• Once connected, you can easily log in Yeah! Live with any Connected Account from anywhere'),
                  const SizedBox(height: 10),
                  _buildDescriptionText(
                      '• You can set to show your social account to your profile'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountTile({
    required String svgIconPath,
    required String platform,
    required String detail,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.all(6),
      leading: SvgPicture.asset(
        svgIconPath,
        width: 24,
        height: 24,
      ),
      title: Text(platform,
          style: textTheme(context)
              .titleSmall
              ?.copyWith(color: colorScheme(context).onSurface)),
      trailing: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              detail,
              style: textTheme(context).labelMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                    color: colorScheme(context).onSurface.withOpacity(0.6),
                  ),
            ),
            Icon(Icons.arrow_forward_ios,
                size: 16,
                color: colorScheme(context).onSurface.withOpacity(0.5)),
          ],
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildDescriptionText(String text) {
    return Text(
      text,
      style: textTheme(context).labelMedium?.copyWith(
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
            color: colorScheme(context).onSurface.withOpacity(0.6),
          ),
    );
  }
}
