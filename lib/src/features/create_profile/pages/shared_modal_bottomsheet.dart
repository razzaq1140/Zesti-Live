import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';

class ShareModalBottomSheet extends StatelessWidget {
  const ShareModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme(context).surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(AppImages.facebook),
                  ),
                  const Text('Facebook'),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(AppImages.twitter),
                  ),
                  const Text('Twitter'),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(AppImages.pintrest),
                  ),
                  const Text('Pintrest'),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(AppImages.youtube),
                  ),
                  const Text('Youtube'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
           const   Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(AppImages.snapchat),
                  ),
                  const Text('Snapchat'),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(AppImages.insta),
                  ),
                  const Text('Instagram'),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(AppImages.linkedin),
                  ),
                  const Text('Linkedin'),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor:
                        colorScheme(context).onSurface.withOpacity(0.5),
                    child: Icon(Icons.more_vert),
                  ),
                  const Text('Twitter'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
