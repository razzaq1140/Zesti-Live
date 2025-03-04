import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';

class SelectPrivacy extends StatefulWidget {
  final String initialPrivacy;

  const SelectPrivacy({super.key, required this.initialPrivacy});

  @override
  State<SelectPrivacy> createState() => _SelectPrivacyState();
}

class _SelectPrivacyState extends State<SelectPrivacy> {
  late String selectedPrivacy;

  @override
  void initState() {
    super.initState();
    selectedPrivacy = widget.initialPrivacy;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: colorScheme(context).onPrimary),
        backgroundColor: colorScheme(context).primary,
        title: Text(
          "Select Privacy",
          style: textTheme(context).titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme(context).onPrimary),
        ),
        centerTitle: false,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(
              "Who can see your post?",
              style: textTheme(context)
                  .titleSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              "Your post will appear in News Feed, on your profile and in search results.",
              style: textTheme(context)
                  .bodyLarge
                  ?.copyWith(color: AppColor.textGrey),
            ),
            const SizedBox(height: 40),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Radio<String>(
                value: "Public",
                groupValue: selectedPrivacy,
                onChanged: (value) {
                  setState(() {
                    selectedPrivacy = value!;
                  });
                  Navigator.pop(context, selectedPrivacy);
                },
              ),
              title: Text(
                "Public",
                style: textTheme(context).titleMedium,
              ),
              trailing: Icon(
                Icons.public,
                size: 16,
                color: AppColor.textGrey,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Radio<String>(
                value: "Friends",
                groupValue: selectedPrivacy,
                onChanged: (value) {
                  setState(() {
                    selectedPrivacy = value!;
                  });
                  Navigator.pop(context, selectedPrivacy);
                },
              ),
              title: Text(
                "Friends",
                style: textTheme(context).titleMedium,
              ),
              trailing: Icon(
                Icons.people,
                size: 16,
                color: AppColor.textGrey,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Radio<String>(
                value: "Only Me",
                groupValue: selectedPrivacy,
                onChanged: (value) {
                  setState(() {
                    selectedPrivacy = value!;
                  });
                  Navigator.pop(context, selectedPrivacy);
                },
              ),
              title: Text(
                "Only Me",
                style: textTheme(context).titleMedium,
              ),
              trailing: Icon(
                Icons.lock,
                size: 16,
                color: AppColor.textGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
