import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SelectSignupPage extends StatefulWidget {
  const SelectSignupPage({super.key});

  @override
  State<SelectSignupPage> createState() => _SelectSignupPageState();
}

class _SelectSignupPageState extends State<SelectSignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Opacity(
              opacity: 0.4,
              child: Image.asset(
                AppImages.object,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildLoginButton(
                    onTape: () {
                      context.pushNamed(AppRoute.createUserPage);
                    },
                    context: context,
                    svgAsset: AppIcons.facebook,
                    label: 'Facebook',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildLoginButton(
                    onTape: () {
                      context.pushNamed(AppRoute.createUserPage);
                    },
                    context: context,
                    svgAsset: AppIcons.google,
                    label: 'Google',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildLoginButton(
                    onTape: () {
                      context.pushNamed(AppRoute.loginPoneNumberPage);
                    },
                    context: context,
                    svgAsset: AppIcons.phone,
                    label: 'Phone',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Row(
                      children: [
                        Expanded(
                            child: Divider(
                          thickness: 1,
                          color:
                              colorScheme(context).onSurface.withOpacity(0.2),
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'or',
                            style: textTheme(context)
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Expanded(
                            child: Divider(
                                thickness: 1,
                                color: colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.2))),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppIcons.skype),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: SvgPicture.asset(AppIcons.instagram),
                      ),
                      SvgPicture.asset(AppIcons.user)
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'Login means you agree to Terms of Use, Privacy Policy Powered by Yeah!live',
                    style: textTheme(context)
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildLoginButton({
    required VoidCallback onTape,
    required BuildContext context,
    required String svgAsset, // Path to your SVG asset
    required String label,
    // You can use this to style the icon if needed
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: onTape,
        style: ElevatedButton.styleFrom(
          foregroundColor: colorScheme(context).onSurface,
          backgroundColor: colorScheme(context).surface,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 2,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
          child: Row(
            children: [
              SvgPicture.asset(
                svgAsset,
                height: 24, // Adjust the size of the SVG image
                width: 24,
              ),
              const SizedBox(width: 50), // Space between the icon and text
              Text(
                label,
                style: textTheme(context)
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
