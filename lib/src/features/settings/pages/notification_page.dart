import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool newFans = true;
  bool recommendedBroadcasters = true;
  bool liveNotifications = true;

  List<BroadcasterModel> broadcasters = [
    BroadcasterModel(
        name: 'Jeanette King',
        imageUrl:
            'https://img.freepik.com/free-photo/young-beautiful-woman-pink-warm-sweater-natural-look-smiling-portrait-isolated-long-hair_285396-896.jpg',
        isNotified: true),
    BroadcasterModel(
        name: 'The King',
        imageUrl:
            'https://miro.medium.com/v2/resize:fit:1200/1*pHb0M9z_UMhO22HlaOl2zw.jpeg',
        isNotified: false),
    BroadcasterModel(
        name: 'Akshay Syal',
        imageUrl:
            'https://images.pexels.com/photos/1036623/pexels-photo-1036623.jpeg?cs=srgb&dl=pexels-moose-photos-170195-1036623.jpg&fm=jpg',
        isNotified: true),
    BroadcasterModel(
        name: 'Wendy Ford',
        imageUrl:
            'https://t4.ftcdn.net/jpg/03/17/72/03/360_F_317720355_sn87YEwDHHGMMYYmxiS3o3Hinkt1T3sB.jpg',
        isNotified: true),
    BroadcasterModel(
        name: 'Jeanette King',
        imageUrl:
            'https://img.freepik.com/free-photo/young-beautiful-woman-pink-warm-sweater-natural-look-smiling-portrait-isolated-long-hair_285396-896.jpg',
        isNotified: true),
    BroadcasterModel(
        name: 'The King',
        imageUrl:
            'https://miro.medium.com/v2/resize:fit:1200/1*pHb0M9z_UMhO22HlaOl2zw.jpeg',
        isNotified: false),
    BroadcasterModel(
        name: 'Akshay Syal',
        imageUrl:
            'https://images.pexels.com/photos/1036623/pexels-photo-1036623.jpeg?cs=srgb&dl=pexels-moose-photos-170195-1036623.jpg&fm=jpg',
        isNotified: true),
    BroadcasterModel(
        name: 'Wendy Ford',
        imageUrl:
            'https://t4.ftcdn.net/jpg/03/17/72/03/360_F_317720355_sn87YEwDHHGMMYYmxiS3o3Hinkt1T3sB.jpg',
        isNotified: true),
    BroadcasterModel(
        name: 'Jerfro Wind',
        imageUrl:
            'https://img.freepik.com/free-photo/stylish-handsome-indian-man-tshirt-pastel-wall_496169-1571.jpg',
        isNotified: false),
    BroadcasterModel(
        name: 'Jeanette King',
        imageUrl:
            'https://img.freepik.com/free-photo/young-beautiful-woman-pink-warm-sweater-natural-look-smiling-portrait-isolated-long-hair_285396-896.jpg',
        isNotified: true),
    BroadcasterModel(
        name: 'The King',
        imageUrl:
            'https://miro.medium.com/v2/resize:fit:1200/1*pHb0M9z_UMhO22HlaOl2zw.jpeg',
        isNotified: false),
    BroadcasterModel(
        name: 'Akshay Syal',
        imageUrl:
            'https://images.pexels.com/photos/1036623/pexels-photo-1036623.jpeg?cs=srgb&dl=pexels-moose-photos-170195-1036623.jpg&fm=jpg',
        isNotified: true),
    BroadcasterModel(
        name: 'Wendy Ford',
        imageUrl:
            'https://t4.ftcdn.net/jpg/03/17/72/03/360_F_317720355_sn87YEwDHHGMMYYmxiS3o3Hinkt1T3sB.jpg',
        isNotified: true),
    BroadcasterModel(
        name: 'Jeanette King',
        imageUrl:
            'https://img.freepik.com/free-photo/young-beautiful-woman-pink-warm-sweater-natural-look-smiling-portrait-isolated-long-hair_285396-896.jpg',
        isNotified: true),
    BroadcasterModel(
        name: 'The King',
        imageUrl:
            'https://miro.medium.com/v2/resize:fit:1200/1*pHb0M9z_UMhO22HlaOl2zw.jpeg',
        isNotified: false),
    BroadcasterModel(
        name: 'Akshay Syal',
        imageUrl:
            'https://images.pexels.com/photos/1036623/pexels-photo-1036623.jpeg?cs=srgb&dl=pexels-moose-photos-170195-1036623.jpg&fm=jpg',
        isNotified: true),
    BroadcasterModel(
        name: 'Wendy Ford',
        imageUrl:
            'https://t4.ftcdn.net/jpg/03/17/72/03/360_F_317720355_sn87YEwDHHGMMYYmxiS3o3Hinkt1T3sB.jpg',
        isNotified: true),
    BroadcasterModel(
        name: 'Jerfro Wind',
        imageUrl:
            'https://img.freepik.com/free-photo/stylish-handsome-indian-man-tshirt-pastel-wall_496169-1571.jpg',
        isNotified: false),
  ];
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
              'Notification',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Message Notification'),
            _buildToggleTile('New Fans', '', newFans, (bool value) {
              setState(() {
                newFans = value;
              });
            }),
            _buildNotificationInfo("Notifies when you have new fans"),
            _buildToggleTile(
                'Recommended broadcasters', '', recommendedBroadcasters,
                (bool value) {
              setState(() {
                recommendedBroadcasters = value;
              });
            }),
            _buildNotificationInfo("Recommended broadcasters you may like"),
            _buildToggleTile('Live Notification', '', liveNotifications,
                (bool value) {
              setState(() {
                liveNotifications = value;
              });
            }),
            _buildNotificationInfo("Turn on to get LIVE notifications"),
            const SizedBox(height: 30),
            SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: broadcasters.length,
                itemBuilder: (context, index) {
                  var broadcaster = broadcasters[index];
                  return _buildBroadcasterTile(
                    broadcaster.name,
                    broadcaster.imageUrl,
                    broadcaster.isNotified,
                    (bool value) {
                      setState(() {
                        broadcaster.isNotified = value;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationInfo(String text) {
    return Container(
      width: double.infinity,
      color: AppColor.surfaceGrey.withOpacity(0.5),
      padding: const EdgeInsets.only(left: 16, top: 7, bottom: 7),
      child: Text(
        text,
        style: textTheme(context).labelMedium?.copyWith(
            color: colorScheme(context).onSurface, letterSpacing: 0.25),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(19.0),
      child: Text(
        title,
        style: textTheme(context)
            .titleSmall
            ?.copyWith(color: colorScheme(context).onSurface),
      ),
    );
  }

  Widget _buildToggleTile(
      String title, String subtitle, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title, style: const TextStyle(fontSize: 16)),
      value: value,
      onChanged: onChanged,
      thumbColor:
          WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        return Colors.white;
      }),
      trackOutlineColor: WidgetStateProperty.resolveWith((states) {
        return states.contains(WidgetState.selected)
            ? Colors.transparent
            : Colors.transparent;
      }),
      activeColor: Colors.white,
      activeTrackColor: colorScheme(context).primary,
      inactiveThumbColor: Colors.grey,
      inactiveTrackColor: Colors.grey.withOpacity(0.4),
    );
  }

  Widget _buildBroadcasterTile(
      String name, String imageUrl, bool isNotified, Function(bool) onChanged) {
    return ListTile(
        contentPadding: const EdgeInsets.all(5),
        leading: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: 30,
                backgroundImage: imageProvider,
              ),
              placeholder: (context, url) => CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey[300],
                child: const CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => CircleAvatar(
                radius: 30,
                backgroundColor: AppColor.surfaceGrey,
                child: Icon(Icons.error, color: colorScheme(context).primary),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 13,
              child: Container(
                height: 15,
                width: 34,
                decoration: BoxDecoration(
                    color: AppColor.tagBlue,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.star,
                      color: colorScheme(context).surface,
                      size: 8,
                    ),
                    Text(
                      "68",
                      style: textTheme(context).labelSmall?.copyWith(
                          color: colorScheme(context).surface, fontSize: 8),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        title: Text(name, style: textTheme(context).titleSmall),
        trailing: Switch(
          value: isNotified,
          onChanged: onChanged,
          thumbColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            return Colors.white;
          }),
          trackOutlineColor: WidgetStateProperty.resolveWith((states) {
            return states.contains(WidgetState.selected)
                ? Colors.transparent
                : Colors.transparent;
          }),
          trackOutlineWidth: WidgetStateProperty.resolveWith<double?>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return 1.0;
            } else if (states.contains(WidgetState.selected)) {
              return 2.5;
            }
            return 1.5;
          }),
          activeColor: Colors.white,
          activeTrackColor: colorScheme(context).primary,
          inactiveThumbColor: Colors.grey,
          inactiveTrackColor: Colors.grey.withOpacity(0.4),
        ));
  }
}

class BroadcasterModel {
  String name;
  String imageUrl;
  bool isNotified;

  BroadcasterModel({
    required this.name,
    required this.imageUrl,
    required this.isNotified,
  });
}
