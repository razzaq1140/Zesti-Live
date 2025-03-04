import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/provider/edit_profile_provider.dart';
import 'package:provider/provider.dart';

class CareerScreen extends StatefulWidget {
  final int? entryIndex; // Optional index parameter for editing

  const CareerScreen({Key? key, this.entryIndex}) : super(key: key);

  @override
  _CareerScreenState createState() => _CareerScreenState();
}

class _CareerScreenState extends State<CareerScreen> {
  // Controllers for the text fields
  late TextEditingController positionController;
  late TextEditingController companyController;
  late TextEditingController fromController;
  late TextEditingController toController;

  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isInitialized) {
      final provider = Provider.of<EditProfileProvider>(context, listen: false);

      // If entryIndex is provided, load existing data
      if (widget.entryIndex != null) {
        final entry = provider.careerEntries[widget.entryIndex!];
        positionController = TextEditingController(text: entry['position']);
        companyController = TextEditingController(text: entry['company']);
        fromController = TextEditingController(text: entry['startDate']);
        toController = TextEditingController(text: entry['endDate']);
      } else {
        // Initialize controllers for a new entry
        positionController = TextEditingController();
        companyController = TextEditingController();
        fromController = TextEditingController();
        toController = TextEditingController();
      }

      _isInitialized = true; // Prevents reinitialization
    }
  }

  // Save or update career information
  void _saveCareerInfo() {
    final provider = Provider.of<EditProfileProvider>(context, listen: false);

    final position = positionController.text;
    final company = companyController.text;
    final startDate = fromController.text;
    final endDate = toController.text;

    if (position.isNotEmpty && company.isNotEmpty && startDate.isNotEmpty && endDate.isNotEmpty) {
      if (widget.entryIndex != null) {
        // Update existing entry
        provider.removeCareer(widget.entryIndex!);
        provider.addCareer(position, company, startDate, endDate);
      } else {
        // Add new entry
        provider.addCareer(position, company, startDate, endDate);
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
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.entryIndex != null ? 'Edit Career' : 'Add Career',
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.onPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check, color: Theme.of(context).colorScheme.onPrimary),
            onPressed: _saveCareerInfo,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            _buildEditableField(
              label: 'Position',
              controller: positionController,
              hintText: 'Enter your job title',
            ),
            _buildEditableField(
              label: 'Company',
              controller: companyController,
              hintText: 'Enter company name',
            ),
            _buildEditableField(
              label: 'From',
              controller: fromController,
              hintText: 'Select start date',
              isDateField: true,
              onTap: () => _selectMonthYear(context, isFromDate: true),
            ),
            _buildEditableField(
              label: 'To',
              controller: toController,
              hintText: 'Select end date',
              isDateField: true,
              onTap: () => _selectMonthYear(context, isFromDate: false),
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

  Future<void> _selectMonthYear(BuildContext context, {required bool isFromDate}) async {
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
                    final formattedDate = "${years[selectedYearIndex]}.${(selectedMonthIndex + 1).toString().padLeft(2, '0')}";
                    if (isFromDate) {
                      fromController.text = formattedDate;
                    } else {
                      toController.text = formattedDate;
                    }
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
                        scrollController: FixedExtentScrollController(initialItem: selectedMonthIndex),
                        itemExtent: 32.0,
                        onSelectedItemChanged: (int index) {
                          selectedMonthIndex = index;
                        },
                        children: months.map((month) => Text(month)).toList(),
                      ),
                    ),
                    Expanded(
                      child: CupertinoPicker(
                        scrollController: FixedExtentScrollController(initialItem: selectedYearIndex),
                        itemExtent: 32.0,
                        onSelectedItemChanged: (int index) {
                          selectedYearIndex = index;
                        },
                        children: years.map((year) => Text(year.toString())).toList(),
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
  final List<int> years = List.generate(100, (index) => DateTime.now().year - index);

  @override
  void dispose() {
    positionController.dispose();
    companyController.dispose();
    fromController.dispose();
    toController.dispose();
    super.dispose();
  }
}
