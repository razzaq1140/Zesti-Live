import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../common/const/app_images.dart';


class JobInterviewPerson extends StatefulWidget {
  const JobInterviewPerson({super.key});

  @override
  State<JobInterviewPerson> createState() => _JobInterviewPersonState();
}

class _JobInterviewPersonState extends State<JobInterviewPerson> {
  //use Dialogue
  void _showLeaveDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            // Blur Background
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.8),
              ),
            ),
            Center(
              child: Dialog(
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: SizedBox(
                  height: 350, // Customize height here
                  width: 300,
                  // Customize width here
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Title Text
                        const Text(
                          "Are you sure you\nwant to leave\n interview?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 4, // Title in three lines
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        // Subtitle Text
                        Text(
                          "Are you sure you want to leave\n Interview?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade300,
                          ),
                          maxLines: 2, // Subtitle in two lines
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 30),
                        Column(
                          children: [
                            // Cancel Button
                            SizedBox(
                              width: 260, // Customizable width
                              height: 50, // Customizable height
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        100), // Customizable border radius
                                  ),
                                ),
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            // Leave Button
                            SizedBox(
                              width: 260, // Customizable width
                              height: 50, // Customizable height
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  print("Leave button clicked");
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        100), // Customizable border radius
                                  ),
                                ),
                                child: const Text(
                                  "Leave",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Background Container
            Container(
              color: Colors.grey.shade200, // Background color
            ),
            Column(
              children: [
                // Top Bar
                Container(
                  color: Colors.grey.shade300,
                  height: height * 0.1,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: height * 0.06,
                        width: width * 0.12,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child:
                              const Icon(Icons.arrow_back, color: Colors.white),
                        ),
                      ),
                      const Text(
                        "Interview",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: _showLeaveDialog,
                        child: Container(
                          height: height * 0.06,
                          width: width * 0.12,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:
                              const Icon(Icons.more_horiz, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                // Placeholder for main content
                Container(
                  height: height * 0.5,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        'https://static.vecteezy.com/system/resources/previews/005/346/410/non_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //
                const SizedBox(height: 10),
                // Row of small cards
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // First Container with Cached Network Image
                    Container(
                      height: height * 0.18,
                      width: width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            'https://www.wallpapergeeks.com/wp-content/uploads/2014/03/Nature_107-800x600.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Other Containers
                    Container(
                      height: height * 0.18,
                      width: width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/900px-Cat03.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //
                    Container(
                      height: height * 0.18,
                      width: width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            'https://static.vecteezy.com/system/resources/previews/005/346/410/non_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //
                  ],
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
