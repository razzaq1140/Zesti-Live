
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/edit_profile_provider.dart';

class EditableFieldWidget extends StatelessWidget {
  final String label;
  final String Function(BuildContext) getValue;
  final void Function(BuildContext, String) updateValue;

  const EditableFieldWidget({
    Key? key,
    required this.label,
    required this.getValue,
    required this.updateValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                child: Text(label,
                    style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ),
              Expanded(
                child: Consumer<EditProfileProvider>(
                  builder: (context, provider, child) {
                    return GestureDetector(
                      onTap: () {
                        _showEditDialog(
                            context, label, getValue(context), updateValue);
                      },
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        getValue(context),
                        style: const TextStyle(fontSize: 16),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            height: 20,
            indent: 100,
          ),
        ],
      ),
    );
  }

  void _showEditDialog(BuildContext context, String label, String currentValue,
      void Function(BuildContext, String) updateValue) {
    final TextEditingController controller =
        TextEditingController(text: currentValue);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Input $label:'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              counterStyle: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Update value in provider and close dialog
                updateValue(context, controller.text);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
