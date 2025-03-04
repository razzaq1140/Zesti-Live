import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_textfield.dart';

class AddLocationScreen extends StatefulWidget {
  const AddLocationScreen({super.key});

  @override
  AddLocationScreenState createState() => AddLocationScreenState();
}

class AddLocationScreenState extends State<AddLocationScreen> {
  final TextEditingController searchController = TextEditingController();
  final List<String> allLocations = [
    "Hide location\n7 Thule Drive, Sutherlands, Australia",
    "Brown Words\n65 Brown Street, New South Wales, Australia",
    "Avenue\n36 Warren Avenue, Dora Creek, Sutherlands, Australia",
    "Scoresby\n5 Hebbard Street, Victoria, Australia",
    "Dykehead\n3 Hillsdale Road, Queensland, Australia",
    "Warner Lands\n65 Brown Street, New South Wales, Australia",
  ];

  List<String> filteredLocations = [];

  @override
  void initState() {
    super.initState();
    filteredLocations = allLocations;
    searchController.addListener(_filterLocations);
  }

  @override
  void dispose() {
    searchController.removeListener(_filterLocations);
    searchController.dispose();
    super.dispose();
  }

  void _filterLocations() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredLocations = allLocations
          .where((location) => location.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: colorScheme(context).onPrimary),
        backgroundColor: colorScheme(context).primary,
        title: Text(
          "Add Location",
          style: textTheme(context).titleSmall?.copyWith(
              color: colorScheme(context).onPrimary,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextFormField(
              controller: searchController,
              hint: "I Find a location",
              hintColor: AppColor.textGrey,
              suffixIcon: IconButton(
                onPressed: () {
                  searchController.clear();
                },
                icon: const Icon(
                  Icons.close,
                  size: 17,
                ),
              ),
              fillColor: AppColor.textGrey.withOpacity(0.2),
              borderRadius: 30,
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: filteredLocations.length,
                itemBuilder: (context, index) {
                  final location = filteredLocations[index];
                  final locationParts =
                      location.split('\n'); // Split title and address

                  return ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: locationParts[0],
                            style: textTheme(context).titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                          ),
                          TextSpan(
                            text: '\n${locationParts[1]}',
                            style: textTheme(context).bodySmall?.copyWith(
                                  color: AppColor.textGrey,
                                ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context, location);
                    },
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
