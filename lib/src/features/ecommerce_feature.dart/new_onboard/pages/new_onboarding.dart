import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/features/get_started/provider/onboarding_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import '../../../../common/const/global_variables.dart';

class NewOnboardingPage extends StatelessWidget {
  const NewOnboardingPage({super.key});

  final List<OnboardingContent> pages = const [
    OnboardingContent(
      imageUrls: [AppImages.newone],
      title: "SHOPPING FROM HOME",
      description:
          "Lorem ipsum dolor sit amet, \n consectetur adipiscing elit. Integer \n maximus accumsan erat id facilisis.",
    ),
    OnboardingContent(
      imageUrls: [AppImages.newtwo],
      title: "PRODUK ORIGINAL",
      description:
          "Lorem ipsum dolor sit amet, \n consectetur adipiscing elit. Integer \n maximus accumsan erat id facilisis.",
    ),
    OnboardingContent(
      imageUrls: [AppImages.newthree],
      title: "EXPRESS DELIVERY",
      description:
          "Lorem ipsum dolor sit amet, \n consectetur adipiscing elit. Integer \n maximus accumsan erat id facilisis.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
            child: Consumer<OnboardingProvider>(
              builder: (context, onboardingProvider, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    PageTransitionSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (child, animation, secondaryAnimation) =>
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
                    const SizedBox(height: 30),
                    buildStepper(context, onboardingProvider),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            context.pushNamed(AppRoute.newSigninPage);
                          },
                          child: Text(
                            "Skip",
                            style: textTheme(context).bodySmall?.copyWith(
                                  fontSize: 14,
                                  color: colorScheme(context).outline,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        CustomButton(
                          height: 45,
                          width: 100,
                          buttonText:
                              onboardingProvider.isLastPage ? 'Start' : 'Next',
                          textStyle: textTheme(context).titleSmall?.copyWith(
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                              color: colorScheme(context).onPrimary),
                          onPressed: () {
                            if (onboardingProvider.isLastPage) {
                              context
                                  .pushReplacementNamed(AppRoute.newSigninPage);
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
      ),
    );
  }

  Widget buildOnboardingPage(BuildContext context, OnboardingContent content,
      {required Key key}) {
    final double width = MediaQuery.of(context).size.width;
    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Image at the top
        Container(
          width: width * 0.8,
          height: width * 0.8, // Square image
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              content.imageUrls[0],
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 50),
        // Title
        Text(
          content.title,
          textAlign: TextAlign.center,
          style: textTheme(context).headlineMedium?.copyWith(
              color: AppColor.greyText,
              fontWeight: FontWeight.w500,
              fontSize: 18),
        ),
        const SizedBox(height: 30),
        // Description
        Text(
          content.description,
          textAlign: TextAlign.center,
          style: textTheme(context).titleMedium?.copyWith(
                color: AppColor.greyText.withOpacity(0.7),
                fontSize: 14,
              ),
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
            width: provider.currentPageIndex == index ? 18 : 6,
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
