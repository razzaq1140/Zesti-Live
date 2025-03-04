import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:go_router/go_router.dart';
import '../../../common/const/global_variables.dart'; // Assuming you're using go_router for navigation

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      context.pushNamed(AppRoute.languageSelectionPage);
    });

    return Scaffold(
      backgroundColor: colorScheme(context).surface,
      body: Container(
        color: colorScheme(context).primary,
        child: Center(
          child: Image.asset(AppImages.zestLogo, width: 150, height: 150),
        ),
      ),
    );
  }
}
