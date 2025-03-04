import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../common/const/app_images.dart';
import '../../../router/go_route.dart';

class AnimatedDisc extends StatefulWidget {
  const AnimatedDisc({super.key});

  @override
  AnimatedDiscState createState() => AnimatedDiscState();
}

class AnimatedDiscState extends State<AnimatedDisc>
    with SingleTickerProviderStateMixin {
  late AnimationController _discController;

  @override
  void initState() {
    super.initState();
    _discController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..repeat();
  }

  @override
  void dispose() {
    _discController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
            left: 40,
            bottom: 0,
            child: FloatingNotesAnimation(),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _discController,
              builder: (context, child) => Transform.rotate(
                angle: _discController.value * 6.3,
                child: GestureDetector(
                  onTap: () => context.pushNamed(AppRoute.selectSoundScreen),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(AppImages.discSong),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FloatingNotesAnimation extends StatefulWidget {
  const FloatingNotesAnimation({super.key});

  @override
  FloatingNotesAnimationState createState() => FloatingNotesAnimationState();
}

class FloatingNotesAnimationState extends State<FloatingNotesAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();

    _animation1 = Tween<double>(begin: 0, end: -120).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.0, 0.4, curve: Curves.easeOut)),
    );

    _animation2 = Tween<double>(begin: 0, end: -120).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.2, 0.8, curve: Curves.easeOut)),
    );

    _animation3 = Tween<double>(begin: 0, end: -120).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.4, 1.0, curve: Curves.easeOut)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildNoteAnimation(Animation<double> animation, String note) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        double opacity = (1.0 - (animation.value / -120)).clamp(0.0, 1.0);
        return Transform.translate(
          offset: Offset(animation.value * 0.4, animation.value),
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: Text(
        note,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          buildNoteAnimation(_animation1, '🎵'),
          buildNoteAnimation(_animation2, '🎶'),
          buildNoteAnimation(_animation3, '🎼'),
        ],
      ),
    );
  }
}
