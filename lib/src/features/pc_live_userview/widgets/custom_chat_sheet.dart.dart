import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';

class InputBottomSheet {
  static void open({
    required BuildContext context,
    required TextEditingController controller,
    required VoidCallback onSend,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Type a message",
                hintStyle: TextStyle(fontSize: 14, color: AppColor.greyText),
                suffixIcon: GestureDetector(
                  onTap: onSend,
                  child: const Icon(Icons.send, color: Colors.red),
                ),
                filled: true,
                fillColor: AppColor.dividerClr.withOpacity(0.6),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
          ),
        );
      },
    );
  }
}
