// import 'package:flutter/material.dart';
// import 'package:flutter_application_zestilive/src/common/const/app_images.dart';

// import '../../../common/const/global_variables.dart';

// class SplashLogo extends StatefulWidget {
//   const SplashLogo({super.key});

//   @override
//   State<SplashLogo> createState() => _SplashLogoState();
// }

// class _SplashLogoState extends State<SplashLogo> {
//   bool _isAppReady = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadAppResources();
//   }

//   Future<void> _loadAppResources() async {
//     // Simulate loading resources (e.g., API calls, database initialization, etc.)
//     await Future.delayed(
//         const Duration(seconds: 4)); // Simulate resource loading time

//     // Once resources are loaded, set the flag to true
//     if (mounted) {
//       setState(() {
//         _isAppReady = true;
//       });

//       // Navigate to the next screen once app is ready
//   //   context.pushReplacementNamed(AppRoute.splashPage);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
// backgroundColor: colorScheme(context).primary,
//       body: Center(
//         child: Hero(
//           tag: 'logo',
// child: Image.asset(
//   AppImages.zestLogo,
//   width: 150,
//   height: 150,
// ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// import '../../../common/const/app_images.dart';

// class SplashLogo extends StatefulWidget {
//   const SplashLogo({super.key});

//   @override
//   State<SplashLogo> createState() => _SplashLogoState();
// }

// class _SplashLogoState extends State<SplashLogo> {
//   final List<String> _videoUrls = [
//     'https://assets.mixkit.co/videos/4830/4830-720.mp4',
//     'https://assets.mixkit.co/videos/5013/5013-720.mp4',
//     'https://assets.mixkit.co/videos/4994/4994-720.mp4',
//     'https://assets.mixkit.co/videos/4888/4888-720.mp4',
//   ];

//   late VideoPlayerController _videoController1;
//   late VideoPlayerController _videoController2;
//   late VideoPlayerController _videoController3;
//   late VideoPlayerController _videoController4;

//   @override
//   void initState() {
//     super.initState();

//     // Initialize video controllers
//     _videoController1 = VideoPlayerController.network(_videoUrls[0])
//       ..initialize().then((_) {
//         setState(() {});
//         _videoController1.setLooping(true);
//         _videoController1.play();
//       });

//     _videoController2 = VideoPlayerController.network(_videoUrls[1])
//       ..initialize().then((_) {
//         setState(() {});
//         _videoController2.setLooping(true);
//         _videoController2.play();
//       });

//     _videoController3 = VideoPlayerController.network(_videoUrls[2])
//       ..initialize().then((_) {
//         setState(() {});
//         _videoController3.setLooping(true);
//         _videoController3.play();
//       });

//     _videoController4 = VideoPlayerController.network(_videoUrls[3])
//       ..initialize().then((_) {
//         setState(() {});
//         _videoController4.setLooping(true);
//         _videoController4.play();
//       });
//   }

//   @override
//   void dispose() {
//     // Dispose video controllers
//     _videoController1.dispose();
//     _videoController2.dispose();
//     _videoController3.dispose();
//     _videoController4.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.red,
//       body: Stack(
//         children: [
//           // Video Circle 1 (Top Left, animating from left)
//           TweenAnimationBuilder<double>(
//             tween: Tween<double>(begin: -100, end: 10),
//             duration: const Duration(seconds: 2),
//             curve: Curves.easeInOut,
//             builder: (context, value, child) {
//               return Positioned(
//                 top: 100,
//                 left: value,
//                 child: child!,
//               );
//             },
//             child: VideoCircle(
//               videoController: _videoController1,
//               size: 50,
//             ),
//           ),

//           // Video Circle 2 (Middle Left, animating from left)
//           TweenAnimationBuilder<double>(
//             tween: Tween<double>(begin: -100, end: 67),
//             duration: const Duration(seconds: 2),
//             curve: Curves.easeInOut,
//             builder: (context, value, child) {
//               return Positioned(
//                 top: 250,
//                 left: value,
//                 child: child!,
//               );
//             },
//             child: VideoCircle(
//               videoController: _videoController2,
//               size: 50,
//             ),
//           ),

//           // Video Circle 3 (Top Right, animating from right)
//           TweenAnimationBuilder<double>(
//             tween: Tween<double>(begin: 500, end: 20),
//             duration: const Duration(seconds: 2),
//             curve: Curves.easeInOut,
//             builder: (context, value, child) {
//               return Positioned(
//                 top: 150,
//                 right: value,
//                 child: child!,
//               );
//             },
//             child: VideoCircle(
//               videoController: _videoController3,
//               size: 50,
//             ),
//           ),

//           // Video Circle 4 (Bottom Right, animating from right)
//           TweenAnimationBuilder<double>(
//             tween: Tween<double>(begin: 500, end: 78),
//             duration: const Duration(seconds: 2),
//             curve: Curves.easeInOut,
//             builder: (context, value, child) {
//               return Positioned(
//                 top: 500,
//                 right: value,
//                 child: child!,
//               );
//             },
//             child: VideoCircle(
//               videoController: _videoController4,
//               size: 50,
//             ),
//           ),

//           // Central Logo
//           Center(
//             child: Hero(
//               tag: 'logo',
              // child: Image.asset(
              //   AppImages.zestLogo,
//                 width: 150,
//                 height: 150,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class VideoCircle extends StatelessWidget {
//   final VideoPlayerController videoController;
//   final double size;

