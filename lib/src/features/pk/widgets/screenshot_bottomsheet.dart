import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';

class CaptureModalContent extends StatefulWidget {
  const CaptureModalContent({super.key});

  @override
  CaptureModalContentState createState() => CaptureModalContentState();
}

class CaptureModalContentState extends State<CaptureModalContent> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Yeah, we will start capturing everything that shows on your screen',
            style: textTheme(context).bodyMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Checkbox(
                side: BorderSide(color: colorScheme(context).outline),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60)),
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value ?? false;
                  });
                },
              ),
              const SizedBox(width: 2.0),
              Text(
                "Don't show again",
                style: textTheme(context).bodyMedium,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Submit',
                  style: textTheme(context)
                      .bodyMedium
                      ?.copyWith(color: colorScheme(context).onPrimary),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.surfaceGrey,
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: textTheme(context)
                      .bodyMedium
                      ?.copyWith(color: colorScheme(context).onSurface),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
