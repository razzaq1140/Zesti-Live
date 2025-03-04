import 'package:flutter/material.dart';
import '../../../common/const/global_variables.dart';

class SectionWithChipsWidget extends StatefulWidget {
  final String title;
  final List<String> initialChips;
  final void Function(String)? onChipDeleted;

  const SectionWithChipsWidget({
    Key? key,
    required this.title,
    required this.initialChips,
    this.onChipDeleted,
  }) : super(key: key);

  @override
  _SectionWithChipsWidgetState createState() => _SectionWithChipsWidgetState();
}

class _SectionWithChipsWidgetState extends State<SectionWithChipsWidget> {
  final TextEditingController _textController = TextEditingController();
  late List<String> _chips;

  @override
  void initState() {
    super.initState();
    _chips = List.from(widget.initialChips);
  }

  void _addChip() {
    final text = _textController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _chips.add(text);
        _textController.clear();
      });
    }
  }

  void _deleteChip(String chip) {
    setState(() {
      _chips.remove(chip);
    });
    if (widget.onChipDeleted != null) {
      widget.onChipDeleted!(chip);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        TextField(
          controller: _textController,
          decoration: InputDecoration(
            suffix: IconButton(
                onPressed: () {
                  _addChip();
                },
                icon: Icon(Icons.send)),
            hintText: 'Add ${widget.title} here',
            hintStyle: textTheme(context).bodyLarge?.copyWith(
                fontWeight: FontWeight.normal,
                color: colorScheme(context).onSurface.withOpacity(0.8)),
            enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: colorScheme(context).outlineVariant)),
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: _chips.map((chip) {
            return Chip(
              deleteIconColor:
                  Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
              side: const BorderSide(color: Colors.transparent),
              label: Text(chip),
              backgroundColor:
                  Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
              deleteIcon: const Icon(Icons.close, size: 16),
              onDeleted: () => _deleteChip(chip),
            );
          }).toList(),
        ),
        const Divider(thickness: 1, height: 20),
      ],
    );
  }
}
