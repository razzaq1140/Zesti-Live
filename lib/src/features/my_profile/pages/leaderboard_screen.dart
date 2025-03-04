import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.leaderboardBackground,
              fit: BoxFit.cover,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text(
                        "Leaderboard",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                ),
                TabBar(
                  tabAlignment: TabAlignment.center,
                  indicatorPadding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                  indicatorSize: TabBarIndicatorSize.tab,
                  padding: const EdgeInsets.all(0),
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colorScheme(context).surface.withOpacity(0.5),
                  ),
                  labelColor: colorScheme(context).onPrimary,
                  unselectedLabelColor:
                      colorScheme(context).onPrimary.withOpacity(0.5),
                  tabs: const [
                    Tab(text: "Daily"),
                    Tab(text: "Weekly"),
                    Tab(text: "Monthly"),
                    Tab(text: "Totally"),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _buildLeaderboardTab(context),
                      _buildLeaderboardTab(context),
                      _buildLeaderboardTab(context),
                      _buildLeaderboardTab(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ColorScheme colorScheme(BuildContext context) {
    return Theme.of(context).colorScheme;
  }

  Widget _buildLeaderboardTab(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTopWinner("Myrtie Clarke", "129652",
                  AppIcons.levelbadgesilver, 80, AppNetworkImages.networkOne),
              _buildTopWinner("Betty Vegaaaa", "156326",
                  AppIcons.levelbadgegold, 100, AppNetworkImages.networkThree),
              _buildTopWinner("Ida Palmersss", "123625",
                  AppIcons.levelbadgebronze, 80, AppNetworkImages.networkFour),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return _buildLeaderboardItem(index + 4);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTopWinner(String name, String score, String crownImage,
      double size, String foregroundImage) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SvgPicture.asset(crownImage, width: size * 1.4, height: size * 1.4),
            Positioned(
              bottom: 4,
              child: CircleAvatar(
                radius: size / 2,
                backgroundImage: NetworkImage(foregroundImage),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcons.goldpoints, width: 16, height: 16),
            const SizedBox(width: 4),
            Text(score, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ],
    );
  }

  Widget _buildLeaderboardItem(int rank) {
    final List<Map<String, String>> names = [
      {"name": "Johnny Rios", "image": AppNetworkImages.networkOne},
      {"name": "Alfred Hodges", "image": AppNetworkImages.networkTwelve},
      {"name": "Jayden Hansen", "image": AppNetworkImages.networkThirteen},
      {"name": "Dora Hines", "image": AppNetworkImages.networkThree},
      {"name": "Joel Sherman", "image": AppNetworkImages.networkFifteen},
      {"name": "Isaiah McGee", "image": AppNetworkImages.networkSeven},
      {"name": "John Doe", "image": AppNetworkImages.networkNineteen},
      {"name": "Jane Smith", "image": AppNetworkImages.networkTwenty},
    ];
    final score = (1000000 - rank * 5000).toString();
    final user = names[(rank - 4) % names.length];

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user["image"]!),
      ),
      title: Text(user["name"]!,
          style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle:
          Text(rank.toString(), style: const TextStyle(color: Colors.grey)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(AppIcons.goldpoints),
          const SizedBox(width: 4),
          Text(score,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.redAccent)),
        ],
      ),
    );
  }
}
