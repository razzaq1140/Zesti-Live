import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';

class AcceptBottomSheet extends StatefulWidget {
  final VoidCallback onTap;
  const AcceptBottomSheet({super.key, required this.onTap});

  @override
  AcceptBottomSheetState createState() => AcceptBottomSheetState();
}

class AcceptBottomSheetState extends State<AcceptBottomSheet> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Accept "Bang Dreams" as a guest to',
            style: textTheme(context).bodyMedium,
          ),
          const SizedBox(height: 16.0),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: List.generate(8, (index) {
              return GestureDetector(
                onTap: () => setState(() => selectedIndex = index),
                child: Container(
                  width: 90,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selectedIndex == index
                          ? colorScheme(context).primary
                          : colorScheme(context).onPrimary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text('0${index + 1}',
                      style: textTheme(context).bodySmall?.copyWith(
                          color: selectedIndex == index
                              ? colorScheme(context).primary
                              : AppColor.textGrey.withOpacity(0.4))),
                ),
              );
            }),
          ),
          const SizedBox(height: 16.0),
          CustomButton(buttonText: "ok", onPressed: widget.onTap)
        ],
      ),
    );
  }
}
