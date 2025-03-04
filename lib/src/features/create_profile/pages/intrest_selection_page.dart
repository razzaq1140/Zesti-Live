import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/features/create_profile/provider/select_intrest_provider.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';


// class InterestSelectionPage extends StatelessWidget {
//   const InterestSelectionPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final interestProvider = Provider.of<InterestSelectionProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           style: IconButton.styleFrom(padding: EdgeInsets.all(0)),
//           onPressed: () {
//             context.pop();
//           },
//           icon: const Icon(Icons.arrow_back),
//         ),
//         scrolledUnderElevation: 0,
//         actions: [
//           GestureDetector(
//             onTap: () {
//               context.pushReplacementNamed(AppRoute.bottomNavigationBarScreen);
//             },
//             child: Padding(
//               padding: const EdgeInsets.all(8),
//               child: Row(
//                 children: [
//                   Text(
//                     'Skip',
//                     style: textTheme(context).titleSmall?.copyWith(
//                         fontWeight: FontWeight.w600,
//                         color: colorScheme(context).onSurface),
//                   ),
//                   const Icon(Icons.keyboard_double_arrow_right),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Select your interests',
//               style: textTheme(context).headlineMedium?.copyWith(
//                   fontSize: 24,
//                   color: colorScheme(context).onSurface,
//                   fontWeight: FontWeight.w700),
//             ),
//             const SizedBox(height: 6),
//             Text(
//               'Enhance your video recommendations.',
//               style: textTheme(context).titleSmall?.copyWith(
//                   color: colorScheme(context).onSurface.withOpacity(0.4)),
//             ),
//             const SizedBox(height: 20),
//             Wrap(
//               spacing: 8.0,
//               runSpacing: 8.0,
//               children: interestProvider.interests.map((interest) {
//                 final isSelected =
//                     interestProvider.isInterestSelected(interest);
//                 return GestureDetector(
//                   onTap: () {
//                     interestProvider.toggleInterest(interest);
//                   },
//                   child: Chip(
//                     visualDensity: null,
//                     label: Text(
//                       interest,
//                       style: textTheme(context).bodyLarge?.copyWith(
//                             color: isSelected
//                                 ? colorScheme(context).primary
//                                 : colorScheme(context)
//                                     .onSurface
//                                     .withOpacity(0.8),
//                           ),
//                     ),
//                     backgroundColor: Colors.transparent,
//                     shape: StadiumBorder(
//                       side: BorderSide(
//                         color: isSelected
//                             ? colorScheme(context).primary
//                             : colorScheme(context).onSurface.withOpacity(0.1),
//                         width: 1,
//                       ),
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ),
//             const SizedBox(
//               height: 100,
//             )
//           ],
//         ),
//       ),
//       bottomSheet: Container(
//         padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
//         child: CustomButton(
//           width: double.infinity,
//           buttonText: 'Done',
//           onPressed: () {
//             context.pushReplacementNamed(AppRoute.bottomNavigationBarScreen);
//           },
//         ),
//       ),
//     );
//   }
// }
class InterestSelectionPage extends StatelessWidget {
  const InterestSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final interestProvider = Provider.of<InterestSelectionProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        scrolledUnderElevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              context.pushReplacementNamed(AppRoute.bottomNavigationBarScreen);
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Text(
                    'Skip',
                    style: textTheme(context).titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme(context).onSurface,
                        ),
                  ),
                  const Icon(Icons.keyboard_double_arrow_right),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select your interests',
              style: textTheme(context).headlineMedium?.copyWith(
                    fontSize: 24,
                    color: colorScheme(context).onSurface,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 6),
            Text(
              'Enhance your video recommendations.',
              style: textTheme(context).titleSmall?.copyWith(
                    color: colorScheme(context).onSurface.withOpacity(0.4),
                  ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                itemCount: interestProvider.interests.length,
                itemBuilder: (context, index) {
                  final interest = interestProvider.interests[index];
                  final isSelected =
                      interestProvider.isInterestSelected(interest);

                  return GestureDetector(
                    onTap: () {
                      interestProvider.toggleInterest(interest);
                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: SizedBox(
                            height: index % 2 == 0 ? 200 : 150,
                            child: VideoCard(videoUrl: interest.videoUrl),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: isSelected
                                ? colorScheme(context).primary
                                : Colors.grey.shade300,
                            child: isSelected
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 16,
                                  )
                                : null,
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 8,
                          child: Text(
                            interest.name,
                            style: textTheme(context).bodyLarge?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        child: CustomButton(
          width: double.infinity,
          buttonText: 'Done',
          onPressed: () {
            context.pushReplacementNamed(AppRoute.bottomNavigationBarScreen);
          },
        ),
      ),
    );
  }
}
class VideoCard extends StatefulWidget {
  final String videoUrl;

  const VideoCard({required this.videoUrl, Key? key}) : super(key: key);

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() {
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        // Ensure the video loops and starts automatically
        _controller.setLooping(true);
        _controller.play();
        setState(() {});
      }).catchError((error) {
        debugPrint('Error initializing video: $error');
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the video controller properly
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
