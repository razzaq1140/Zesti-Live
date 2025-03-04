import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/features/auth/provider/otp_timer_provider.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../../common/const/global_variables.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  OtpPageState createState() => OtpPageState();
}

class OtpPageState extends State<OtpPage> {
  final TextEditingController otpController = TextEditingController();
  final ValueNotifier<String?> errorController = ValueNotifier<String?>(null);
  bool isOtpVerified = false;

  @override
  void initState() {
    super.initState();
    final countdownProvider =
        Provider.of<CountdownProvider>(context, listen: false);
    countdownProvider.startTimer();

    countdownProvider.addListener(() {
      if (countdownProvider.timeLeft == 0 && !isOtpVerified) {
        _showResendOtpDialog();
      }
    });
  }

  @override
  void dispose() {
    otpController.dispose();
    errorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final countdownProvider = Provider.of<CountdownProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'OTP',
          style: textTheme(context).titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: colorScheme(context).onSurface),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const SizedBox(width: double.infinity, height: 30),
            Pinput(
              controller: otpController,
              length: 4,
              onChanged: (String pin) {
                errorController.value = null;
              },
              onCompleted: (String pin) {
                if (pin.length == 4 && RegExp(r'^[0-9]+$').hasMatch(pin)) {
                  isOtpVerified = true;
                  context.pushNamed(AppRoute.createUserPage);
                } else {
                  errorController.value = 'Invalid OTP. Please enter 4 digits.';
                }
              },
              validator: (String? pin) {
                if (pin == null ||
                    pin.length != 4 ||
                    !RegExp(r'^[0-9]+$').hasMatch(pin)) {
                  return 'Please enter a 4-digit OTP.';
                }
                return null;
              },
              defaultPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: textTheme(context).headlineSmall?.copyWith(
                      fontSize: 24,
                      color: colorScheme(context).onSurface,
                    ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2, color: Colors.grey),
                  ),
                ),
              ),
              focusedPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: textTheme(context).headlineSmall?.copyWith(
                      fontSize: 24,
                      color: colorScheme(context).primary,
                    ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 2, color: colorScheme(context).primary),
                  ),
                ),
              ),
              errorPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: textTheme(context)
                    .headlineSmall
                    ?.copyWith(fontSize: 24, color: colorScheme(context).error),
                decoration: BoxDecoration(
                  border: Border(
                    bottom:
                        BorderSide(width: 2, color: colorScheme(context).error),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Error Message Display
            ValueListenableBuilder<String?>(
              valueListenable: errorController,
              builder: (context, errorMessage, child) {
                if (errorMessage == null) return const SizedBox.shrink();
                return Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                );
              },
            ),
            const SizedBox(height: 30),
            CustomButton(
              buttonText: 'Verification Code',
              onPressed: () {
                if (otpController.text.isEmpty) {
                  errorController.value = 'Please enter a 4-digit OTP.';
                } else if (otpController.text.length == 4 &&
                    RegExp(r'^[0-9]+$').hasMatch(otpController.text)) {
                  isOtpVerified = true; // OTP is verified on button press
                  context.pushNamed(AppRoute.createUserPage);
                } else {
                  errorController.value = 'Invalid OTP. Please enter 4 digits.';
                }
              },
            ),
            const SizedBox(height: 20),
            // Countdown Timer Display
            Text(
              "00:${countdownProvider.timeLeft.toString().padLeft(2, '0')}",
              style: textTheme(context).titleSmall,
            ),
          ],
        ),
      ),
    );
  }

  void _showResendOtpDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Resend OTP"),
          content:
              const Text("Your OTP has expired. Would you like to resend it?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                context.pop();
              },
            ),
            TextButton(
              child: const Text("Resend"),
              onPressed: () {
                // Resend OTP logic
                Provider.of<CountdownProvider>(context, listen: false)
                    .startTimer();
                context.pop();
              },
            ),
          ],
        );
      },
    );
  }
}
