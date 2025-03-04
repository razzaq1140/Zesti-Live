import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_textfield.dart';
import 'package:flutter_application_zestilive/src/features/ecommerce_feature.dart/auth/widgets/custom_container.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:go_router/go_router.dart';

class NewSigninPage extends StatefulWidget {
  const NewSigninPage({super.key});

  @override
  State<NewSigninPage> createState() => _NewSigninPageState();
}

class _NewSigninPageState extends State<NewSigninPage> {
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 226,
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorScheme(context).primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 52.0, left: 16, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        context.pushNamed(AppRoute.newSignupPage);
                      },
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Sign up",
                          style: textTheme(context).bodySmall?.copyWith(
                                fontSize: 14,
                                color: colorScheme(context)
                                    .surface, // Visible color
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Sign in",
                      style: textTheme(context).bodyMedium?.copyWith(
                          color: colorScheme(context).surface, // Contrast color
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10), // Add spacing if needed
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer maximus accumsan erat id facilisis.",
                      style: textTheme(context).bodyMedium?.copyWith(
                          color: colorScheme(context).surface, // Contrast color
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      validationType: ValidationType.name,
                      fillColor: colorScheme(context).outline.withOpacity(0.1),
                      hint: "your name",
                      hintColor: colorScheme(context).outline.withOpacity(0.3),
                      borderRadius: 60,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    CustomTextFormField(
                      validationType: ValidationType.password,
                      fillColor: colorScheme(context).outline.withOpacity(0.1),
                      hint: "Password",
                      hintColor: colorScheme(context).outline.withOpacity(0.3),
                      borderRadius: 60,
                      obscureText: !_isPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(_isPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        color: colorScheme(context)
                            .outline
                            .withOpacity(0.3), // Set the icon color to pink

                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: () {
                        context.pushNamed(AppRoute.newForgotPasswordPage);
                      },
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Forgot password?",
                          style: textTheme(context).bodySmall?.copyWith(
                                fontSize: 12,
                                color: colorScheme(context)
                                    .primary, // Visible color
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    CustomButton(
                        textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: colorScheme(context).surface),
                        buttonText: "SIGN IN",
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            context.pushReplacementNamed(AppRoute.newBottomNavPage);

                          }
                        }),
                    SizedBox(
                      height: 50,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Or Sign in with social media",
                        style: textTheme(context).bodySmall?.copyWith(
                              fontSize: 12,
                              color: colorScheme(context)
                                  .outline
                                  .withOpacity(0.5), // Visible color
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    CustomButtonWithIcon(
                      imagePath: AppImages.googlelogo,
                      text: "CONTINUE WITH GOOGLE",
                      backgroundColor:
                          colorScheme(context).outline.withOpacity(0.1),
                      textColor: colorScheme(context).outline, // Set text color
                      onTap: () {
                        // Handle button tap
                        print("Google button tapped");
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    CustomButtonWithIcon(
                      imagePath: AppImages.fblogo,
                      text: "CONTINUE WITH FACEBOOK",
                      backgroundColor: colorScheme(context)
                          .secondary, // Set background color
                      textColor: colorScheme(context).surface, // Set text color
                      onTap: () {
                        // Handle button tap
                        print("Google button tapped");
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
