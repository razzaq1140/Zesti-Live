import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/const/app_images.dart';

class GoogleLinkPage extends StatefulWidget {
  const GoogleLinkPage({super.key});

  @override
  State<GoogleLinkPage> createState() => _GoogleLinkPageState();
}

class _GoogleLinkPageState extends State<GoogleLinkPage> {
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
                'Google',
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
        body: Container(
          color: colorScheme(context).onSurface.withOpacity(0.025),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
                child: Column(children: [
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 50,
                backgroundColor: AppColor.textGrey.withOpacity(0.15),
                child: SvgPicture.asset(
                  AppIcons.google,
                  width: 60,
                  height: 60,
                ),
              ),
              const SizedBox(height: 10),
              Text("Eren Yeager",
                  style: textTheme(context).titleMedium?.copyWith(
                        color: colorScheme(context).onSurface,
                      )),
              const SizedBox(height: 40),
              Container(
                width: double.infinity,
                height: 40,
                color: colorScheme(context).surface,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Disconnect",
                      style: textTheme(context).titleSmall?.copyWith(
                            color: colorScheme(context).onSurface,
                          )),
                ),
              ),
            ]))
          ]),
        ));
  }
}
