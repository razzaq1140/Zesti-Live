import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../common/const/global_variables.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Contact> contacts = [
      Contact(
        trailingicon: AppIcons.circleCheck,
        name: 'Jannete King',
        rating: '4.5',
        avatarUrl: AppImages.allPopularScreen,
      ),
      Contact(
        trailingicon: AppIcons.circlePlus,
        name: 'Alex Johnson',
        rating: '4.8',
        avatarUrl: AppImages.allPopularScreen,
      ),
      Contact(
        trailingicon: AppIcons.bothFollow,
        name: 'Emily Davis',
        rating: '4.6',
        avatarUrl: AppImages.allPopularScreen,
      ),
      // Add more contacts here as needed
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
            'Contacts',
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
                  delegate: ContactSearchDelegate(contacts: contacts),
                );
              },
            ),
          ],
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: contacts.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
                                    NetworkImage(contacts[index].avatarUrl),
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
                                        contacts[index].rating,
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
                            contacts[index].name,
                            style: textTheme(context)
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon:
                                SvgPicture.asset(contacts[index].trailingicon),
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

class Contact {
  final String trailingicon;
  final String name;
  final String rating;
  final String avatarUrl;

  Contact({
    required this.trailingicon,
    required this.name,
    required this.rating,
    required this.avatarUrl,
  });
}

class ContactSearchDelegate extends SearchDelegate<Contact?> {
  final List<Contact> contacts;

  ContactSearchDelegate({required this.contacts});

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
    final List<Contact> results = contacts
        .where((contact) =>
            contact.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return _buildContactList(context, results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Contact> suggestions = contacts
        .where((contact) =>
            contact.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return _buildContactList(context, suggestions);
  }

  Widget _buildContactList(BuildContext context, List<Contact> contactList) {
    return ListView.builder(
      itemCount: contactList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            foregroundImage: NetworkImage(contactList[index].avatarUrl),
          ),
          title: Text(contactList[index].name),
          subtitle: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star, size: 12, color: Colors.orange),
              SizedBox(width: 4),
              Text(contactList[index].rating),
            ],
          ),
          trailing: SvgPicture.asset(
            contactList[index].trailingicon,
            height: 24,
            width: 24,
          ),
          onTap: () {
            close(context, contactList[index]);
          },
        );
      },
    );
  }
}
