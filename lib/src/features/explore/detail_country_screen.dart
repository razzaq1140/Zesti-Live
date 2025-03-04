import 'package:flutter/material.dart';
import '../../common/const/global_variables.dart';
import 'widget/staggered_images.dart';

class DetailCountryScreen extends StatelessWidget {
  final String countryName;
  const DetailCountryScreen({super.key, required this.countryName});

  final List<Map<String, dynamic>> images = const [
    {
      "url":
          'https://images.pexels.com/photos/1386604/pexels-photo-1386604.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      "isLive": true,
    },
    {
      "url":
          'https://static.vecteezy.com/system/resources/previews/005/346/410/non_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
      "isLive": false,
    },
    {
      "url":
          'https://images.pexels.com/photos/1386604/pexels-photo-1386604.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      "isLive": false,
    },
    {
      "url":
          'https://static.vecteezy.com/system/resources/previews/005/346/410/non_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
      "isLive": false,
    },
    {
      "url":
          'https://images.pexels.com/photos/1386604/pexels-photo-1386604.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      "isLive": false,
    },
    {
      "url":
          'https://static.vecteezy.com/system/resources/previews/005/346/410/non_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
      "isLive": false,
    },
    {
      "url":
          'https://static.vecteezy.com/system/resources/previews/005/346/410/non_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
      "isLive": true,
    },
    {
      "url":
          'https://static.vecteezy.com/system/resources/previews/005/346/410/non_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
      "isLive": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          // "India",
          countryName,
          style: TextStyle(
              color: colorScheme(context).surface,
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
        backgroundColor: colorScheme(context).error,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: colorScheme(context).surface,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(padding: EdgeInsets.zero, 
      child: StaggeredImages(images: images),
          ),
    );
  }
}
