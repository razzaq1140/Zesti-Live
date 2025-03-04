import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:go_router/go_router.dart';

class PhonePage extends StatefulWidget {
  const PhonePage({super.key});

  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(98),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColor.tagRed,
            title: Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Text(
                'Phone Verfication',
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.phone_iphone,
                        size: 50,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text("+91 9876543210",
                        style: textTheme(context).headlineSmall?.copyWith(
                            color: colorScheme(context).onSurface,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Divider(
                height: 2,
                color: colorScheme(context).onSurface.withOpacity(0.15),
              ),
              ListTile(
                leading: Icon(
                  Icons.phone_android_outlined,
                  color: colorScheme(context).onSurface.withOpacity(0.8),
                ),
                title: Text("Change Phone Number",
                    style: textTheme(context).titleSmall?.copyWith(
                          color: colorScheme(context).onSurface,
                        )),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: colorScheme(context).onSurface.withOpacity(0.3),
                ),
                onTap: () {
                  context.pushNamed(AppRoute.phoneVerificationPage);
                },
              ),
              Divider(
                height: 2,
                color: colorScheme(context).onSurface.withOpacity(0.15),
              ),
              ListTile(
                leading: const Icon(Icons.lock_outline),
                title: Text("Change Password",
                    style: textTheme(context).titleSmall?.copyWith(
                          color: colorScheme(context).onSurface,
                        )),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: colorScheme(context).onSurface.withOpacity(0.3),
                ),
                onTap: () {
                  context.pushNamed(AppRoute.changePasswordPage);
                },
              ),
              Divider(
                height: 2,
                color: colorScheme(context).onSurface.withOpacity(0.15),
              ),
            ])));
  }
}