//   const VideoCircle({
//     Key? key,
//     required this.videoController,
//     required this.size,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ClipOval(
//       child: Container(
//         width: size,
//         height: size,
//         child: videoController.value.isInitialized
//             ? VideoPlayer(videoController)
//             : const CircularProgressIndicator(),
//       ),
//     );
//   }
// }

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../common/const/app_images.dart';

class SplashLogo extends StatefulWidget {
  const SplashLogo({super.key});

  @override
  State<SplashLogo> createState() => _SplashLogoState();
}

class _SplashLogoState extends State<SplashLogo> with TickerProviderStateMixin {
  final Random _random = Random();

  final List<String> _videoUrls = [
    'https://assets.mixkit.co/videos/4830/4830-720.mp4',
    'https://assets.mixkit.co/videos/4830/4830-720.mp4',
    'https://assets.mixkit.co/videos/4830/4830-720.mp4',
    'https://assets.mixkit.co/videos/4830/4830-720.mp4',
  ];

  late VideoPlayerController _videoController1;
  late VideoPlayerController _videoController2;
  late VideoPlayerController _videoController3;
  late VideoPlayerController _videoController4;

  @override
void initState() {
  super.initState();

  // Initialize video controllers
  _videoController1 = VideoPlayerController.networkUrl(Uri.parse(_videoUrls[0]))
    ..initialize().then((_) {
      setState(() {});
      _videoController1.setLooping(true);
      _videoController1.play();
    });

  _videoController2 = VideoPlayerController.networkUrl(Uri.parse(_videoUrls[1]))
    ..initialize().then((_) {
      setState(() {});
      _videoController2.setLooping(true);
      _videoController2.play();
    });

  _videoController3 = VideoPlayerController.networkUrl(Uri.parse(_videoUrls[2]))
    ..initialize().then((_) {
      setState(() {});
      _videoController3.setLooping(true);
      _videoController3.play();
    });

  _videoController4 = VideoPlayerController.networkUrl(Uri.parse(_videoUrls[3]))
    ..initialize().then((_) {
      setState(() {});
      _videoController4.setLooping(true);
      _videoController4.play();
    });
}

  @override
  void dispose() {
    // Dispose video controllers
    _videoController1.dispose();
    _videoController2.dispose();
    _videoController3.dispose();
    _videoController4.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        children: [
          // Video Circle 1 (Top Left, animating from left)
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: -100, end: 10), // From off-screen left
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            builder: (context, value, child) {
              return Positioned(
                top: 100,
                left: value,
                child: child!,
              );
            },
            child: VideoCircle(
              videoController: _videoController1,
              size: 50,
            ),
          ),

          // Video Circle 2 (Middle Left, animating from left)
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: -100, end: 67), // From off-screen left
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            builder: (context, value, child) {
              return Positioned(
                top: 250,
                left: value,
                child: child!,
              );
            },
            child: VideoCircle(
              videoController: _videoController2,
              size: 50,
            ),
          ),

          // Video Circle 3 (Top Right, animating from right)
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 500, end: 20), // From off-screen right
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            builder: (context, value, child) {
              return Positioned(
                top: 150,
                right: value,
                child: child!,
              );
            },
            child: VideoCircle(
              videoController: _videoController3,
              size: 50,
            ),
          ),

          // Video Circle 4 (Bottom Right, animating from right)
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 500, end: 78), // From off-screen right
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            builder: (context, value, child) {
              return Positioned(
                top: 500,
                right: value,
                child: child!,
              );
            },
            child: VideoCircle(
              videoController: _videoController4,
              size: 50,
            ),
          ),

          // Central Logo
          Center(
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                AppImages.zestLogo, // Replace with your logo image
                width: 150,
                height: 150,
              ),
            ),
          ),

          // Floating Animated Icons
          ...List.generate(20, (index) {
            // Randomly positioned and animated icons
            return FloatingIcon(
              startLeft: _random.nextDouble() * MediaQuery.of(context).size.width,
              startTop: _random.nextDouble() * 50 + MediaQuery.of(context).size.height / 2,
              icon: Icons.favorite, // Customize with your icons
              color: const Color.fromARGB(255, 255, 255, 82).withOpacity(0.7),
              size: 24 + _random.nextDouble() * 16, // Random size
              duration: Duration(seconds: 3 + _random.nextInt(3)), // Random duration
            );
          }),
        ],
      ),
    );
  }
}

class FloatingIcon extends StatefulWidget {
  final double startLeft;
  final double startTop;
  final IconData icon;
  final Color color;
  final double size;
  final Duration duration;

  const FloatingIcon({
    Key? key,
    required this.startLeft,
    required this.startTop,
    required this.icon,
    required this.color,
    required this.size,
    required this.duration,
  }) : super(key: key);

  @override
  State<FloatingIcon> createState() => _FloatingIconState();
}

class _FloatingIconState extends State<FloatingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _topPosition;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _opacity = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _topPosition = Tween<double>(begin: widget.startTop, end: widget.startTop - 100).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          left: widget.startLeft,
          top: _topPosition.value,
          child: Opacity(
            opacity: _opacity.value,
            child: Icon(
              widget.icon,
              size: widget.size,
              color: widget.color,
            ),
          ),
        );
      },
    );
  }
}

class VideoCircle extends StatelessWidget {
  final VideoPlayerController videoController;
  final double size;

  const VideoCircle({
    Key? key,
    required this.videoController,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: size,
        height: size,
        child: videoController.value.isInitialized
            ? VideoPlayer(videoController)
            : const CircularProgressIndicator(),
      ),
    );
  }
}
