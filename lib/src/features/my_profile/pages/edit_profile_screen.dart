import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/pages/add_education_screen.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/pages/career_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import '../provider/edit_profile_provider.dart';
import '../widgets/addablefields.dart';
import '../widgets/editprofile_header.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const EditProfileHeader(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  EditableFieldWidget(
                    label: 'Name',
                    getValue: (context) =>
                        context.read<EditProfileProvider>().name,
                    updateValue: (context, value) =>
                        context.read<EditProfileProvider>().updateName(value),
                  ),
                  const GenderFieldWidget(),
                  const DatePickerFieldWidget(),
                  const CountryPickerFieldWidget(),
                  EditableFieldWidget(
                    label: 'Yeahlive ID',
                    getValue: (context) =>
                        context.read<EditProfileProvider>().yeahliveID,
                    updateValue: (context, value) => context
                        .read<EditProfileProvider>()
                        .updateYeahliveID(value),
                  ),
                  EditableFieldWidget(
                    label: 'Bio',
                    getValue: (context) =>
                        context.read<EditProfileProvider>().bio,
                    updateValue: (context, value) =>
                        context.read<EditProfileProvider>().updateBio(value),
                  ),
                  const SizedBox(height: 16),
                  SectionWithChipsWidget(
                    title: 'Interests',
                    initialChips: const ['Traveling', 'Dancing'],
                    onChipDeleted: (chip) {},
                  ),
                  SectionWithChipsWidget(
                    title: 'Skills',
                    initialChips: const [
                      'Collaboration',
                      'Prototyping',
                      'UI into figma'
                    ],
                    onChipDeleted: (chip) {},
                  ),
                  PreferenceSectionWidget(
                    onTap: () {
                      context.pushNamed(AppRoute.preferencescreen);
                    },
                  ),
                  AddableFieldWidget(
                    section: 'Education',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EducationScreen()));
                    },
                  ),
                  AddableFieldWidget(
                    section: 'Career',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CareerScreen()));
                    },
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
            maxLength: 80, // Limit character input to 80 characters
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
                updateValue(context, controller.text);
                Navigator.of(context).pop();
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}

class GenderFieldWidget extends StatelessWidget {
  const GenderFieldWidget({Key? key}) : super(key: key);

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
              const SizedBox(
                width: 100,
                child: Text('Gender',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
              ),
              Expanded(
                child: Consumer<EditProfileProvider>(
                  builder: (context, provider, child) {
                    return GestureDetector(
                      onTap: () {
                        _showGenderBottomSheet(context, provider);
                      },
                      child: Text(
                        provider.gender,
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

  void _showGenderBottomSheet(
      BuildContext context, EditProfileProvider provider) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: ['Male', 'Female', 'Other'].map((String gender) {
            return ListTile(
              title: Text(gender),
              onTap: () {
                provider.updateGender(gender);
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }
}

class DatePickerFieldWidget extends StatelessWidget {
  const DatePickerFieldWidget({Key? key}) : super(key: key);

  Future<void> _selectDate(
      BuildContext context, EditProfileProvider provider) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      provider.updateBirthday(
          "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}");
    }
  }

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
              const SizedBox(
                width: 100,
                child: Text('Birthday',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
              ),
              Expanded(
                child: Consumer<EditProfileProvider>(
                  builder: (context, provider, child) {
                    return GestureDetector(
                      onTap: () => _selectDate(context, provider),
                      child: Text(
                        provider.birthday ?? 'Select Birthday',
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
}

class CountryPickerFieldWidget extends StatelessWidget {
  const CountryPickerFieldWidget({super.key});

  void _showCountryPicker(BuildContext context, EditProfileProvider provider) {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        provider.updateCountry(country.name, flag: country.flagEmoji);
      },
    );
  }

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
              const SizedBox(
                width: 100,
                child: Text('Home town',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
              ),
              Expanded(
                child: Consumer<EditProfileProvider>(
                  builder: (context, provider, child) {
                    return GestureDetector(
                      onTap: () => _showCountryPicker(context, provider),
                      child: Text(
                        ' ${provider.country ?? 'Select Country'} '
                        '${provider.countryFlag ?? ''}',
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
}

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
    _chips = List.from(widget.initialChips); // Initialize with initial chips
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

class PreferenceSectionWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const PreferenceSectionWidget({
    Key? key,
    this.title = 'Preferences',
    this.subtitle = 'Countries & regions',
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: onTap,
        ),
        const Divider(thickness: 1, height: 20),
      ],
    );
  }
}
