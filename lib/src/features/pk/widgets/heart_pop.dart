import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';

class HeartPopWidget extends StatefulWidget {
  const HeartPopWidget({super.key});

  @override
  State<HeartPopWidget> createState() => HeartPopWidgetState();
}

class HeartPopWidgetState extends State<HeartPopWidget>
    with TickerProviderStateMixin {
  late AnimationController _heartPopController;

  @override
  void initState() {
    super.initState();
    _heartPopController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _heartPopController.dispose();
    super.dispose();
  }

  // Method to play the animation
  void playAnimation() {
    _heartPopController.reset();
    _heartPopController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AppAnimations.heartPop,
      controller: _heartPopController,
      fit: BoxFit.fill,
      repeat: false,
      onLoaded: (composition) {
        _heartPopController.duration = composition.duration;
      },
    );
  }
}

class StartAnimationButton extends StatelessWidget {
  final VoidCallback onPressed;

  const StartAnimationButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(AppIcons.heartAnimationIcon),
      iconSize: 40,
    );
  }
}

// class HeartPopScreen extends StatelessWidget {
//   HeartPopScreen({super.key});

//   // Use a GlobalKey to access the HeartPopWidget's state
//   final GlobalKey<_HeartPopWidgetState> heartPopKey = GlobalKey<_HeartPopWidgetState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Heart Animation Screen")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Instantiate HeartPopWidget with the GlobalKey
//             HeartPopWidget(key: heartPopKey),
//             const SizedBox(height: 20),
//             // Button that starts the animation when pressed
//             StartAnimationButton(
//               onPressed: () {
//                 heartPopKey.currentState?.playAnimation(); // Trigger animation
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
