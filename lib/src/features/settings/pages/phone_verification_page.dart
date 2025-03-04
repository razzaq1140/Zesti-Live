import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';

class PhoneVerificationPage extends StatefulWidget {
  const PhoneVerificationPage({super.key});

  @override
  State<PhoneVerificationPage> createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  int resendCounter = 57; // Initial countdown value
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  @override
  void dispose() {
    countdownTimer
        ?.cancel(); // Ensure timer is canceled when widget is disposed
    super.dispose();
  }

  void startCountdown() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendCounter > 0) {
        setState(() {
          resendCounter--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void resetCountdown() {
    setState(() {
      resendCounter = 57; // Reset counter value
    });
    startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(98),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.tagRed,
          title: Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Text(
              'Phone Verification',
              style: textTheme(context).titleSmall?.copyWith(
                  color: colorScheme(context).surface,
                  fontWeight: FontWeight.w700),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Text(
                "A verification code is sent to you",
                style: textTheme(context).labelMedium?.copyWith(
                      color: colorScheme(context).onSurface,
                    ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                "+91 9876543210",
                style: textTheme(context).headlineMedium?.copyWith(
                    color: colorScheme(context).onSurface,
                    fontWeight: FontWeight.w700,
                    fontSize: 24),
              ),
            ),
            const SizedBox(height: 10),
            Divider(
              height: 26,
              color: colorScheme(context).outlineVariant,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Verification Code',
                        hintStyle: textTheme(context).titleSmall?.copyWith(
                              color: colorScheme(context).onSurface,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: size.width * 0.28,
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: colorScheme(context).primary,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: TextButton(
                      onPressed: resendCounter == 0
                          ? () {
                              resetCountdown(); // Reset the countdown when "Resend" is clicked
                            }
                          : null,
                      child: Text(
                        resendCounter > 0
                            ? "Resend ($resendCounter)"
                            : "Resend",
                        style: textTheme(context).bodyLarge?.copyWith(
                              color: colorScheme(context).primary,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 25,
              color: colorScheme(context).outlineVariant,
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: CustomButton(
                height: size.height * 0.05,
                width: size.width * 0.93,
                buttonText: 'NEXT',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          "Message will be sent to your phone later. Are you sure you want to return?",
                          style: textTheme(context)
                              .bodyLarge
                              ?.copyWith(color: colorScheme(context).onSurface),
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                child: Text(
                                  "Wait",
                                  style: textTheme(context).bodyLarge?.copyWith(
                                      color: colorScheme(context).primary),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text(
                                  "Return",
                                  style: textTheme(context).bodyLarge?.copyWith(
                                      color: colorScheme(context).primary),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
