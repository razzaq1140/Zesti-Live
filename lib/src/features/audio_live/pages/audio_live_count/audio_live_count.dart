import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:go_router/go_router.dart';

class AudioLiveCount extends StatefulWidget {
  const AudioLiveCount({super.key});

  @override
  State<AudioLiveCount> createState() => _AudioLiveCountState();
}

class _AudioLiveCountState extends State<AudioLiveCount> {
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
        context.pushReplacementNamed(AppRoute.audioLiveChatExpand);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.audiolivebakground),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Text('$_counter',
                style: textTheme(context).headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme(context).onPrimary,
                    fontSize: 60)),
          ),
        ],
      ),
    );
  }
}
