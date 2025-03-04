import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_textfield.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:go_router/go_router.dart';

class NewEnterPhonePage extends StatefulWidget {
  const NewEnterPhonePage({super.key});

  @override
  State<NewEnterPhonePage> createState() => _NewEnterPhonePageState();
}

class _NewEnterPhonePageState extends State<NewEnterPhonePage> {
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
                          context.pop();
                        },
                        child: Icon(
                          Icons.arrow_back_outlined,
                          color: colorScheme(context).surface,
                        )),
                    Spacer(),
                    Text(
                      "Enter your phone",
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
                      validationType: ValidationType.phoneNumber,
                      fillColor: colorScheme(context).outline.withOpacity(0.1),
                      hint: "Enter phone number",
                      hintColor: colorScheme(context).outline.withOpacity(0.3),
                      borderRadius: 60,
                    ),
                 
                   
                  
                    SizedBox(
                      height: 300,
                    ),
                    CustomButton(
                        textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: colorScheme(context).surface),
                        buttonText: "SAVE PHONE NUMBER",
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            context.pushNamed(AppRoute.setNewPasswordPage);

                          }

                        }
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