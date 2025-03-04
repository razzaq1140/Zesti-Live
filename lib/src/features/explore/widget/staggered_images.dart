import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredImages extends StatelessWidget {
  final List<Map<String, dynamic>> images;

  const StaggeredImages({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 3,
      crossAxisSpacing: 3,
      itemCount: images.length,
      itemBuilder: (context, index) {
        final image = images[index];
        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: CachedNetworkImage(
                imageUrl: image['url'],
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            if (image['isLive'])
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    "LIVE HOUSE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
