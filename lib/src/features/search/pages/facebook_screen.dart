import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../common/const/app_colors.dart';
import '../../../common/const/app_images.dart';
import '../../../common/const/global_variables.dart';

class FacebookScreen extends StatelessWidget {
  const FacebookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  List<FacebookFriends> facebooks = [
      FacebookFriends(
        trailingicon: AppIcons.circleCheck,
        name: 'Jannete King',
        rating: '4.5',
        avatarUrl: AppImages.allPopularScreen,
      ),
      FacebookFriends(
        trailingicon: AppIcons.circlePlus,
        name: 'Alex Johnson',
        rating: '4.8',
        avatarUrl: AppImages.allPopularScreen,
      ),
      FacebookFriends(
        trailingicon: AppIcons.bothFollow,
        name: 'Emily Davis',
        rating: '4.6',
        avatarUrl: AppImages.allPopularScreen,
      ),
      FacebookFriends(
        trailingicon: AppIcons.circleCheck,
        name: 'Michael Brown',
        rating: '4.3',
        avatarUrl: AppImages.allPopularScreen,
      ),
      FacebookFriends(
        trailingicon: AppIcons.circlePlus,
        name: 'Sophia Wilson',
        rating: '4.7',
        avatarUrl: AppImages.allPopularScreen,
      ),
      FacebookFriends(
        trailingicon: AppIcons.circleCheck,
        name: 'Jannete King',
        rating: '4.5',
        avatarUrl: AppImages.allPopularScreen,
      ),
      FacebookFriends(
        trailingicon: AppIcons.circlePlus,
        name: 'Alex Johnson',
        rating: '4.8',
        avatarUrl: AppImages.allPopularScreen,
      ),
      FacebookFriends(
        trailingicon: AppIcons.bothFollow,
        name: 'Emily Davis',
        rating: '4.6',
        avatarUrl: AppImages.allPopularScreen,
      ),
      FacebookFriends(
        trailingicon: AppIcons.circleCheck,
        name: 'Michael Brown',
        rating: '4.3',
        avatarUrl: AppImages.allPopularScreen,
      ),
      FacebookFriends(
        trailingicon: AppIcons.circlePlus,
        name: 'Sophia Wilson',
        rating: '4.7',
        avatarUrl: AppImages.allPopularScreen,
      ),
      FacebookFriends(
        trailingicon: AppIcons.circleCheck,
        name: 'Jannete King',
        rating: '4.5',
        avatarUrl: AppImages.allPopularScreen,
      ),
      FacebookFriends(
        trailingicon: AppIcons.circlePlus,
        name: 'Alex Johnson',
        rating: '4.8',
        avatarUrl: AppImages.allPopularScreen,
      ),
      FacebookFriends(
        trailingicon: AppIcons.bothFollow,
        name: 'Emily Davis',
        rating: '4.6',
        avatarUrl: AppImages.allPopularScreen,
      ),
      FacebookFriends(
        trailingicon: AppIcons.circleCheck,
        name: 'Michael Brown',
        rating: '4.3',
        avatarUrl: AppImages.allPopularScreen,
      ),
      FacebookFriends(
        trailingicon: AppIcons.circlePlus,
        name: 'Sophia Wilson',
        rating: '4.7',
        avatarUrl: AppImages.allPopularScreen,
      ),
      FacebookFriends(
        trailingicon: AppIcons.circleCheck,
        name: 'Jannete King',
        rating: '4.5',
        avatarUrl: AppImages.allPopularScreen,
      ),
      FacebookFriends(
        trailingicon: AppIcons.circlePlus,
        name: 'Alex Johnson',
        rating: '4.8',
        avatarUrl: AppImages.allPopularScreen,
      ),
      FacebookFriends(
        trailingicon: AppIcons.bothFollow,
        name: 'Emily Davis',
        rating: '4.6',
        avatarUrl: AppImages.allPopularScreen,
      ),
      FacebookFriends(
        trailingicon: AppIcons.circleCheck,
        name: 'Michael Brown',
        rating: '4.3',
        avatarUrl: AppImages.allPopularScreen,
      ),
      FacebookFriends(
        trailingicon: AppIcons.circlePlus,
        name: 'Sophia Wilson',
        rating: '4.7',
        avatarUrl: AppImages.allPopularScreen,
      ),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          foregroundColor: colorScheme(context).onPrimary,
          backgroundColor: colorScheme(context).primary,
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: Text(
            'Facebook Friends',
            style: textTheme(context)
                .titleSmall
                ?.copyWith(color: colorScheme(context).onPrimary),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: FacebookSearchDelegate(facebookFriends: facebooks),
                );
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(12.0),
                child: ListView.builder(
                  itemCount: facebooks.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                foregroundImage:
                                    NetworkImage(facebooks[index].avatarUrl),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  height: 14,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColor.tagBlue,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: colorScheme(context).surface),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 6,
                                        color: colorScheme(context).onPrimary,
                                      ),
                                      const SizedBox(width: 2),
                                      Text(
                                        facebooks[index].rating,
                                        style: textTheme(context)
                                            .labelSmall
                                            ?.copyWith(
                                              fontSize: 8,
                                              color: colorScheme(context)
                                                  .onPrimary,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          title: Text(
                            facebooks[index].name,
                            style: textTheme(context)
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon:
                                SvgPicture.asset(facebooks[index].trailingicon),
                          ),
                        ),
                        Divider(
                          color: colorScheme(context).outlineVariant,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 30,
              left: 30,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: colorScheme(context).primary,
                  foregroundColor: colorScheme(context).onPrimary,
                ),
                onPressed: () {
                  context.pop();
                },
                child: Text(
                  'Invite Contacts',
                  style: textTheme(context).titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: colorScheme(context).onPrimary,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// The search delegate for filtering Facebook friends
class FacebookSearchDelegate extends SearchDelegate<FacebookFriends?> {
  final List<FacebookFriends> facebookFriends;

  FacebookSearchDelegate({required this.facebookFriends});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<FacebookFriends> results = facebookFriends
        .where(
            (friend) => friend.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return _buildFriendList(context, results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<FacebookFriends> suggestions = facebookFriends
        .where(
            (friend) => friend.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return _buildFriendList(context, suggestions);
  }

  Widget _buildFriendList(BuildContext context, List<FacebookFriends> friends) {
    return ListView.builder(
      itemCount: friends.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            foregroundImage: NetworkImage(friends[index].avatarUrl),
          ),
          title: Text(friends[index].name),
          subtitle: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star, size: 12, color: Colors.orange),
              SizedBox(width: 4),
              Text(friends[index].rating),
            ],
          ),
          trailing: SvgPicture.asset(
            friends[index].trailingicon,
            height: 24,
            width: 24,
          ),
          onTap: () {
            close(context, friends[index]);
          },
        );
      },
    );
  }
}

