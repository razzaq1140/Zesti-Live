import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class NewEcommmerceProfilePage extends StatefulWidget {
  const NewEcommmerceProfilePage({super.key});

  @override
  State<NewEcommmerceProfilePage> createState() =>
      _NewEcommmerceProfilePageState();
}

class _NewEcommmerceProfilePageState extends State<NewEcommmerceProfilePage> {
  XFile? _imageFile;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? selectedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    if (selectedImage != null) {
      setState(() {
        _imageFile = selectedImage;
      });
    }
  }

  Future<void> _takePhoto() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? takenImage =
        await _picker.pickImage(source: ImageSource.camera);

    if (takenImage != null) {
      setState(() {
        _imageFile = takenImage;
      });
    }
  }

  void _showImageSourceSelection() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(
                  Icons.camera_alt,
                  color: colorScheme(context).outline.withOpacity(0.6),
                ),
                title: Text('Open Camera'),
                onTap: () {
                  Navigator.pop(context);
                  _takePhoto();
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.photo_library,
                  color: colorScheme(context).outline.withOpacity(0.6),
                ),
                title: Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage();
                },
              ),
              ListTile(
                leading: Icon(Icons.delete,
                    color: colorScheme(context).outline.withOpacity(0.6)),
                title: Text('Delete Image'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _imageFile = null;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16, right: 16, bottom: 92),
                child: Column(children: [
                  SizedBox(
                    height: 100,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 120, // Adjust this size as needed
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColor.greyText.withOpacity(0.6),
                            width: 3.0,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: colorScheme(context).surface,
                          radius: 50,
                          backgroundImage: _imageFile != null
                              ? FileImage(File(_imageFile!.path))
                              : null, // If there's no image file, set it to null
                          child: _imageFile == null
                              ? Text(
                                  "Pick Image",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: colorScheme(context)
                                          .outline
                                          .withOpacity(0.4)),
                                )
                              : null, // If there's an image, don't show the icon
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 0,
                        left: 90,
                        child: InkWell(
                          onTap: _showImageSourceSelection,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: AppColor.greyText,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.edit, // Edit icon
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Kylie",
                    style: textTheme(context).bodySmall?.copyWith(
                          fontSize: 18,
                          color: colorScheme(context)
                              .outline
                              .withOpacity(0.6), // Visible color
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Kylie_04@gmail.com",
                    style: textTheme(context).bodySmall?.copyWith(
                          fontSize: 12,
                          color: colorScheme(context)
                              .outline
                              .withOpacity(0.6), // Visible color
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CustomContainer(
                    ontap: () {},
                    imagePath: AppIcons.account,
                    text: 'Account',
                  ),
                  CustomContainer(
                    ontap: () {},
                    imagePath: AppIcons.location,
                    text: 'My Address',
                  ),
                  CustomContainer(
                    ontap: () {},
                    imagePath: AppIcons.orderSvg,
                    text: 'My Order',
                  ),
                  CustomContainer(
                    ontap: () {},
                    imagePath: AppIcons.heartsvg,
                    text: 'My Favourites',
                  ),
                  CustomContainer(
                    ontap: () {},
                    imagePath: AppIcons.payment,
                    text: 'Payment',
                  ),
                  CustomContainer(
                    ontap: () {},
                    imagePath: AppIcons.settingSvg,
                    text: 'Settings',
                  )
                ]))));
  }
}

class CustomContainer extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback ontap;

  const CustomContainer(
      {Key? key,
      required this.imagePath,
      required this.text,
      required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  imagePath,
                  width: 24,
                  height: 24,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 24,
                ),
                Text(
                  text,
                  style: textTheme(context).bodySmall?.copyWith(
                        fontSize: 14,
                        color: colorScheme(context)
                            .outline
                            .withOpacity(0.7), // Visible color
                        fontWeight: FontWeight.w700,
                      ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
