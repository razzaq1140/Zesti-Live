import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  bool hideLocation = true;
  bool hideVideosNearby = true;
  bool hideSelfNearby = true;
  bool hideActiveTime = true;
  bool closeScreenshots = true;

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
              'Privacy',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildToggleTile('Hide Location', hideLocation, (bool value) {
              setState(() {
                hideLocation = value;
              });
            }),
            _buildDescription(
                "After turning this on, your location won’t appear in Profile or your LIVE notification"),
            _buildToggleTile('Hide your videos in Nearby', hideVideosNearby,
                (bool value) {
              setState(() {
                hideVideosNearby = value;
              });
            }),
            _buildDescription(
                "After turning this on, your video won’t appear in Nearby"),
            _buildToggleTile('Hide yourself in Nearby', hideSelfNearby,
                (bool value) {
              setState(() {
                hideSelfNearby = value;
              });
            }),
            _buildDescription(
                "After turning this on, you won’t appear in Nearby people"),
            _buildToggleTile('Hide your recent active time', hideActiveTime,
                (bool value) {
              setState(() {
                hideActiveTime = value;
              });
            }),
            _buildDescription(
                "After turning this on, others won’t see your recent active time"),
            _buildToggleTile('Close screenshots in Profile', closeScreenshots,
                (bool value) {
              setState(() {
                closeScreenshots = value;
              });
            }),
            _buildDescription(
                "After turning this on, others could not download or screenshot your photos in Profile"),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleTile(String title, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(
        title,
        style: textTheme(context)
            .titleSmall
            ?.copyWith(color: colorScheme(context).onSurface),
      ),
      value: value,
      onChanged: onChanged,
      thumbColor:
          WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        return Colors.white;
      }),
      trackOutlineColor:
          WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        return Colors.transparent;
      }),
      activeColor: Colors.white,
      activeTrackColor: colorScheme(context).primary,
      inactiveThumbColor: Colors.grey,
      inactiveTrackColor: Colors.grey.withOpacity(0.4),
    );
  }

  Widget _buildDescription(String description) {
    return Container(
      width: double.infinity,
      color: AppColor.surfaceGrey.withOpacity(0.5),
      padding: const EdgeInsets.only(left: 16, top: 7, bottom: 7),
      child: Text(
        description,
        style: textTheme(context).labelMedium?.copyWith(
            color: colorScheme(context).onSurface, letterSpacing: 0.25),
      ),
    );
  }
}
