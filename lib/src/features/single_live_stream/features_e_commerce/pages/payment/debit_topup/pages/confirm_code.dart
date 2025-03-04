import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';

import '../widget/custom_elevated_button.dart';

class ConfirmCode extends StatefulWidget {
  const ConfirmCode({super.key});

  @override
  State<ConfirmCode> createState() => _ConfirmCodeState();
}

class _ConfirmCodeState extends State<ConfirmCode> {
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

  void verifyCode() {
    String enteredOTP = otp.join();
    if (enteredOTP.length == 4) {
      // Display DraggableScrollableSheet as Bottom Sheet
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
            initialChildSize: 0.5, // Initial height of the Bottom Sheet
            maxChildSize: 0.8, // Maximum height
            minChildSize: 0.3, // Minimum height
            expand: false,
            builder: (BuildContext context, ScrollController controller) {
              return SingleChildScrollView(
                controller: controller,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Icon(
                        Icons.check_circle,
                        size: 80,
                        color: Color(0xffFBBA32),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "SUCCESS",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 50),
                      const Text(
                        "Thank you, your debit card has been added.\nYou can easily shop with My Pay, Top Up now!",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 80),
                      CustomButton(
                        buttonText: 'CONTINUE TOP UP',
                        onPressed: () {
                       //   Context.pop(context);
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid 4-digit OTP'),
          backgroundColor: Colors.blue,
        ),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 100),
              const Text(
                "Top Up",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Confirm Code via phone number',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'My Pay sends a code via SMS to your phone number +1424-XXXX-XX67, enter the code!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xffF6F6F7),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xffF6F6F7)),
                    ),
                    child: TextField(
                      obscureText:
                          true, // This will hide the entered text as dots
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 20, color: Colors.black),
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
              const SizedBox(height: 60),
              Text(
                'This code will expire in ${remainingTime ~/ 60}:${(remainingTime % 60).toString().padLeft(2, '0')}',
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 250),
              CustomElevatedButton(
                onPressed: verifyCode,
                text: 'VERIFY CODE',
                buttonColor: Colors.red,
                showIcon: false,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomElevatedButton(
                text: 'RESEND CODE',
                showIcon: false,
                buttonColor: const Color(0xffACBAC3),
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => DebitTopup(),
                  //     ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

// GoRoute(
//         name: AppRoute.debittopUp,
//         path: '/${AppRoute.debittopUp}',
//         pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
//           context: context,
//           state: state,
//           child: const DebitTopup(),
//         ),
//       ),
//       GoRoute(
//         name: AppRoute.confirmcode
//         path: '/${AppRoute.confirmcode}',
//         pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
//           context: context,
//           state: state,
//           child: const ConfirmCode(),
//         ),
//       ),
//         GoRoute(
//         name: AppRoute.adddebitcard
//         path: '/${AppRoute.adddebitcode}',
//         pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
//           context: context,
//           state: state,
//           child: const AddDebitCard(),
//         ),
//       ),
//         GoRoute(
//         name: AppRoute.confirmcode
//         path: '/${AppRoute.confirmcode}',
//         pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
//           context: context,
//           state: state,
//           child: const ConfirmCode(),
//         ),
//       ),
//        GoRoute(
//         name: AppRoute.jobinterview
//         path: '/${AppRoute.jobinterview}',
//         pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
//           context: context,
//           state: state,
//           child: const JobInterview(),
//         ),
//       ),
//        GoRoute(
//         name: AppRoute.jobinterviewperson
//         path: '/${AppRoute.jobinterviewperson}',
//         pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
//           context: context,
//           state: state,
//           child: const JobInterviewPerson(),
//         ),
//       ),
//       static const confirmcode = 'confirmcode-screen';
//       static const debittopUp = 'debittopUp-screen';
//       static const adddebitcode = 'adddebitcode-screen';
//       static const jobinterview = 'jobinterview-screen';
//        static const jobinterviewperson = 'jobinterviewperson-screen';

      