import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
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
              'Privacy Policy',
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
        padding: const EdgeInsets.all(14),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Yeah! Live Privacy Policy",
                style: textTheme(context).titleSmall?.copyWith(
                    color: colorScheme(context).onSurface,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tortor augue, suscipit a eleifend eu, dignissim sollicitudin purus. Proin eget ante consectetur, sagittis eros in, consectetur dui. Vestibulum sollicitudin diam et diam lacinia, a porta augue dapibus. Duis varius lorem vel elit molestie, nec dignissim velit cursus. Phasellus at blandit tellus. Duis vel metus eu turpis lobortis iaculis. Pellentesque id nisl aliquet, suscipit magna fermentum, tristique arcu. ",
                style: textTheme(context).bodyLarge?.copyWith(
                    color: AppColor.textGrey, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Account Information",
                style: textTheme(context).titleSmall?.copyWith(
                    color: colorScheme(context).onSurface,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tortor augue, suscipit a eleifend eu, dignissim sollicitudin purus. Proin eget ante consectetur, sagittis eros in, consectetur dui. Vestibulum sollicitudin diam et diam lacinia, a porta augue dapibus. Duis varius lorem vel elit molestie, nec dignissim velit cursus. Phasellus at blandit tellus. Duis vel metus eu turpis lobortis iaculis. Pellentesque id nisl aliquet, suscipit magna fermentum, tristique arcu. ",
                style: textTheme(context).bodyLarge?.copyWith(
                    color: AppColor.textGrey, fontWeight: FontWeight.w400),
              )
            ]),
      ),
    );
  }
}
