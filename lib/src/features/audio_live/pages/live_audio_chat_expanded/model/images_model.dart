import 'package:flutter_application_zestilive/src/common/const/app_images.dart';

class ImagesModel {
  final String? image;
  final bool? isSvg;

  ImagesModel({required this.image, required this.isSvg});
}

// Sample List with both profile and SVG images
final List<ImagesModel> images = [
  ImagesModel(image: AppImages.profilePhoto, isSvg: false),
  ImagesModel(image: AppIcons.add, isSvg: true),
  ImagesModel(image: AppIcons.add, isSvg: true),
  ImagesModel(image: AppIcons.add, isSvg: true),
  ImagesModel(image: AppIcons.add, isSvg: true),
  ImagesModel(image: AppIcons.add, isSvg: true),
  ImagesModel(image: AppIcons.add, isSvg: true),
  ImagesModel(image: AppIcons.add, isSvg: true),
];
