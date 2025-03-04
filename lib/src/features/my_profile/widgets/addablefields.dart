import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/const/global_variables.dart';
import '../pages/add_education_screen.dart';
import '../pages/career_screen.dart';
import '../provider/edit_profile_provider.dart';

class AddableFieldWidget extends StatelessWidget {
  final String section;
  final VoidCallback onTap;

  const AddableFieldWidget({
    Key? key,
    required this.section,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EditProfileProvider>(
      builder: (context, provider, child) {
        final entries = section == 'Education'
            ? provider.educationEntries
            : provider.careerEntries;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                section,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onTap: onTap,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: entries.length,
              itemBuilder: (context, index) {
                final entry = entries[index];
                final title = entry['position'] ?? entry['title'] ?? '';
                final subtitle = entry['company'] ?? entry['subtitle'] ?? '';

                return ListTile(
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  title: Text(
                    title,
                    style: textTheme(context)
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    subtitle,
                    style: textTheme(context).bodyMedium?.copyWith(
                        color: colorScheme(context).onSurface.withOpacity(0.5)),
                  ),
                  onTap: () => _showOptionsDialog(context, provider, index),
                );
              },
            ),
            const Divider(thickness: 1, height: 20),
            Align(
              alignment: Alignment.center,
              child: TextButton.icon(
                onPressed: onTap,
                icon: const Icon(Icons.add, color: Colors.blue),
                label: Text(
                  'Add',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onSurface),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // Show options dialog with Edit and Delete choices
  void _showOptionsDialog(
      BuildContext context, EditProfileProvider provider, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Edit', style: textTheme(context).titleSmall),
                onTap: () {
                  Navigator.pop(context); // Close the options dialog
                  _navigateToEditScreen(
                      context, index); // Navigate to edit screen
                },
              ),
              ListTile(
                title: Text('Delete', style: textTheme(context).titleSmall),
                onTap: () {
                  Navigator.pop(context); // Close the options dialog
                  _showDeleteConfirmationDialog(context, provider, index);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Show confirmation dialog for deletion
  void _showDeleteConfirmationDialog(
      BuildContext context, EditProfileProvider provider, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('Are you sure you want to delete?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(
                    context); // Close confirmation dialog without deleting
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close confirmation dialog
                if (section == 'Education') {
                  provider.removeEducation(index);
                } else {
                  provider.removeCareer(index);
                }
              },
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  // Navigate to the edit screen with the entry index
  void _navigateToEditScreen(BuildContext context, int index) {
    if (section == 'Education') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EducationScreen(entryIndex: index),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CareerScreen(entryIndex: index),
        ),
      );
    }
  }
}
