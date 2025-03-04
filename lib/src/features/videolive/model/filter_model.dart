import 'package:flutter_application_zestilive/src/common/const/app_images.dart';

class FilterModel {
  String? image;
  String? text;
  String? text2;
  FilterModel({required this.image, required this.text, required this.text2});
}

List<FilterModel> filterList = [
  FilterModel(image: AppImages.filter1, text: "None", text2: 'Recent'),
  FilterModel(image: AppImages.filter1, text: "HDR", text2: 'Simple'),
  FilterModel(image: AppImages.filter1, text: "Noise", text2: 'FX'),
  FilterModel(image: AppImages.filter1, text: "Sharpen", text2: 'B&W'),
  FilterModel(image: AppImages.filter1, text: "Glitch", text2: 'Blur')
];
