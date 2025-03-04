import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../common/const/app_colors.dart';
import '../../../common/const/app_images.dart';
import '../../../common/const/global_variables.dart';
import '../provider/edit_profile_provider.dart';

class EditProfileHeader extends StatelessWidget {
  const EditProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EditProfileProvider>(
      builder: (context, provider, _) {
        return Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showImageSourceDialog(
                      context,
                      provider.pickBackgroundImageFromCamera,
                      provider.pickBackgroundImageFromGallery,
                    );
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        child: Image(
                          height: 200,
                          width: double.infinity,
                          image: provider.backgroundImage != null
                              ? FileImage(provider.backgroundImage!)
                              : const NetworkImage(
                                      AppNetworkImages.networkThree)
                                  as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 10,
                  left: 10,
                  child: AppBar(
                    scrolledUnderElevation: 0,
                    leadingWidth: 20,
                    centerTitle: false,
                    backgroundColor: Colors.transparent,
                    leading: IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: colorScheme(context).onPrimary,
                      ),
                    ),
                    title: Text(
                      'Edit',
                      style: textTheme(context)
                          .titleSmall
                          ?.copyWith(color: colorScheme(context).onPrimary),
                    ),
                    actions: [
                      GestureDetector(
                        onTap: () {
                          showImageSourceDialog(
                            context,
                            provider.pickBackgroundImageFromCamera,
                            provider.pickBackgroundImageFromGallery,
                          );
                        },
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: AppColor.tagBlue,
                          child: const Icon(
                            Icons.camera_alt,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: provider.profileImage != null
                            ? FileImage(provider.profileImage!)
                            : const NetworkImage(AppNetworkImages.networkTwo)
                                as ImageProvider,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            showImageSourceDialog(
                              context,
                              provider.pickProfileImageFromCamera,
                              provider.pickProfileImageFromGallery,
                            );
                          },
                          child: const CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.camera_alt,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Click to change or delete photo. Drag photo to change order.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }

  void showImageSourceDialog(
      BuildContext context, Function onCamera, Function onGallery) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Take a photo'),
                onTap: () {
                  Navigator.of(context).pop();
                  onCamera();
                },
              ),
              ListTile(
                title: const Text('Choose from album'),
                onTap: () {
                  Navigator.of(context).pop();
                  onGallery();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
