import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';

void showSocialShareDialog({
  required BuildContext context,
  required String platformName, // Customizable platform name (e.g., Twitter)
  required VoidCallback onConfirm, // Custom action for Confirm button
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Rounded corners
        ),
        contentPadding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
        content: Text(
          "If you want to share to $platformName, please connect to your Yeah! Live account first",
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        actionsAlignment: MainAxisAlignment.end,
        actionsPadding: const EdgeInsets.only(bottom: 12),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text(
              "Cancel",
              style: TextStyle(
                color: colorScheme(context).primary,
                fontSize: 16,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              onConfirm(); // Execute custom action
            },
            child: Text(
              "Confirm",
              style: TextStyle(
                color: colorScheme(context).primary,
                fontSize: 16,
              ),
            ),
          ),
        ],
      );
    },
  );
}
