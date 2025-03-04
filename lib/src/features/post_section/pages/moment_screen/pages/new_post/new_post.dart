import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_textfield.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/model/moments_model.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/provider/profile_controller.dart';
import 'package:flutter_application_zestilive/src/features/post_section/pages/moment_screen/pages/add_location/add_location_screen.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class NewPostScreen extends StatefulWidget {
  final String? image;
  const NewPostScreen({super.key, required this.image});

  @override
  NewPostScreenState createState() => NewPostScreenState();
}

class NewPostScreenState extends State<NewPostScreen> {
  bool button1 = false;
  bool button2 = false;
  bool button3 = false;
  bool isBold = false;
  bool isItalic = false;
  bool isUnderlined = false;
  bool containerShow = false;
  XFile? _selectedImage;
  String privacyOption = "Public";
  String? selectedLocation;
  final ImagePicker _picker = ImagePicker();
  TextEditingController textController = TextEditingController();
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = image;
    });
  }

  Future<void> _navigateAndSelectPrivacy(BuildContext context) async {
    final result =
        await context.pushNamed(AppRoute.privacyscreen, extra: privacyOption);
    if (result != null && result is String) {
      setState(() {
        privacyOption = result;
      });
    }
  }

  Future<void> _navigateAndSelectLocation(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddLocationScreen()),
    );

    if (result != null && result is String) {
      setState(() {
        selectedLocation = result;
      });
    }
  }

  IconData getPrivacyIcon() {
    switch (privacyOption) {
      case 'Friends':
        return Icons.people;
      case 'Only Me':
        return Icons.lock;
      case 'Public':
      default:
        return Icons.public;
    }
  }

  
  @override
  Widget build(BuildContext context) {
    final profileController = Provider.of<ProfileController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme(context).primary,
        iconTheme: IconThemeData(color: colorScheme(context).onPrimary),
        title: Text(
          "New Post",
          style: textTheme(context).titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme(context).onPrimary),
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - kToolbarHeight,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  CustomTextFormField(
                    controller: textController,
                    maxline: 4,
                    textStyle: textTheme(context).bodyMedium?.copyWith(
                      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
                      decoration: isUnderlined ? TextDecoration.underline : TextDecoration.none,
                    ),
                    customDecoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Write a caption...",
                      hintStyle: textTheme(context).bodyMedium?.copyWith(color: AppColor.greyText),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.format_bold),
                        color: isBold ? AppColor.tagBlue : colorScheme(context).onSurface,
                        onPressed: () {
                          setState(() {
                            isBold = !isBold;
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.format_italic),
                        color: isItalic ? AppColor.tagBlue : colorScheme(context).onSurface,
                        onPressed: () {
                          setState(() {
                            isItalic = !isItalic;
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.format_underline),
                        color: isUnderlined ? AppColor.tagBlue : colorScheme(context).onSurface,
                        onPressed: () {
                          setState(() {
                            isUnderlined = !isUnderlined;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      _navigateAndSelectPrivacy(context);
                    },
                    child: Row(
                      children: [
                        Icon(getPrivacyIcon()),
                        const SizedBox(width: 8.0),
                        Text(privacyOption),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios, size: 14.0),
                      ],
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 10),
                  containerShow == true
                      ? GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      height: 150,
                      color: Colors.grey[300],
                      child: (_selectedImage == null && widget.image == null)
                          ? const Center(child: Icon(Icons.add_a_photo, size: 40.0))
                          : Row(
                        children: [
                          Image.file(
                            File(_selectedImage?.path ?? widget.image!),
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 15.0),
                          const Icon(Icons.add_a_photo, size: 40.0),
                        ],
                      ),
                    ),
                  )
                      : const SizedBox(),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        containerShow = !containerShow;
                      });
                    },
                    child: Text(
                      "Add Photo/Video",
                      style: textTheme(context).bodySmall?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      _navigateAndSelectLocation(context);
                    },
                    child: selectedLocation == null
                        ? Text(
                      "Add Location",
                      style: textTheme(context).bodySmall?.copyWith(fontWeight: FontWeight.bold),
                    )
                        : Row(
                      children: [
                        Icon(Icons.location_on, color: colorScheme(context).primary),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                selectedLocation!.split('\n')[0],
                                style: textTheme(context).bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                selectedLocation!.split('\n')[1],
                                style: textTheme(context).bodySmall?.copyWith(
                                  color: AppColor.textGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.close, size: 17, color: AppColor.textGrey),
                          onPressed: () {
                            setState(() {
                              selectedLocation = null;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Also Post to Facebook",
                      style: textTheme(context).bodySmall?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    value: button1,
                    onChanged: (bool value) {
                      setState(() {
                        button1 = !button1;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Also Post to Twitter",
                      style: textTheme(context).bodySmall?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    value: button2,
                    onChanged: (bool value) {
                      setState(() {
                        button2 = !button2;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Also Post to Instagram",
                      style: textTheme(context).bodySmall?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    value: button3,
                    onChanged: (bool value) {
                      setState(() {
                        button3 = !button3;
                      });

                    },
                  ),
                  const Spacer(),
                  CustomButton(
                    buttonText: "Submit",
                    onPressed: () {
                      // Check if no image is selected
                      if (_selectedImage == null && widget.image == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please select an image.')),
                        );
                        return; // Prevent further action and don't navigate back
                      }

                      // Check if the description is empty
                      if (textController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please provide a description.')),
                        );
                        return; // Prevent further action and don't navigate back
                      }

                      // If everything is valid, navigate back and submit the post
                      context.pop();  // Only if everything is valid

                      // You can add the moment here:
                      // profileController.addMoment(Moment(
                      //   authorName: 'Your Name',
                      //   location: selectedLocation ?? 'Unknown Location',
                      //   profileImage: 'assets/images/addTask.png',
                      //   postImage: _selectedImage?.path ?? widget.image!,
                      //   caption: textController.text,
                      //   isExpanded: false,
                      //   likes: 0,
                      //   commentCount: 0,
                      //   timepassed: 'Just now',
                      // ));
                      // Navigator.pop(context);
                    },
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
