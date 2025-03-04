import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/home/provider/sound_video_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:intl/intl.dart';

class SelectSoundScreen extends StatefulWidget {
  const SelectSoundScreen({super.key});

  @override
  State<SelectSoundScreen> createState() => _SelectSoundScreenState();
}

class _SelectSoundScreenState extends State<SelectSoundScreen> {
  final List<String> videoUrls = List.generate(
      30,
      (index) =>
          "https://cdn.pixabay.com/video/2017/01/12/7249-199191048_large.mp4");

  final List<String> thumbnails =
      List.generate(30, (index) => AppImages.allPopularScreen);

  @override
  Widget build(BuildContext context) {
    final videoProvider = Provider.of<SoundVideoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: colorScheme(context).onSurface),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bookmark_border,
                color: colorScheme(context).onSurface),
          ),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(AppIcons.blackShareIcon),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: AppImages.allPopularScreen,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Gangsta\'s Paradise",
                          style: textTheme(context).headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: colorScheme(context).onSurface,
                              ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Sound from video",
                          style: textTheme(context).labelLarge?.copyWith(
                                fontSize: 13,
                                color: colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.5),
                              ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "${NumberFormat.compact().format(2200000)} videos",
                          style: textTheme(context).labelLarge?.copyWith(
                                fontSize: 13,
                                color: colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.5),
                              ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: thumbnails.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        videoProvider.selectVideo(videoUrls[index]);
                        String? audioPath =
                            await videoProvider.extractAudioFromVideo();

                        if (audioPath != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text('Audio extracted from video $index')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Failed to extract audio')),
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: colorScheme(context).surface),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: thumbnails[index],
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    if (videoProvider.selectedVideoUrl != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                'Sound will be applied from selected video.')),
                      );
                    }
                  },
                  icon: Icon(Icons.videocam,
                      color: colorScheme(context).onPrimary),
                  label: Text(
                    'Use this sound',
                    style: textTheme(context).titleSmall?.copyWith(
                          color: colorScheme(context).onPrimary,
                        ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme(context).primary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
