import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/home/modals/notification_live_modal.dart';
import 'package:music_visualizer/music_visualizer.dart';

class LiveUserWidget extends StatefulWidget {
  final LiveUser liveUser;

  const LiveUserWidget({Key? key, required this.liveUser}) : super(key: key);

  @override
  State<LiveUserWidget> createState() => _LiveUserWidgetState();
}

class _LiveUserWidgetState extends State<LiveUserWidget> {
  final List<Color> colors = [
    AppColor.greyText.withOpacity(0.6),
    AppColor.greyText.withOpacity(0.6),
    AppColor.greyText.withOpacity(0.6),
    AppColor.greyText.withOpacity(0.6),
  ];

  final List<int> duration = [900, 700, 600, 800, 500];

// final List<int> duration = [300, 500, 700, 900, 700, 500, 300];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Side: Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 92,
              width: 82,
              decoration: BoxDecoration(
                color: colorScheme(context).primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.network(
                widget.liveUser.image,
                fit: BoxFit.fill,
              ),
            ),
          ),

          SizedBox(width: 12), // Spacing between the image and the column

          // Center: Column with title and subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.liveUser.name,
                  style: textTheme(context).bodyMedium?.copyWith(
                      color: colorScheme(context).outline,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                    height:
                        4), // Spacing between name and location/recommendation

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: colorScheme(context)
                          .outline
                          .withOpacity(0.5), // Contrast color
                      size: 18,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      widget.liveUser.location,
                      style: textTheme(context).bodyMedium?.copyWith(
                          color: colorScheme(context)
                              .outline
                              .withOpacity(0.6), // Contrast color
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),

                SizedBox(
                  height: 12,
                ),

                if (widget.liveUser.isRecommended)
                  Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color:
                                colorScheme(context).outline.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage(widget.liveUser.imagetwo),
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Recommended by",
                                style: textTheme(context).bodyMedium?.copyWith(
                                    color: colorScheme(context)
                                        .outline
                                        .withOpacity(0.3), // Contrast color
                                    fontSize: 9,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "${widget.liveUser.recommendedByName}",
                                style: textTheme(context).bodyMedium?.copyWith(
                                    color: colorScheme(context).outline,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  )
                else if (widget.liveUser.isWaveVisible)
                  Container(
                    height: 40,
                    width: double.infinity,
                    child: MusicVisualizer(
                      barCount: 40,
                      colors: colors,
                      duration: duration,
                    ),
                  ),
              ],
            ),
          ),
          Column(
            children: [
              Icon(
                widget.liveUser.isRecommended
                    ? Icons.volume_up
                    : Icons.camera_alt,
                color: colorScheme(context).outline.withOpacity(0.5),
                size: 18,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                widget.liveUser.time,
                style: textTheme(context).bodyMedium?.copyWith(
                    color: colorScheme(context)
                        .outline
                        .withOpacity(0.6), // Contrast color
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
