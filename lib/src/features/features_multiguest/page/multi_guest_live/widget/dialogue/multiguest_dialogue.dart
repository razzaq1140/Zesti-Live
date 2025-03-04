import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../common/const/app_images.dart';


void showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppIcons.recordIcon, height: 35),
            const SizedBox(height: 10),
            Text(
              'Allow "Mango Ent" to record or cast your screen?',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                    fontSize: 14, color: colorScheme(context).outline),
                children: <TextSpan>[
                  const TextSpan(
                      text: 'Mango Ent',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          ' will start capturing everything on your screen including notifications, passwords, photos, messages and payment information.',
                      style: TextStyle(
                          color:
                              colorScheme(context).outline.withOpacity(0.6))),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: colorScheme(context).primary),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        'Cancel ',
                        style: TextStyle(
                            color: colorScheme(context).primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 120,
                    //  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    decoration: BoxDecoration(
                      color: colorScheme(context).primary,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        'Start Now',
                        style: TextStyle(
                            color: colorScheme(context).surface,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

/////////////////////////ShareScreenDialogue///////////////////////
void shareDialogue(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevent closing the dialog by tapping outside
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: colorScheme(context).surface,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.9, // Set maximum width
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Are you sure you want to end screen share?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center, // Center align the text
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // Close the dialog when 'No' is clicked
                        },
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: colorScheme(context).primary),
                          ),
                          child: Center(
                            child: Text(
                              'No',
                              style: TextStyle(
                                color: colorScheme(context).primary,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // Close the dialog when 'Yes' is clicked
                          // You can add additional logic here for 'Yes' action (e.g., ending the screen share)
                        },
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: colorScheme(context).primary,
                          ),
                          child: Center(
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                color: colorScheme(context).surface,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
