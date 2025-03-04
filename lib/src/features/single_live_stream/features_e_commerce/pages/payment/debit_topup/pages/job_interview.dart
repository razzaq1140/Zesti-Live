import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../common/const/app_images.dart';
import '../../../../../../../router/go_route.dart';


class JobInterview extends StatefulWidget {
  const JobInterview({super.key});

  @override
  State<JobInterview> createState() => _JobInterviewState();
}

class _JobInterviewState extends State<JobInterview> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      'https://static.vecteezy.com/system/resources/previews/005/346/410/non_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: height * 0.06,
                          width: width * 0.12,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Text(
                        "Interview",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(AppRoute.jobInterviewPerson);
                        },
                        child: Container(
                          height: height * 0.06,
                          width: width * 0.12,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Bottom Icon Row
                Container(
                  height: height * 0.08,
                  width: width * 0.87,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildIconButton(AppIcons.interCamera, Colors.grey),
                        _buildIconButton(AppIcons.interCameraScnd, Colors.grey),
                        _buildIconButton(AppIcons.interVideo, Colors.grey),
                        _buildIconButton(AppIcons.interMic, Colors.grey),
                        _buildIconButton(AppIcons.interViewCall, Colors.red),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build icon buttons
  Widget _buildIconButton(String iconPath, Color color) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(
          iconPath,
          height: 20,
        ),
      ),
    );
  }
}
