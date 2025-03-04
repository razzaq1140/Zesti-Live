import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';

class BlockedListPage extends StatefulWidget {
  const BlockedListPage({super.key});

  @override
  State<BlockedListPage> createState() => _BlockedListPageState();
}

class _BlockedListPageState extends State<BlockedListPage> {
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
                'Blocked List',
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
            padding: const EdgeInsets.all(5),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBroadcasterTile(
                    'https://img.freepik.com/free-photo/stylish-handsome-indian-man-tshirt-pastel-wall_496169-1571.jpg',
                    'Ralph Jones',
                    '46543216786',
                    (p0) {},
                  ),
                  Divider(
                    height: 2,
                    color: colorScheme(context).onSurface.withOpacity(0.15),
                  ),
                  _buildBroadcasterTile(
                    'https://static.vecteezy.com/system/resources/thumbnails/005/346/410/small_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
                    'Ragali Jones',
                    '46543216786',
                    (p0) {},
                  ),
                  Divider(
                    height: 2,
                    color: colorScheme(context).onSurface.withOpacity(0.15),
                  ),
                  _buildBroadcasterTile(
                    'https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg',
                    'Ronald Jones',
                    '46543216786',
                    (p0) {},
                  ),
                  Divider(
                    height: 2,
                    color: colorScheme(context).onSurface.withOpacity(0.15),
                  ),
                  _buildBroadcasterTile(
                    'https://img.freepik.com/free-photo/stylish-handsome-indian-man-tshirt-pastel-wall_496169-1571.jpg',
                    'Ralph Jones',
                    '46543216786',
                    (p0) {},
                  ),
                  Divider(
                    height: 2,
                    color: colorScheme(context).onSurface.withOpacity(0.15),
                  ),
                  _buildBroadcasterTile(
                    'https://static.vecteezy.com/system/resources/thumbnails/005/346/410/small_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
                    'Ragali Jones',
                    '46543216786',
                    (p0) {},
                  ),
                  Divider(
                    height: 2,
                    color: colorScheme(context).onSurface.withOpacity(0.15),
                  ),
                  _buildBroadcasterTile(
                    'https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg',
                    'Ronald Jones',
                    '46543216786',
                    (p0) {},
                  ),
                  Divider(
                    height: 2,
                    color: colorScheme(context).onSurface.withOpacity(0.15),
                  ),
                ])));
  }

  Widget _buildBroadcasterTile(
      String imageUrl, String name, String number, Function(bool) onChanged) {
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
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.error, color: Colors.red),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 13,
            child: Container(
              height: 15,
              width: 34,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
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
      title: Text(name, style: const TextStyle(fontSize: 16)),
      subtitle: Text(number, style: const TextStyle(fontSize: 16)),
      trailing: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  "Are you sure to remove he/she from your blocklist?",
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
                          "Cancel",
                          style: textTheme(context)
                              .bodyLarge
                              ?.copyWith(color: colorScheme(context).primary),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text(
                          "Remove",
                          style: textTheme(context)
                              .bodyLarge
                              ?.copyWith(color: colorScheme(context).primary),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  )
                ],
              );
            },
          );
        },
        child: Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              border: Border.all(
                color: colorScheme(context).onSurface.withOpacity(
                      0.3,
                    ),
              ),
              shape: BoxShape.circle),
          child: Icon(
            Icons.remove,
            color: colorScheme(context).onSurface.withOpacity(
                  0.3,
                ),
            size: 20,
          ),
        ),
      ),
    );
  }
}
