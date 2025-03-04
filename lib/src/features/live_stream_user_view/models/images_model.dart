import 'package:flutter_application_zestilive/src/common/const/app_images.dart';

class UserImagesModel {
  final String? image;
  final bool? isSvg;

  UserImagesModel({required this.image, required this.isSvg});
}

// Sample List with both profile and SVG images
final List<UserImagesModel> userimages = [
  UserImagesModel(image: AppImages.profilePhoto, isSvg: false),
  UserImagesModel(image: AppIcons.add, isSvg: true),
  UserImagesModel(image: AppIcons.add, isSvg: true),
  UserImagesModel(image: AppIcons.add, isSvg: true),
  UserImagesModel(image: AppIcons.add, isSvg: true),
  UserImagesModel(image: AppIcons.add, isSvg: true),
  UserImagesModel(image: AppIcons.add, isSvg: true),
  UserImagesModel(image: AppIcons.add, isSvg: true),
];