// The FacebookFriends model to represent each friend
class FacebookFriends {
  final String trailingicon;
  final String name;
  final String rating;
  final String avatarUrl;

  FacebookFriends({
    required this.trailingicon,
    required this.name,
    required this.rating,
    required this.avatarUrl,
  });
}











  // List<FacebookFriends> facebooks = [
  //     FacebookFriends(
  //       trailingicon: AppIcons.circleCheck,
  //       name: 'Jannete King',
  //       rating: '4.5',
  //       avatarUrl: AppImages.allPopularScreen,
  //     ),
  //     FacebookFriends(
  //       trailingicon: AppIcons.circlePlus,
  //       name: 'Alex Johnson',
  //       rating: '4.8',
  //       avatarUrl: AppImages.allPopularScreen,
  //     ),
  //     FacebookFriends(
  //       trailingicon: AppIcons.bothFollow,
  //       name: 'Emily Davis',
  //       rating: '4.6',
  //       avatarUrl: AppImages.allPopularScreen,
  //     ),
  //     FacebookFriends(
  //       trailingicon: AppIcons.circleCheck,
  //       name: 'Michael Brown',
  //       rating: '4.3',
  //       avatarUrl: AppImages.allPopularScreen,
  //     ),
  //     FacebookFriends(
  //       trailingicon: AppIcons.circlePlus,
  //       name: 'Sophia Wilson',
  //       rating: '4.7',
  //       avatarUrl: AppImages.allPopularScreen,
  //     ),
  //     FacebookFriends(
  //       trailingicon: AppIcons.circleCheck,
  //       name: 'Jannete King',
  //       rating: '4.5',
  //       avatarUrl: AppImages.allPopularScreen,
  //     ),
  //     FacebookFriends(
  //       trailingicon: AppIcons.circlePlus,
  //       name: 'Alex Johnson',
  //       rating: '4.8',
  //       avatarUrl: AppImages.allPopularScreen,
  //     ),
  //     FacebookFriends(
  //       trailingicon: AppIcons.bothFollow,
  //       name: 'Emily Davis',
  //       rating: '4.6',
  //       avatarUrl: AppImages.allPopularScreen,
  //     ),
  //     FacebookFriends(
  //       trailingicon: AppIcons.circleCheck,
  //       name: 'Michael Brown',
  //       rating: '4.3',
  //       avatarUrl: AppImages.allPopularScreen,
  //     ),
  //     FacebookFriends(
  //       trailingicon: AppIcons.circlePlus,
  //       name: 'Sophia Wilson',
  //       rating: '4.7',
  //       avatarUrl: AppImages.allPopularScreen,
  //     ),
  //     FacebookFriends(
  //       trailingicon: AppIcons.circleCheck,
  //       name: 'Jannete King',
  //       rating: '4.5',
  //       avatarUrl: AppImages.allPopularScreen,
  //     ),
  //     FacebookFriends(
  //       trailingicon: AppIcons.circlePlus,
  //       name: 'Alex Johnson',
  //       rating: '4.8',
  //       avatarUrl: AppImages.allPopularScreen,
  //     ),
  //     FacebookFriends(
  //       trailingicon: AppIcons.bothFollow,
  //       name: 'Emily Davis',
  //       rating: '4.6',
  //       avatarUrl: AppImages.allPopularScreen,
  //     ),
  //     FacebookFriends(
  //       trailingicon: AppIcons.circleCheck,
  //       name: 'Michael Brown',
  //       rating: '4.3',
  //       avatarUrl: AppImages.allPopularScreen,
  //     ),
  //     FacebookFriends(
  //       trailingicon: AppIcons.circlePlus,
  //       name: 'Sophia Wilson',
  //       rating: '4.7',
  //       avatarUrl: AppImages.allPopularScreen,
  //     ),
  //     FacebookFriends(
  //       trailingicon: AppIcons.circleCheck,
  //       name: 'Jannete King',
  //       rating: '4.5',
  //       avatarUrl: AppImages.allPopularScreen,
  //     ),
  //     FacebookFriends(
  //       trailingicon: AppIcons.circlePlus,
  //       name: 'Alex Johnson',
  //       rating: '4.8',
  //       avatarUrl: AppImages.allPopularScreen,
  //     ),
  //     FacebookFriends(
  //       trailingicon: AppIcons.bothFollow,
  //       name: 'Emily Davis',
  //       rating: '4.6',
  //       avatarUrl: AppImages.allPopularScreen,
  //     ),
  //     FacebookFriends(
  //       trailingicon: AppIcons.circleCheck,
  //       name: 'Michael Brown',
  //       rating: '4.3',
  //       avatarUrl: AppImages.allPopularScreen,
  //     ),
  //     FacebookFriends(
  //       trailingicon: AppIcons.circlePlus,
  //       name: 'Sophia Wilson',
  //       rating: '4.7',
  //       avatarUrl: AppImages.allPopularScreen,
  //     ),
  //   ];
