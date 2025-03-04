import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_svg/svg.dart';

class ReelPage extends StatefulWidget {
  const ReelPage({Key? key}) : super(key: key);

  @override
  State<ReelPage> createState() => _ReelPageState();
}

class _ReelPageState extends State<ReelPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leadingWidth: 0,
        backgroundColor: Colors.black,
        elevation: 0,
        title: TabBar(
          indicatorPadding: EdgeInsets.all(8),
          labelPadding: EdgeInsets.all(0),
          dividerColor: Colors.transparent,
          controller: _tabController,
          indicatorColor: Colors.red,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 2.0,
          tabs: const [
            Tab(text: 'Post'),
            Tab(text: 'Following'),
            Tab(text: 'For You'),
          ],
        ),
        actions: [
          InkWell(
              onTap: () {},
              child: Image.asset(
                AppImages.ringbell,
                height: 28,
                width: 28,
              )),
          const SizedBox(
            width: 8,
          ),
          InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                AppIcons.sent,
                height: 18,
                width: 18,
              )),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // Centered image with full width and specified height
                Center(
                  child: Container(
                    height: 240,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage(AppImages.streamer), // Placeholder image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // Action buttons
                Positioned(
                  right: 10,
                  bottom: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: toggleLike,
                        child: Icon(
                          Icons.favorite,
                          color: isLiked ? Colors.red : Colors.white,
                          size: 30,
                        ),
                      ),
                      const Text('5000', style: TextStyle(color: Colors.white)),
                      const SizedBox(height: 20),
                      Image.asset(
                        AppImages.comment, // Path to the share icon image
                        height: 30,
                        width: 30,
                      ),
                      const Text('6000', style: TextStyle(color: Colors.white)),
                      const SizedBox(height: 20),
                      SvgPicture.asset(
                        AppIcons.sent, // Path to SVG for share icon
                        height: 20,
                        width: 22,
                      ),
                      const Text('7000', style: TextStyle(color: Colors.white)),
                      const SizedBox(height: 20),
                      Image.asset(
                        AppImages.reddollar, // Path to the share icon image
                        height: 30,
                        width: 30,
                      ),
                      const Text('Tip', style: TextStyle(color: Colors.white)),
                      const SizedBox(height: 20),
                      const Icon(Icons.more_horiz,
                          color: Colors.white, size: 30),
                      const SizedBox(height: 20),
                      const Text('Tools',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                // Bottom bar with user info and music label
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.black.withOpacity(0.6),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage: AssetImage(AppImages
                                  .frameboy), // Placeholder profile image
                              radius: 16,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "John Cena",
                              style: textTheme(context).bodySmall?.copyWith(
                                    fontSize: 14,
                                    color: colorScheme(context).surface,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            // Expanded(
                            //   child: RichText(
                            //     text: const TextSpan(
                            //       children: [
                            //         TextSpan(
                            //           text: "@Putri•AriinyL x's ",
                            //           style: TextStyle(
                            //             color: Colors.red,
                            //             fontWeight: FontWeight.bold,
                            //           ),
                            //         ),
                            //         TextSpan(
                            //           text:
                            //               "Highlight. Come and follow them and watch their live broadcast together",
                            //           style: TextStyle(color: Colors.white),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            Spacer(),
                            IconButton(
                              icon: Icon(Icons.more_vert, color: Colors.white),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "@Putri•AriinyL x's ",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                              ),
                              TextSpan(
                                text:
                                    "Highlight. Come and follow them and watch their live broadcast together",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Bottom Music and users section
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.black,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.people, color: Colors.white),
                    const SizedBox(width: 4),
                    const Text("55 users",
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.music_note, color: Colors.white),
                    const SizedBox(width: 4),
                    const Text(
                      "Lorem metus porttitor purus",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
