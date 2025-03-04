import 'package:flutter/material.dart';

import '../../common/const/global_variables.dart';

class CountrySelectionPage extends StatefulWidget {
  const CountrySelectionPage({super.key});

  @override
  _CountrySelectionPageState createState() => _CountrySelectionPageState();
}

class _CountrySelectionPageState extends State<CountrySelectionPage> {
  String selectedCountry = ""; // Initially, no country is selected
  String selectedRegion = "Asia"; // Default selected region

  final Map<String, List<String>> regions = {
    "Asia": [
      "India",
      "Saudi Arabia",
      "Indonesia",
      "Pakistan",
      "Iraq",
      "Thailand",
      "Malaysia",
      "Philippines",
      "Australia",
      "Turkey",
      "Kuwait",
      "UAE",
      "Kazakhstan",
      "Taiwan",
      "Iran",
      "Qatar",
      "Nepal",
      "Japan",
      "Singapore",
      "Hongkong",
      "Oman",
      "Vietnam",
      "Bangladesh",
      "China",
    ],
    "Europe": [
      "England",
      "France",
      "Germany",
      "Italy",
      "Spain",
    ],
    "Africa": [
      "Nigeria",
      "South Africa",
      "Kenya",
      "Egypt",
      "Morocco",
    ],
    // Add more regions as needed
  };

  List<String> get countries => regions[selectedRegion] ?? [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            Text(
              "Countries & Regions",
              style: TextStyle(
                color: colorScheme(context).surface,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: BorderSide(
                  color: colorScheme(context).onSurface, // Border color
                  width: 1.5, // Border width
                ),
              ),
              value: selectedCountry.isNotEmpty, // Only checked if a country is selected
              onChanged: (value) {
                setState(() {
                  // Clear the selection if checkbox is unchecked
                  selectedCountry = value == true ? selectedCountry : "";
                });
              },
              checkColor: Colors.red,
              activeColor: colorScheme(context).surface, // Use surface color
            ),
          ],
        ),
        backgroundColor: colorScheme(context).error,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: colorScheme(context).surface,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.public_outlined),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  value: selectedRegion,
                  items: regions.keys.map((String region) {
                    return DropdownMenuItem<String>(
                      value: region,
                      child: Text(
                        region,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedRegion = newValue!;
                      selectedCountry = ""; // Clear selection on region change
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3,
                ),
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  final country = countries[index];
                  final isSelected = selectedCountry == country;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCountry = country;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: colorScheme(context).surface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                              ? colorScheme(context).error
                              : colorScheme(context).outline.withOpacity(0.2),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        country,
                        style: TextStyle(
                          fontSize: 14,
                          color: isSelected
                              ? colorScheme(context).error
                              : colorScheme(context).onSurface,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
