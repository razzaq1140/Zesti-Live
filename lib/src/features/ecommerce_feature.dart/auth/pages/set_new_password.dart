import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_textfield.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:go_router/go_router.dart';

class SetNewPasswordPage extends StatefulWidget {
  const SetNewPasswordPage({super.key});

  @override
  State<SetNewPasswordPage> createState() => _SetNewPasswordPageState();
}

class _SetNewPasswordPageState extends State<SetNewPasswordPage> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
                          context.pop();
                        },
                        child: Icon(
                          Icons.arrow_back_outlined,
                          color: colorScheme(context).surface,
                        )),
                    Spacer(),
                    Text(
                      "Set a new password",
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
                      height: 60,
                    ),
                    CustomTextFormField(
                      controller: _passwordController,
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
                      height: 12,
                    ),
                    CustomTextFormField(
                      controller: _confirmPasswordController,
                      validationType: ValidationType.passwordConfirmation,
                      passwordController:
                          _passwordController, // Pass password controller here
                      fillColor: colorScheme(context).outline.withOpacity(0.1),
                      hint: "Confirm Password",
                      hintColor: colorScheme(context).outline.withOpacity(0.3),
                      borderRadius: 60,
                      obscureText: !_isConfirmPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(_isConfirmPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        color: colorScheme(context)
                            .outline
                            .withOpacity(0.3), // Set the icon color to pink
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible =
                                !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 150,
                    ),
                    CustomButton(
                        textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: colorScheme(context).surface),
                        buttonText: "SAVE PASSWORD",
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            context.pushNamed(AppRoute.newBottomNavPage);
                          }
                        }),
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
