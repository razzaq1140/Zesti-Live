import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/videolive/widgets/filter_widget_bottom_sheet.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:go_router/go_router.dart';

class SingleListIcons extends StatelessWidget {
  const SingleListIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            children: [
              _buildGridItem(Icons.cameraswitch_outlined, "Mirror", context,
                  onTap: () {}),
              _buildGridItem(Icons.face_3_outlined, "Beauty", context,
                  onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const FilterWidgetBottomSheet();
                  },
                );
              }),
              _buildGridItem(Icons.flash_on, "Flash", context, onTap: () {}),
              _buildGridItem(Icons.mic, "Microphone", context, onTap: () {}),
              _buildGridItem(Icons.insert_drive_file, "Introduction", context,
                  onTap: () {}),
              _buildGridItem(Icons.color_lens, "Atmosphere", context,
                  onTap: () {}),
              _buildGridItem(
                Icons.music_note,
                "Music",
                context,
                onTap: () {
                  context.pushNamed(AppRoute.musicListSelectall);
                },
              ),
              _buildGridItem(Icons.speaker_phone, "Speak mode", context,
                  onTap: () {}),
              _buildGridItem(Icons.crop, "Capture", context, onTap: () {}),
              _buildGridItem(Icons.share, "Share", context, onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(IconData icon, String label, BuildContext context,
      {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton.outlined(
            onPressed: onTap,
            icon: Icon(icon, size: 20, color: colorScheme(context).onSurface),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: textTheme(context).labelSmall?.copyWith(
                  letterSpacing: 0,
                  color: colorScheme(context).onSurface.withOpacity(0.5),
                ),
          ),
        ],
      ),
    );
  }
}
