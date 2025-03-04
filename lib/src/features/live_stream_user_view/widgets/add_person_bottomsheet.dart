import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/live_stream_user_view/widgets/invitefriendstabar.dart';
import 'package:go_router/go_router.dart';

import '../../../common/const/app_colors.dart';
import '../../../common/const/global_variables.dart';

class AddPersonBottomSheet extends StatelessWidget {
  const AddPersonBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme(context).onPrimary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
              onPressed: () {
                context.pop();
                showModalBottomSheet(
                    context: context, builder: (context) => InviteTabbar());
              },
              child: Text(
                "Invite",
                style: textTheme(context)
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              )),
          TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text(
                        "Are you sure to disconnect and close this seat? ",
                        style: textTheme(context).bodyMedium,
                      ),
                      actions: [
                        SizedBox(
                          height: 35,
                          child: TextButton(
                            child: Text(
                              "Cancel",
                              style: textTheme(context).bodySmall?.copyWith(
                                  color: colorScheme(context).primary),
                            ),
                            onPressed: () {
                              // Handle action here
                              Navigator.of(context).pop(); // Closes the dialog
                            },
                          ),
                        ),
                        SizedBox(
                          height: 35,
                          child: TextButton(
                            child: Text(
                              "Sure",
                              style: textTheme(context).bodySmall?.copyWith(
                                  color: colorScheme(context).primary),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                "Close",
                style: textTheme(context)
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              )),
          TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(
                "Cancel",
                style: textTheme(context).bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold, color: AppColor.tagRed),
              )),
        ],
      ),
    );
  }
}
