import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/post_section/pages/moment_screen/widgets/moment_post.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class MomentPage extends StatefulWidget {
  const MomentPage({super.key});

  @override
  State<MomentPage> createState() => _MomentPageState();
}

class _MomentPageState extends State<MomentPage> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _openCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      context.go('/${AppRoute.post}?image=${Uri.encodeComponent(image.path)}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colorScheme(context).primary,
        actions: [
          IconButton(
              onPressed: _openCamera,
              tooltip: 'Open Camera',
              icon: Icon(
                Icons.photo_camera_outlined,
                size: 20,
                color: colorScheme(context).onPrimary,
              )),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 20,
                color: colorScheme(context).onPrimary,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                size: 20,
                color: colorScheme(context).onPrimary,
              )),
        ],
      ),
      body: SingleChildScrollView(
          child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    onTap: () => context.pushNamed(AppRoute.post),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(AppImages.profilePhoto),
                    ),
                    title: Text("What's on your mind?",
                        style: textTheme(context).titleSmall?.copyWith(
                              color: AppColor.textGrey,
                            )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.83,
                    width: MediaQuery.of(context).size.width,
                    child: const MomentPostWidget(),
                  ),
                ],
              ))),
    );
  }
}
