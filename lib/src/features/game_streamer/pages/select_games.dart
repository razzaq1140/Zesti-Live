import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_textfield.dart';

class SelectGamesPage extends StatefulWidget {
  const SelectGamesPage({super.key});

  @override
  State<SelectGamesPage> createState() => _SelectGamesPageState();
}

class _SelectGamesPageState extends State<SelectGamesPage> {
  String searchQuery = "";
  String selectedGameId =
      ""; // Unique identifier to ensure only one item is selected

  List<Map<String, String>> games = [
    {'name': 'Call Of Duty', 'image': AppImages.callofduty, 'section': 'C'},
    {'name': 'Cyberpunk', 'image': AppImages.cyberpunk, 'section': 'C'},
    {'name': 'Valhalla', 'image': AppImages.valhala, 'section': 'C'},
    {'name': 'Hogwarts', 'image': AppImages.hogwarts, 'section': 'C'},
    {'name': 'Among Us', 'image': AppImages.amongus, 'section': 'A'},
    {'name': 'Tetris', 'image': AppImages.tetris, 'section': 'A'},
    {'name': 'Last Of Us', 'image': AppImages.lastofus, 'section': 'A'},
    {'name': 'Napoleon', 'image': AppImages.napoleon, 'section': 'A'},
    {'name': 'Magic Wand', 'image': AppImages.magicwand, 'section': 'B'},
    {'name': 'GTA', 'image': AppImages.gta, 'section': 'B'},
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredGames = searchQuery.isNotEmpty
        ? games
            .where((game) =>
                game['name']!.toLowerCase().contains(searchQuery.toLowerCase()))
            .toList()
        : games;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: AppColor.dividerClr),
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: AppColor.dividerClr,
                    size: 14, // Adjust icon size to fit
                  ),
                ),
              ),
            ),
            const SizedBox(
                width: 8), // Space between back button and search bar
            Expanded(
              child: SizedBox(
                height: 36,
                child: CustomTextFormField(
                  hintSize: 13,
                  borderRadius: 30,
                  borderColor: AppColor.dividerClr,
                  hint: "Search for game",
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                    color: Colors.grey,
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              height: 36, // Set the desired height
              width: 60, // Set the desired width
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18), // Rounded corners
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      selectedGameId.isEmpty ? Colors.grey : Colors.red,
                  foregroundColor:
                      selectedGameId.isEmpty ? Colors.black : Colors.white,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: selectedGameId.isEmpty
                    ? null
                    : () {
                        final selectedGame = games.firstWhere((game) =>
                            "${game['name']}_${game['section']}" ==
                            selectedGameId);

                        Navigator.pop(context, {
                          'name': selectedGame['name']!,
                          'image': selectedGame['image']!,
                        });
                      },
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 13), // Adjust font size if needed
                ),
              ),
            ),
          ),
        ],
      ),
      
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (searchQuery.isEmpty) ...[
                Text(
                  "Popular",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 10),
                buildGridSection(
                    games.sublist(0, 6)), // Display first 6 games for Popular
              ],
              const SizedBox(height: 10),
              buildSearchResults(filteredGames),
              if (searchQuery.isEmpty) buildSection("A"),
              if (searchQuery.isEmpty) buildSection("B"),
              if (searchQuery.isEmpty) buildSection("C"),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchResults(List<Map<String, String>> filteredGames) {
    if (searchQuery.isEmpty) return Container();

    // Group filtered games by section
    Map<String, List<Map<String, String>>> groupedGames = {};
    for (var game in filteredGames) {
      groupedGames.putIfAbsent(game['section']!, () => []).add(game);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: groupedGames.entries.map((entry) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entry.key,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 10),
            buildGridSection(entry.value),
          ],
        );
      }).toList(),
    );
  }

  Widget buildSection(String section) {
    List<Map<String, String>> sectionGames =
        games.where((game) => game['section'] == section).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          section,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(height: 10),
        buildGridSection(sectionGames),
      ],
    );
  }

  Widget buildGridSection(List<Map<String, String>> gamesList) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3.5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: gamesList.length,
      itemBuilder: (context, index) {
        final game = gamesList[index];
        final gameId = "${game['name']}_${game['section']}"; // Unique ID
        return GameItem(
          name: game['name']!,
          imagePath: game['image']!,
          isSelected: selectedGameId == gameId,
          onTap: () {
            setState(() {
              selectedGameId = gameId;
            });
          },
        );
      },
    );
  }
}

class GameItem extends StatelessWidget {
  final String name;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const GameItem({
    required this.name,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 66,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.red : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(8),
          color: AppColor.offWhite,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                name,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.grey[800],
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
