import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_svg/svg.dart';

class FacebookLinkPage extends StatefulWidget {
  const FacebookLinkPage({super.key});

  @override
  State<FacebookLinkPage> createState() => _FacebookLinkPageState();
}

class _FacebookLinkPageState extends State<FacebookLinkPage> {
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
                'Facebook',
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
                backgroundColor: const Color.fromARGB(255, 13, 75, 126),
                child: SvgPicture.asset(
                  AppIcons.facebook,
                  fit: BoxFit.contain,
                  width: 60,
                  height: 60,
                  color: colorScheme(context).surface,
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
