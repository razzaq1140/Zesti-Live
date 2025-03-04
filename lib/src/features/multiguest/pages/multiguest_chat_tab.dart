import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/multiguest/modals/chat_modal.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../common/const/app_images.dart';
import '../../../common/const/global_variables.dart';

class MultiguestChatTab extends StatefulWidget {
  const MultiguestChatTab({super.key});

  @override
  MultiguestChatTabState createState() => MultiguestChatTabState();
}

class MultiguestChatTabState extends State<MultiguestChatTab> {
  @override
  Widget build(BuildContext context) {
    final List<ChatData> chatDataList = [
      ChatData(
        viewCount: '200',
        imageUrl: AppNetworkImages.networkOne,
        message: "Good Morning Guys",
        location: "In Spain",
        avatarUrls: [
          AppNetworkImages.networkOne,
          AppNetworkImages.networkThree,
          AppNetworkImages.networkFour,
        ],
      ),
      ChatData(
        viewCount: '300',
        imageUrl: AppNetworkImages.networkThree,
        message: "Hello Everyone",
        location: "In Paris",
        avatarUrls: [],
      ),
      ChatData(
        viewCount: '400',
        imageUrl: AppNetworkImages.networkFour,
        message: "Good Morning Guys",
        location: "In Spain",
        avatarUrls: [
          AppNetworkImages.networkOne,
          AppNetworkImages.networkThree,
          AppNetworkImages.networkFour,
        ],
      ),
      ChatData(
        viewCount: '200',
        imageUrl: AppNetworkImages.networkFive,
        message: "Hello Everyone",
        location: "In Paris",
        avatarUrls: [],
      ),
      ChatData(
        viewCount: '300',
        imageUrl: AppNetworkImages.networkSix,
        message: "Good Morning Guys",
        location: "In Spain",
        avatarUrls: [
          AppNetworkImages.networkOne,
          AppNetworkImages.networkThree,
          AppNetworkImages.networkFour,
        ],
      ),
      ChatData(
        viewCount: '400',
        imageUrl: AppNetworkImages.networkSeven,
        message: "Hello Everyone",
        location: "In Paris",
        avatarUrls: [],
      ),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.78,
          ),
          itemCount: chatDataList.length,
          itemBuilder: (context, index) {
            final chatData = chatDataList[index];

            return GestureDetector(
              onTap: () {
                context.pushNamed(AppRoute.chatting);
              },
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              height: 170,
                              imageUrl: chatData.imageUrl,
                              placeholder: (context, url) => const Center(
                                child: Center(
                                  child: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) => Center(
                                child: Icon(
                                  Icons.error,
                                  color: Theme.of(context).colorScheme.error,
                                  size: 20,
                                ),
                              ),
                              fit: BoxFit.fill,
                              width: double.infinity,
                            ),
                          ),
                          if (chatData.avatarUrls.isNotEmpty)
                            Positioned(
                              bottom: 10,
                              left: 10,
                              right: 10,
                              child: SizedBox(
                                height: 40,
                                child: Stack(
                                  children: chatData.avatarUrls
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                    int i = entry.key;
                                    String avatarUrl = entry.value;
                                    return Positioned(
                                      left: i * 25.0,
                                      child: Stack(
                                        children: [
                                          CircleAvatar(
                                            foregroundImage:
                                                NetworkImage(avatarUrl),
                                            radius: 17,
                                            child: const Icon(Icons.person,
                                                size: 20),
                                          ),
                                          Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: SvgPicture.asset(
                                                  AppIcons.genderIcon))
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  chatData.viewCount,
                                  style: textTheme(context).bodySmall?.copyWith(
                                      color: colorScheme(context).onPrimary,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      chatData.message,
                      style: textTheme(context)
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_on,
                            size: 9,
                            color: colorScheme(context)
                                .onSurface
                                .withOpacity(0.5)),
                        Text(
                          chatData.location,
                          style: textTheme(context).labelSmall?.copyWith(
                              color: colorScheme(context)
                                  .onSurface
                                  .withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
