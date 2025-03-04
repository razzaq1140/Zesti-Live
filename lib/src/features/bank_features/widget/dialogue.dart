import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/const/app_colors.dart';
import '../../../common/const/app_images.dart';

class TransactionFailedDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon section
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    AppIcons.sendIcons,
                    height: 70,
                    width: 70,
                  ),
                  Positioned(
                    right: 10,
                    top: 40,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.close,
                        size: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Text section
            Text(
              "Your transaction failed, the\ndata you entered is incorrect\nplease check again",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            // Button
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.tagRed,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Check Again",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Function to show the dialog
void showTransactionFailedDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => TransactionFailedDialog(),
  );
}
