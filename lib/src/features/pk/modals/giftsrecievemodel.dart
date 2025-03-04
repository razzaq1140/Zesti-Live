import 'package:flutter_application_zestilive/src/common/const/app_images.dart';

class GiftsReceived {
  final String imagepath;
  final String text;
  GiftsReceived({
    required this.imagepath,
    required this.text,
  });
}

List<GiftsReceived> giftsRecieved = [
  GiftsReceived(imagepath: AppImages.duckone, text: 'x1.3'),
  GiftsReceived(imagepath: AppImages.ducktwo, text: 'x2.3')
];
