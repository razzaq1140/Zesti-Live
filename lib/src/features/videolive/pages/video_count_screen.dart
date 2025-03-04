import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:go_router/go_router.dart';

class VideoLiveCountScreen extends StatefulWidget {
  const VideoLiveCountScreen({super.key});

  @override
  State<VideoLiveCountScreen> createState() => _VideoLiveCountScreenState();
}

class _VideoLiveCountScreenState extends State<VideoLiveCountScreen> {
  int _counter = 3;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      } else {
        _timer.cancel();
        context.pushReplacementNamed(AppRoute.singlelivebroadcaster);
      }
    });
  }

  @override
  void dispose() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(AppNetworkImages.networkOne),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Center(
              child: Text(
                '$_counter',
                style: textTheme(context).headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme(context).onPrimary,
                    fontSize: 60),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
