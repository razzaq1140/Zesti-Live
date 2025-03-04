import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/get_started/provider/onboarding_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import '../../../common/const/global_variables.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  final List<OnboardingContent> pages = const [
    OnboardingContent(
      imageUrls: [
        AppImages.onboardFirstone,
        AppImages.onboardFirsttwo,
        AppImages.onboardFirstthree,
        AppImages.onboardFirstfour
      ],
      title: "Discover \nAmazing Content",
      description:
          "Explore a diverse library of videos and live streams, spanning comedy to music and beyond.",
    ),
    OnboardingContent(
      imageUrls: [
        AppImages.onboardSecondone,
        AppImages.onboardSecondtwo,
        AppImages.onboardSecondthree,
        AppImages.onboardSecondfour,
      ],
      title: "Create and \nShare your Magic",
      description:
          'Unleash your creativity, share your talents, and create stunning videos and live streams without limits.',
    ),
    OnboardingContent(
      imageUrls: [
        AppImages.onboardThirdone,
        AppImages.onboardThirdtwo,
        AppImages.onboardThirdthree,
        AppImages.onboardThirdfour,
      ],
      title: "Connect with a\nGlobal Community",
      description:
          'Join millions worldwide. Interact, make friends, and collaborate with creators from all over the globe.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
          child: Consumer<OnboardingProvider>(
            builder: (context, onboardingProvider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: PageTransitionSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder:
                          (child, animation, secondaryAnimation) =>
                              FadeThroughTransition(
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        child: child,
                      ),
                      child: buildOnboardingPage(
                        context,
                        pages[onboardingProvider.currentPageIndex],
                        key: ValueKey(onboardingProvider.currentPageIndex),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildStepper(context, onboardingProvider),
                      CustomButton(
                        height: 45,
                        width: 150,
                        buttonText:
                            onboardingProvider.isLastPage ? 'Start' : 'Next',
                        textStyle: textTheme(context).titleSmall?.copyWith(
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.bold,
                            color: colorScheme(context).onPrimary),
                        onPressed: () {
                          if (onboardingProvider.isLastPage) {
                            context.pushReplacementNamed(
                                AppRoute.selectSignupPage);
                          } else {
                            onboardingProvider.nextPage();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildOnboardingPage(BuildContext context, OnboardingContent content,
      {required Key key}) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: width * 0.4,
                  height: height * 0.34,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: Image.asset(
                      content.imageUrls[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: width * 0.35,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: ClipOval(
                    child: Image.asset(
                      content.imageUrls[2],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                Container(
                  width: width * 0.35,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: ClipOval(
                    child: Image.asset(
                      content.imageUrls[1],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: width * 0.4,
                  height: height * 0.34,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: Image.asset(
                      content.imageUrls[3],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          content.title,
          style: textTheme(context).headlineMedium?.copyWith(
              color: colorScheme(context).onSurface,
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
        const SizedBox(height: 5),
        Text(
          content.description,
          style: textTheme(context)
              .titleMedium
              ?.copyWith(color: colorScheme(context).outline.withOpacity(0.4)),
        ),
      ],
    );
  }

  Widget buildStepper(BuildContext context, OnboardingProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return GestureDetector(
          onTap: () {
            provider.setPage(index); // Change to the tapped index
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: provider.currentPageIndex == index ? 40 : 20,
            height: 6,
            decoration: BoxDecoration(
              color: provider.currentPageIndex == index
                  ? colorScheme(context).primary
                  : Colors.grey[400],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }),
    );
  }
}

class OnboardingContent {
  final List<String> imageUrls;
  final String title;
  final String description;

  const OnboardingContent({
    required this.imageUrls,
    required this.title,
    required this.description,
  });
}
