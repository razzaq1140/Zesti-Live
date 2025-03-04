

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:go_router/go_router.dart';

class NewForgotPasswordPage extends StatefulWidget {
  const NewForgotPasswordPage({super.key});

  @override
  State<NewForgotPasswordPage> createState() => _NewForgotPasswordPageState();
}

class _NewForgotPasswordPageState extends State<NewForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  List<String> otp = ['', '', '', ''];
  int remainingTime = 300; // 5 minutes in seconds
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void resendCode() {
    setState(() {
      remainingTime = 300; // Reset the timer
      otp = ['', '', '', ''];
    });
    startTimer();

    // Snackbar for Resend Code
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please resend your code'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

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
                      "Forgot password",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(4, (index) {
                        return Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                      color: colorScheme(context).outline.withOpacity(0.1),

                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: const Color(0xffF6F6F7)),
                          ),
                          child: TextField(
                            obscureText: true,
                            maxLength: 1,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black),
                            onChanged: (value) {
                              if (value.isNotEmpty && index < 3) {
                                FocusScope.of(context).nextFocus();
                              }
                              setState(() {
                                otp[index] = value;
                              });
                            },
                            decoration: const InputDecoration(
                              counterText: '',
                              border: InputBorder.none,
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      "Code was sent to your email",
                      style: textTheme(context).bodySmall?.copyWith(
                            fontSize: 12,
                            color: colorScheme(context)
                                .outline
                                .withOpacity(0.3), // Visible color
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    Text(
                      "Kylie_04@gmail.com",
                      style: textTheme(context).bodySmall?.copyWith(
                            fontSize: 12,
                            color:
                                colorScheme(context).secondary, // Visible color
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "This code will expire in ",
                            style: textTheme(context).bodySmall?.copyWith(
                                  fontSize: 12,
                                  color: colorScheme(context)
                                      .outline
                                      .withOpacity(0.3), // Visible color
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          TextSpan(
                            text:
                                "${remainingTime ~/ 60}:${(remainingTime % 60).toString().padLeft(2, '0')}",
                            style: textTheme(context).bodySmall?.copyWith(
                                  fontSize: 12,
                                  color: colorScheme(context)
                                      .primary, // Primary color for time
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    CustomButton(
                        textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: colorScheme(context).surface),
                        buttonText: "VERIFY CODE",
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            context.pushNamed(AppRoute.newEmailPage);
                          }
                        }),
                    SizedBox(
                      height: 12,
                    ),
                    CustomButton(
                      backgroundColor:
                          colorScheme(context).outline.withOpacity(0.1),
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: colorScheme(context).surface),
                      buttonText: "RESEND CODE",
                      onPressed: (){},
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
