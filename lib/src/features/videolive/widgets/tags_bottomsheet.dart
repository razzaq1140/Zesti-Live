import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/videolive/provider/tags_selection_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TagsBottomSheet extends StatelessWidget {
  final List<String> tags = [
    'Sentiment',
    'Fun',
    'Sing',
    'Gang up',
    'Chat',
    'Make Friends',
  ];

  TagsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final tagProvider = Provider.of<TagSelectionProvider>(context);

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: tags.map((tag) {
              bool isSelected = tagProvider.isTagSelected(tag);
              return ChoiceChip(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side:
                        BorderSide(color: colorScheme(context).outlineVariant)),
                showCheckmark: false,
                label: Text(
                  tag,
                  style: textTheme(context).bodyMedium?.copyWith(
                      color: isSelected
                          ? colorScheme(context).onPrimary
                          : colorScheme(context).onSurface.withOpacity(0.3),
                      fontSize: 13),
                ),
                selected: isSelected,
                onSelected: (selected) {
                  if (selected) {
                    tagProvider.selectTag(tag);
                  } else {
                    tagProvider.deselectTag();
                  }
                },
                selectedColor: colorScheme(context).primary,
                backgroundColor: colorScheme(context).surface,
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          Text(
            'Choose an interesting tag and more people can find your room.',
            style: textTheme(context).bodyMedium?.copyWith(
                color: colorScheme(context).onSurface.withOpacity(0.5),
                fontSize: 10),
          ),
          SizedBox(height: 16),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(6),
            child: ElevatedButton(
              onPressed: tagProvider.selectedTag != null
                  ? () {
                      context.pop();
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: tagProvider.selectedTag != null
                    ? colorScheme(context).primary
                    : AppColor.surfaceGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('OK',
                  style: textTheme(context).bodyMedium?.copyWith(
                      color: colorScheme(context).onPrimary,
                      fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}
