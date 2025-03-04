import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/edit_profile_provider.dart';

class EducationScreen extends StatefulWidget {
  final int? entryIndex; 

  const EducationScreen({Key? key, this.entryIndex}) : super(key: key);

  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  // Controllers for the text fields
  late TextEditingController schoolController;
  late TextEditingController timeController;

  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isInitialized) {
      final provider = Provider.of<EditProfileProvider>(context, listen: false);

      // If entryIndex is provided, load existing data
      if (widget.entryIndex != null) {
        final entry = provider.educationEntries[widget.entryIndex!];
        schoolController = TextEditingController(text: entry['title']);
        timeController = TextEditingController(text: entry['subtitle']);
      } else {
        // Initialize controllers for a new entry
        schoolController = TextEditingController();
        timeController = TextEditingController();
      }

      _isInitialized = true; // Prevents reinitialization
    }
  }

  // Save or update education information
  void _saveEducationInfo() {
    final provider = Provider.of<EditProfileProvider>(context, listen: false);

    final title = schoolController.text;
    final subtitle = timeController.text;

    if (title.isNotEmpty && subtitle.isNotEmpty) {
      if (widget.entryIndex != null) {
        // Update existing entry
        provider.updateEducation(widget.entryIndex!, title, subtitle);
      } else {
        // Add new entry
        provider.addEducation(title, subtitle);
      }

      Navigator.pop(context); // Close the screen after saving
    } else {
      // Show an alert if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill out all fields.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.entryIndex != null ? 'Edit Education' : 'Add Education',
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Theme.of(context).colorScheme.onPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check,
                color: Theme.of(context).colorScheme.onPrimary),
            onPressed: _saveEducationInfo,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            _buildEditableField(
              label: 'School',
              controller: schoolController,
              hintText: 'Enter your school',
            ),
            _buildEditableField(
              label: 'Time',
              controller: timeController,
              hintText: 'Enter graduation date',
              isDateField: true,
              onTap: _selectMonthYear,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    bool isDateField = false,
    VoidCallback? onTap,
  }) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              child: Text(
                label,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: isDateField ? onTap : null,
                child: AbsorbPointer(
                  absorbing: isDateField,
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
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
    );
  }

  Future<void> _selectMonthYear() async {
    int selectedMonthIndex = DateTime.now().month - 1;
    int selectedYearIndex = 0;

    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 50,
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    final formattedDate =
                        "${years[selectedYearIndex]}.${(selectedMonthIndex + 1).toString().padLeft(2, '0')}";
                    timeController.text = formattedDate;
                    Navigator.pop(context);
                  },
                  child: const Text('Done', style: TextStyle(fontSize: 16)),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CupertinoPicker(
                        scrollController: FixedExtentScrollController(
                            initialItem: selectedMonthIndex),
                        itemExtent: 32.0,
                        onSelectedItemChanged: (int index) {
                          selectedMonthIndex = index;
                        },
                        children: months.map((month) => Text(month)).toList(),
                      ),
                    ),
                    Expanded(
                      child: CupertinoPicker(
                        scrollController: FixedExtentScrollController(
                            initialItem: selectedYearIndex),
                        itemExtent: 32.0,
                        onSelectedItemChanged: (int index) {
                          selectedYearIndex = index;
                        },
                        children:
                            years.map((year) => Text(year.toString())).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  final List<int> years =
      List.generate(100, (index) => DateTime.now().year - index);

  @override
  void dispose() {
    schoolController.dispose();
    timeController.dispose();
    super.dispose();
  }
}
