import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';

class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen({Key? key}) : super(key: key);

  @override
  _PreferenceScreenState createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {
  final List<Map<String, String>> regions = [
    {'name': 'Hindi', 'flag': '🇮🇳'},
    {'name': 'Español', 'flag': '🇪🇸'},
    {'name': 'Japanese', 'flag': '🇯🇵'},
    {'name': 'Bangla', 'flag': '🇧🇩'},
    {'name': 'Indonesia', 'flag': '🇮🇩'},
    {'name': 'Russian', 'flag': '🇷🇺'},
    {'name': 'Chinese', 'flag': '🇨🇳'},
    {'name': 'Bahasa', 'flag': '🇵🇭'},
    {'name': 'Tiếng Việt', 'flag': '🇻🇳'},
  ];

  final List<String> selectedRegions = [];

  final int maxSelection = 5;

  void toggleRegionSelection(String regionName) {
    setState(() {
      if (selectedRegions.contains(regionName)) {
        selectedRegions.remove(regionName);
      } else if (selectedRegions.length < maxSelection) {
        selectedRegions.add(regionName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: colorScheme(context).primary,
        title: Text(
          'Preference',
          style: textTheme(context)
              .titleSmall
              ?.copyWith(color: colorScheme(context).onPrimary),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorScheme(context).onPrimary),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check, color: colorScheme(context).onPrimary),
            onPressed: () {
              Navigator.pop(context, selectedRegions);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '5 regions can be selected at most',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: regions.length,
              itemBuilder: (context, index) {
                final region = regions[index];
                final isSelected = selectedRegions.contains(region['name']);

                return ListTile(
                  leading: Text(
                    region['flag']!,
                    style: const TextStyle(fontSize: 24),
                  ),
                  title: Text(region['name']!),
                  trailing: Icon(
                    isSelected
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    color: isSelected ? Colors.green : Colors.grey,
                  ),
                  onTap: () => toggleRegionSelection(region['name']!),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
